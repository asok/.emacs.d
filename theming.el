(defadvice load-theme 
  (before theme-dont-propagate activate)
  (mapcar #'disable-theme custom-enabled-themes))

(require 'solarized)

(setq evil-default-cursor t)

(load-theme 'tangotango)
