(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . enh-ruby-mode))

;; (add-hook 'enh-ruby-mode-hook 'asok/evil-paste-ad)

(setq enh-ruby-program "ruby")

(add-hook 'enh-ruby-mode-hook 'ruby-end-mode)

(add-hook 'enh-ruby-mode-hook 'asok/delete-trailing-whitespace-on-file-write)

(evil-define-key 'insert enh-ruby-mode-map (kbd "RET") 'evil-ret-and-indent)
