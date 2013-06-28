(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay .2)

(defadvice company-idle-begin (around evil-company-idle-begin activate)
  (when (evil-insert-state-p)
    ad-do-it))

(evil-add-command-properties 'company-select-next :repeat 'ignore)
(evil-add-command-properties 'company-select-previous :repeat 'ignore)

(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
