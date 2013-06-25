(load "~/.emacs.d/packages")

(asok/install-packages)
(asok/init-packages)

(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq ring-bell-function nil)
(setq visible-bell nil)
(push "/usr/local/bin" exec-path)
(push "/opt/local/bin" exec-path)
(add-to-list 'load-path "~/.emacs.d")

(fset 'yes-or-no-p 'y-or-n-p)
;(set-frame-font "Monospaced-14")	

(setq ring-bell-function 'ignore)
(setq-default indent-tabs-mode nil)

(setq inhibit-startup-screen t)

(setq make-backup-files nil)
(setq make-inhibited t)
(setq auto-save-default nil)

(set-variable 'shell-file-name "/bin/bash")
(winner-mode 1)
(show-paren-mode t)
(auto-fill-mode nil)
(blink-cursor-mode -1)

(setq font-lock-maximum-decoration t)
(electric-pair-mode)

(defun asok/delete-trailing-whitespace-on-file-write ()
  (add-hook 'local-write-file-hooks
	    '(lambda()
	       (save-excursion
		 (delete-trailing-whitespace)))))


(defadvice find-file-at-point (around goto-line compile activate)
  (let ((line (and (looking-at ".*:\\([0-9]+\\)")
                   (string-to-number (match-string 1)))))
    ad-do-it
    (and line (goto-line line))))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

;; Also auto refresh dired, but be quiet about it
;; (setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

(require 'term)

(setq term-default-bg-color nil)
(setq term-default-fg-color 'white)

(server-start)

(setq multi-term-program "/bin/bash")

(setq org-src-fontify-natively t)

(global-set-key (kbd "s-h") 'windmove-left)
(global-set-key (kbd "s-l") 'windmove-right)
(global-set-key (kbd "s-j") 'windmove-down)
(global-set-key (kbd "s-k") 'windmove-up)
(global-set-key (kbd "s-d") 'previous-buffer)
(global-set-key (kbd "s-f") 'next-buffer)

(global-set-key (kbd "C-q") (lambda () (interactive) (switch-to-prev-buffer (previous-window))))
(global-set-key (kbd "C-w") (lambda () (interactive) (switch-to-next-buffer (previous-window))))

(add-hook 'ido-setup-hook 'asok/ido-keys)
(defun asok/ido-keys ()
  (define-key ido-completion-map (kbd "<SPC>") 'ido-next-match)
  (define-key ido-completion-map [?\C- ] 'ido-prev-match))

;; Original idea from
;; http://www.opensubscriber.com/message/emacs-devel@gnu.org/10971693.html
(defun comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command.
        If no region is selected and current line is not blank and we are not at the end of the line,
        then comment current line.
        Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (not (region-active-p))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))
(global-set-key (kbd "M-;") 'comment-dwim-line)

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

(load "~/.emacs.d/packages")

(asok/install-packages)
(asok/init-packages)
(asok/init-manual-packages)

(load "~/.emacs.d/theming")
