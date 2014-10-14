(projectile-global-mode)
(require 'helm-projectile)

(define-prefix-command 'evil-projectile-mode-map)
(evil-define-key 'normal projectile-mode-map (kbd ", p") 'evil-projectile-mode-map)


(defadvice compilation-start (before projectile-set-current-projectile-root activate)
  (when (projectile-project-p)
    (setq projectile-current-root (projectile-project-root))))

(defun asok/set-compilation-save-buffer-predicate ()
  (setq-local compilation-save-buffers-predicate '(lambda ()
						    (string-prefix-p
						     projectile-current-root
						     (file-truename (buffer-file-name))))))

(add-hook 'projectile-mode-hook 'asok/set-compilation-save-buffer-predicate nil t)

(diminish 'projectile-mode " Π")

(setq projectile-completion-system 'ido)
