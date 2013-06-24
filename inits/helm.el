(require 'helm-mode)

(global-set-key (kbd "s-a") 'asok/helm-mini)
(global-set-key (kbd "s-i") 'helm-imenu)
(global-set-key (kbd "s-x") 'helm-M-x)
(global-set-key (kbd "C-c SPC") 'helm-all-mark-rings)

(defvar helm-source-asok-config-files
  '((name . "My config files")
    (type . file)
    (disable-shortcuts)
    (init . (lambda ()
              (helm-init-candidates-in-buffer
               'local
               (append (directory-files "~/.emacs.d/" t "\\.el$")
                  (directory-files "~/.emacs.d/inits/" t "\\.el$")))))
    (candidates-in-buffer)
    (help-message . helm-generic-file-help-message)
    (mode-line . helm-generic-file-mode-line-string)))

(defun asok/helm-mini ()
  "Same as `helm-mini' but with extra source for config files"
  (interactive)
  (helm-other-buffer (append '(helm-source-buffers-list
                               helm-source-recentf
                               helm-source-asok-config-files)
                             (if (boundp 'helm-rails-not-found-c-source)
                                 '(helm-rails-not-found-c-source))
                             ()
                             '(helm-source-buffer-not-found))
                     "*helm mini*"))
