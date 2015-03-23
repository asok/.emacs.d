(defadvice find-file-at-point (around goto-line compile activate)
  (let ((line (and (looking-at ".*:\\([0-9]+\\)")
                   (string-to-number (match-string 1)))))
    ad-do-it
    (and line (goto-line line))))

(global-set-key (kbd "s-h") 'windmove-left)
(global-set-key (kbd "s-l") 'windmove-right)
(global-set-key (kbd "s-j") 'windmove-down)
(global-set-key (kbd "s-k") 'windmove-up)
(global-set-key (kbd "s-d") 'previous-buffer)
(global-set-key (kbd "s-f") 'next-buffer)

(global-set-key (kbd "C-q") (lambda () (interactive) (switch-to-prev-buffer (previous-window))))
(global-set-key (kbd "C-w") (lambda () (interactive) (switch-to-next-buffer (previous-window))))

(global-set-key (kbd "C-h C-f") #'find-function)

(add-hook 'ido-setup-hook 'asok/ido-keys)
(defun asok/ido-keys ()
  (define-key ido-completion-map (kbd "<SPC>") 'ido-next-match)
  (define-key ido-completion-map [?\C- ] 'ido-prev-match))

(defun visit-shell ()
  "If the current buffer is:
  1) a running shell named *shell*, rename it.
2) a non shell, go to an already running shell
or start a new one while killing a defunt one"
  (interactive)
  (if (and (string= "shell-mode" major-mode) (string= "*shell*" (buffer-name)))
      (call-interactively 'rename-buffer)
    (shell)))

(global-set-key (kbd "<f2>") 'visit-shell)

(global-unset-key (kbd "s-t"))
(global-unset-key (kbd "s-y"))
(global-unset-key (kbd "s-u"))

(defun rename-current-buffer-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))

(global-set-key (kbd "C-x C-r") 'rename-current-buffer-file)

(defun delete-current-buffer-file ()
  "Removes file connected to current buffer and kills buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (ido-kill-buffer)
      (when (yes-or-no-p "Are you sure you want to remove this file? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully removed" filename)))))

(global-set-key (kbd "C-x C-k") 'delete-current-buffer-file)

(defun asok/org-notes ()
  (interactive)
  (switch-to-buffer
   (generate-new-buffer (generate-new-buffer-name "*org-notes*")))
  (org-mode)
  (insert (concat "* " (format-time-string "%d-%m-%Y @ %H:%M") "\n** "))
  (evil-insert-state))

(defun asok/leader-kbd (key)
  (kbd (format "<SPC> %s" key)))

(defvar asok/highlight-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "s") 'highlight-symbol-at-point)
    (define-key map (kbd "h") 'hi-lock-mode)
    map))

(defvar asok/eval-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "e") #'eval-expression)
    (define-key map (kbd "d") #'eval-defun)
    (define-key map (kbd "b") #'eval-buffer)
    (define-key map (kbd "l") #'eval-last-sexp)
    map))

(defun asok/at-comment-p ()
  (let ((face (face-at-point t)))
    (or
     (eq face 'font-lock-comment-delimiter-face)
     (eq face 'font-lock-comment-face))))
