(defadvice load-theme 
  (before theme-dont-propagate activate)
  (mapcar #'disable-theme custom-enabled-themes))

(load-theme 'solarized-dark)

(setq evil-default-cursor '("white" t))
