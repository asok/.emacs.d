(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay .2)

(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
;; (defadvice company-select-next (after asok/company-selecr-next-and-insert activate)
;;     (company--insert-candidate (nth company-selection company-candidates)))
