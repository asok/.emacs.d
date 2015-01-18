(require 'helm-mode)

(setq helm-buffer-max-length 40
      helm-buffer-details-flag nil)

(global-set-key (kbd "s-a") 'asok/helm-mini)
(global-set-key (kbd "s-i") 'helm-imenu)
(global-set-key (kbd "C-c SPC") 'helm-all-mark-rings)

(evil-define-key 'normal global-map (kbd ", e") 'helm-etags-select)

;; (define-key helm-find-files-map (kbd "RET") 'helm-execute-persistent-action)

(setq helm-ff-directory 'font-lock-constant-face)
(set-face-attribute 'helm-ff-directory (selected-frame) :background nil)
;; (evil-define-key 'normal global-map (kbd "C-x C-f") 'helm-find-files)

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
  (helm-other-buffer '(helm-source-buffers-list
                       helm-source-recentf
                       helm-source-asok-config-files)
                     "*helm mini*"))
