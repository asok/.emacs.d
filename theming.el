(defadvice load-theme 
  (before theme-dont-propagate activate)
  (mapcar #'disable-theme custom-enabled-themes))

(require 'solarized)

(load-theme 'solarized-dark)

(setq evil-default-cursor '("white" t))

