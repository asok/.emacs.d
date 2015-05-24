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
     ;; (when (file-exists-p "~/.rubocop.yml")
     ;;   (setq flycheck-rubocoprc "~/.rubocop.yml"))
     (flycheck-add-mode 'javascript-eslint 'web-mode)
     (setq-default flycheck-highlighting-mode 'lines
                   flycheck-eslintrc "~/.eslintrc"
                   flycheck-idle-change-delay 1
                   flycheck-disabled-checkers '(ruby-rubocop javascript-jshint emacs-lisp-checkdoc))))
