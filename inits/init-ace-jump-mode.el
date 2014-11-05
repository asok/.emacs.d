(asok/evil-define-key-when-global-map '(normal motion)
                                      (kbd "SPC") 'evil-ace-jump-word-mode
                                      (kbd "C-SPC") 'evil-ace-jump-char-mode)

(setq ace-jump-mode-scope 'window)
