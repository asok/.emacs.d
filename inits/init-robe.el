(require 'robe)

(evil-define-key 'normal enh-ruby-mode-map (kbd ", n") 'robe-doc)
(evil-define-key 'normal ruby-mode-map (kbd ", n") 'robe-doc)

(add-hook 'enh-ruby-mode-hook 'robe-mode)
(add-hook 'ruby-mode-hook 'robe-mode)

(require 'auto-complete)
(push 'ac-source-robe ac-sources)

(setq robe-turn-on-eldoc nil)
