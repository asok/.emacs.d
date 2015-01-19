(setq ag-highlight-search t)

(asok/evil-define-key-when-global-map '(normal motion emacs)
                                      (asok/leader-kbd "a") 'ag-project
                                      (asok/leader-kbd "w") 'ag)
