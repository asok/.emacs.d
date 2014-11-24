(require 'robe)

(evil-define-key 'normal enh-ruby-mode-map (asok/leader-kbd "n") 'robe-doc)
(evil-define-key 'normal ruby-mode-map (asok/leader-kbd "n") 'robe-doc)

(add-hook 'enh-ruby-mode-hook 'robe-mode)
(add-hook 'ruby-mode-hook 'robe-mode)

(setq robe-turn-on-eldoc nil)

(evil-define-key 'normal robe-mode-map (kbd "M-.") 'robe-jump)

(eval-after-load "company"
  '(push 'company-robe company-backends))

(eval-after-load 'robe
  '(diminish 'robe-mode " Ροβε"))
