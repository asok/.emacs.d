(defadvice load-theme
    (before theme-dont-propagate activate)
  (mapcar #'disable-theme custom-enabled-themes))

(defun asok/discover-themes ()
  (let ((root "~/.emacs.d/themes/"))
    (mapcar #'(lambda (dir) (add-to-list 'custom-theme-load-path (concat root dir)))
            (directory-files root nil "^[^.]+$"))))

(asok/discover-themes)

(require 'solarized)

(load-theme 'solarized-dark)
