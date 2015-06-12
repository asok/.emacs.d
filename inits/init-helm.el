(require 'helm-mode)

(setq helm-buffer-max-length 40
      helm-buffer-details-flag nil
      helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match t
      helm-recentf-fuzzy-match t
      helm-imenu-fuzzy-match t
      helm-ff-skip-boring-files t
      helm-ff-newfile-prompt-p nil
      ;; helm-ff-directory 'font-lock-constant-face
      helm-boring-file-regexp-list '("/\\.$" "/\\.\\.$" "\\.DS_Store$")
      )

(defvar asok/helm-source-init-files
  '((name . "My init files")
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

(defun asok/helm-init-files (&optional candidate)
  (interactive)
  (helm :sources asok/helm-source-init-files
        :input (or candidate "")
        :buffer "*helm init files*"
        :truncate-lines t))

(defun asok/helm-recentf (&optional candidate)
  (interactive)
  (let ((helm-ff-transformer-show-only-basename nil))
    (helm :sources helm-source-recentf
          :input (or candidate "")
          :buffer "*helm recent files*"
          :truncate-lines t)))

(defun asok/helm-projectile-files (&optional candidate)
  (interactive)
  (helm :sources helm-source-projectile-files-and-dired-list
        :input (or candidate "")
        :buffer "*helm projectile files*"
        :truncate-lines t))

(defun asok/helm-switch-project (&optional candidate)
  (interactive)
  (helm :sources helm-source-projectile-projects
        :input (or candidate "")
        :buffer "*helm switch project*"
        :truncate-lines t))

(defvar asok/helm-dummy-source-init-files
  (helm-build-dummy-source
      "Find init file"
    :action (helm-make-actions
             "Find init file"
             (lambda (c)
               (asok/helm-init-files c)))))

(defvar asok/helm-dummy-source-recentf
  (helm-build-dummy-source
      "Find recent file"
    :action (helm-make-actions
             "Find recent file"
             (lambda (c)
               (asok/helm-recentf c)))))

(defvar asok/helm-dummy-source-projectile-files
  (helm-build-dummy-source
      "Find projectile files"
    :action (helm-make-actions
             "Find projectile files"
             (lambda (c)
               (asok/helm-projectile-files c)))))

(defvar asok/helm-dummy-source-switch-project
  (helm-build-dummy-source
      "Switch project"
    :action (helm-make-actions
             "Switch project"
             (lambda (c)
               (asok/helm-switch-project c)))))

(defvar asok/helm-mini-default-sources
  '(helm-source-buffers-list
    asok/helm-dummy-source-recentf
    asok/helm-dummy-source-init-files
    asok/helm-dummy-source-projectile-files
    asok/helm-dummy-source-switch-project
    helm-source-buffer-not-found))

(defun asok/helm-mini ()
  "Preconfigured `helm' lightweight version \(buffer -> recentf\)."
  (interactive)
  (require 'helm-files)
  (unless helm-source-buffers-list
    (setq helm-source-buffers-list
          (helm-make-source "Buffers" 'helm-source-buffers)))
  (let ((helm-ff-transformer-show-only-basename nil))
    (helm :sources asok/helm-mini-default-sources
          :buffer "*helm mini*"
          :truncate-lines t)))

;; (global-set-key (kbd "s-a") 'asok/helm-mini)
(global-set-key (kbd "s-i") 'helm-imenu)

(global-set-key (kbd "M-x") 'helm-M-x)

(defun asok/helm-execute-persistent-action ()
  "Run `helm-execute-persistent-action' if a directory is selected.
If not run `helm-maybe-exit-minibuffer'."
  (interactive)
  (if (file-directory-p (helm-get-selection))
      (helm-execute-persistent-action)
    (helm-maybe-exit-minibuffer)))

(define-key helm-find-files-map (kbd "RET") 'asok/helm-execute-persistent-action)

;; (define-key helm-find-files-map (kbd "RET") 'helm-execute-persistent-action)

;; (set-face-attribute 'helm-ff-directory (selected-frame) :background nil)
;; (evil-define-key 'normal global-map (kbd "C-x C-f") 'helm-find-files)

(defun asok/helm-fuzzy-comp-read (prompt choices &optional initial-input)
  (helm-comp-read prompt choices
                  :initial-input initial-input
                  :candidates-in-buffer t
                  :fuzzy t
                  :must-match 'confirm))
