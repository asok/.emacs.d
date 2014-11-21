(defun asok/bundle-console ()
  (interactive)
  (projectile-with-default-dir (projectile-project-root)
    (call-interactively #'bundle-console)))
