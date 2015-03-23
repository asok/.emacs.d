(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq ring-bell-function 'ignore
      visible-bell nil
      inhibit-startup-screen t
      make-backup-files nil
      make-inhibited t
      auto-save-default nil
      font-lock-maximum-decoration t
      auto-revert-verbose nil
      org-src-fontify-natively t
      gc-cons-threshold 20000000
      ido-auto-merge-work-directories-length -1
      ;;global-auto-revert-non-file-buffers t
      ns-right-alternate-modifier nil
      comint-process-echoes t
      browse-url-browser-function 'browse-url-default-browser
      split-height-threshold 100
      css-indent-offset 2
      js-indent-level 2
      dired-hide-details-hide-symlink-targets nil
      ;; split-width-threshold 100
      )
(setq-default indent-tabs-mode nil
              tab-width 2)

(push "/usr/local/bin" exec-path)
(push "/opt/local/bin" exec-path)

(setenv "LANG" "en_US.UTF-8")

(set-frame-font "Inconsolata-14")
(fset 'yes-or-no-p 'y-or-n-p)
(set-variable 'shell-file-name "/bin/bash")
(winner-mode 1)
(show-paren-mode t)
(auto-fill-mode nil)
(blink-cursor-mode -1)
(electric-pair-mode)
(add-hook 'ruby-mode #'electric-pair-mode) ; to disable it for ruby-mode

(global-prettify-symbols-mode 1)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(when (eq system-type 'darwin)
  (setq frame-resize-pixelwise t))

(toggle-frame-maximized)


(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
(eval-after-load "ispell"
  '(when (executable-find ispell-program-name)
     (add-hook 'text-mode-hook 'turn-on-flyspell)))

(add-to-list 'auto-mode-alist '("\\.css$" . css-mode))
(add-to-list 'auto-mode-alist '("\\.zsh$" . sh-mode))

(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

(add-hook 'dired-mode-hook #'auto-revert-mode)
(add-hook 'dired-mode-hook #'dired-hide-details-mode)

(load "~/.emacs.d/bindings")
(load "~/.emacs.d/packages")
(asok/install-packages)
(asok/init-packages)
(load "~/.emacs.d/theming")

;; (server-start)
