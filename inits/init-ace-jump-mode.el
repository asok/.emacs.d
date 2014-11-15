(asok/evil-define-key-when-global-map '(normal motion)
                                      (asok/leader-kbd "g") 'evil-ace-jump-word-mode
                                      (asok/leader-kbd "G") 'evil-ace-jump-char-mode)

(setq ace-jump-mode-scope 'window)
