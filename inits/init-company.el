(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(setq company-idle-delay nil
      company-auto-complete nil
      company-dabbrev-ignore-case nil
      company-dabbrev-code-ignore-case nil)

(define-key evil-insert-state-map "\C-n" nil)
(evil-define-key 'insert company-mode-map (kbd "C-n") 'company-complete)

(define-key company-active-map (kbd "C-n") #'company-select-next)
(define-key company-active-map (kbd "C-p") #'company-select-previous)
