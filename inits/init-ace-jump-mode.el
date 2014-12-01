(asok/evil-define-key-when-global-map '(normal motion)
                                      (asok/leader-kbd "SPC") 'evil-ace-jump-word-mode
                                      (asok/leader-kbd "C-SPC") 'evil-ace-jump-char-mode)

(setq ace-jump-mode-scope 'window)
