(setq ag-highlight-search t)

(evil-define-key 'normal global-map (asok/leader-kbd "a") 'ag-project)
(evil-define-key 'normal global-map (asok/leader-kbd "w") 'ag)
