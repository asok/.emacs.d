(require 'robe)

(add-hook 'enh-ruby-mode-hook 'robe-mode)
(add-hook 'ruby-mode-hook 'robe-mode)

(setq robe-turn-on-eldoc nil)

(evil-define-key 'normal robe-mode-map (kbd "M-.") 'robe-jump)

(defun asok/push-company-robe ()
  (push 'company-robe company-backends))

(eval-after-load "company"
  '(add-hook 'robe-mode-hook #'asok/push-company-robe))

(eval-after-load 'robe
  '(diminish 'robe-mode " Ροβε"))
