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
      org-src-fontify-natively t
      gc-cons-threshold 20000000
      ido-auto-merge-work-directories-length -1
      ;;global-auto-revert-non-file-buffers t
      ns-right-alternate-modifier nil
      comint-process-echoes t)


(push "/usr/local/bin" exec-path)
(push "/opt/local/bin" exec-path)

(set-frame-font "Inconsolata-14")
(fset 'yes-or-no-p 'y-or-n-p)
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
(eval-after-load "ispell"
  '(when (executable-find ispell-program-name)
     (add-hook 'text-mode-hook 'turn-on-flyspell)))

(add-to-list 'auto-mode-alist '("\\.css$" . css-mode))
(add-to-list 'auto-mode-alist '("\\.zsh$" . sh-mode))

(load "~/.emacs.d/bindings")
(load "~/.emacs.d/packages")
(asok/install-packages)
(asok/init-packages)
(load "~/.emacs.d/theming")

(server-start)
