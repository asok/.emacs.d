(require 'robe)

(evil-define-key 'normal enh-ruby-mode-map (kbd ", n") 'robe-doc)
(evil-define-key 'normal ruby-mode-map (kbd ", n") 'robe-doc)

(add-hook 'enh-ruby-mode-hook 'robe-mode)
(add-hook 'ruby-mode-hook 'robe-mode)

(setq robe-turn-on-eldoc nil)

(evil-define-key 'normal robe-mode-map (kbd "M-.") 'robe-jump)

;; (add-hook 'robe-mode-hook 'robe-ac-setup)

(eval-after-load 'robe
  '(diminish 'robe-mode " Ροβε"))
