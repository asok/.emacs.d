(require 'robe)

(add-hook 'enh-ruby-mode-hook 'robe-mode)
(add-hook 'ruby-mode-hook 'robe-mode)

(setq robe-turn-on-eldoc nil)

(evil-define-key 'normal robe-mode-map (kbd "M-.") 'robe-jump)

(eval-after-load "company"
  '(push 'company-robe company-backends))

(eval-after-load 'robe
  '(diminish 'robe-mode " Ροβε"))
