(evil-define-key 'normal enh-ruby-mode-map (kbd ", h") 'robe-doc)
(add-hook 'enh-ruby-mode 'robe-mode)

(require 'company)
(push 'company-robe company-backends)
