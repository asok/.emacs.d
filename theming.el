(defadvice load-theme 
  (before theme-dont-propagate activate)
  (mapcar #'disable-theme custom-enabled-themes))

(require 'solarized)

(defun asok/toggle-solarized-theme ()
  (interactive)
  (if (member 'solarized-dark custom-enabled-themes)
      (progn
	(load-theme 'solarized-light)
	(setq evil-default-cursor '("black" t)))
    (load-theme 'solarized-dark)
    (setq evil-default-cursor '("white" t))))

;; (asok/toggle-solarized-theme)

;; (load-theme 'zenburn)
(require 'noname-theme)
(load-theme 'noname)
(setq evil-default-cursor '("white" t))

;; (custom-theme-set-faces
;;  'hickey
;;    `(font-lock-string-face ((t (:foreground "#999999")))))
