(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq ring-bell-function 'ignore
      visible-bell nil
      inhibit-startup-screen t
      make-backup-files nil
      make-inhibited t
      auto-save-default nil
      indent-tabs-mode nil
      font-lock-maximum-decoration t
      auto-revert-verbose nil
      org-src-fontify-natively t)

(push "/usr/local/bin" exec-path)
(push "/opt/local/bin" exec-path)

(fset 'yes-or-no-p 'y-or-n-p)
;; (set-frame-font "Monospaced-14")	

(set-variable 'shell-file-name "/bin/bash")
(winner-mode 1)
(show-paren-mode t)
(auto-fill-mode nil)
(blink-cursor-mode -1)

(electric-pair-mode)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

;; Also auto refresh dired, but be quiet about it
;; (setq global-auto-revert-non-file-buffers t)

(require 'term)

(setq term-default-bg-color nil
      term-default-fg-color 'white)

(setq multi-term-program "/bin/bash")

(load "~/.emacs.d/bindings")
(load "~/.emacs.d/packages")
(asok/install-packages)
(asok/init-packages)
(load "~/.emacs.d/theming")

(server-start)
