(evil-define-key 'normal enh-ruby-mode-map (kbd ", h") 'robe-doc)
(add-hook 'enh-ruby-mode 'ruby-mode)

(add-hook 'robe-mode-hook (lambda ()
                            (add-to-list 'ac-sources 'ac-source-robe)
                            ;; (set-auto-complete-as-completion-at-point-function)
                            ))
