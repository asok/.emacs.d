(add-hook 'after-init-hook #'global-flycheck-mode)

(setq flycheck-highlighting-mode 'lines)
(setq flycheck-idle-change-delay 1)

(add-hook 'emacs-lisp-mode-hook '(lambda () (flycheck-mode -1)))
