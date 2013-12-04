(add-hook 'after-init-hook #'global-flycheck-mode)

(eval-after-load 'flycheck
  '(progn
     (diminish 'flycheck-mode " Φ")
     (add-hook 'web-mode-hook '(lambda () (flycheck-mode -1)))
     (add-hook 'js-mode-hook '(lambda ()
				(when (and
				       (buffer-file-name)
				       (string-match-p "\\.js\\.+$" (buffer-file-name)))
				  (flycheck-mode -1))))
     (setq flycheck-highlighting-mode 'lines)
     (setq flycheck-idle-change-delay 1)
     (setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers))))

