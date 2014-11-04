(setq ag-highlight-search t)

(evil-define-key 'normal global-map (asok/leader-kbd "s") 'ag-project)
(evil-define-key 'normal global-map (asok/leader-kbd "w") 'ag)
