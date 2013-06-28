(evil-mode 1)

(defun match-paren (arg)
  "Go to the matching paren if on a paren."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))))

(defun comint-goto-end-and-insert ()
  (interactive)
  (if (not (comint-after-pmark-p))
      (progn (comint-goto-process-mark)
       (evil-append-line nil))
    (evil-insert 1)))

(evil-define-key 'normal term-raw-map "i" 'go-to-end-and-insert)
(evil-define-key 'normal comint-mode-map "i" 'comint-goto-end-and-insert)

(evil-define-key 'insert comint-mode-map
  (kbd "<up>") 'comint-previous-input
  (kbd "<down>") 'comint-next-input)
(evil-define-key 'insert ielm-map
  (kbd "<down>") 'comint-next-input
  (kbd "<up>") 'comint-previous-input)

;;todo

(defmacro asok/evil-define-key-when-global-map (states &rest bindings)
  `(loop for state in ,states
        do (evil-define-key state global-map ,@bindings)))

(asok/evil-define-key-when-global-map '(normal motion)
  (kbd ", 0") 'delete-window
  (kbd ", 1") 'delete-other-windows
  (kbd ", 2") 'split-window-below
  (kbd ", 3") 'split-window-right
  (kbd ", x") 'smex
  (kbd ", k") 'helm-show-kill-ring
  (kbd ", b") 'helm-bookmarks
  (kbd ", f") 'ido-find-file
  (kbd ", d") 'ido-dired
  (kbd ", e") 'helm-c-etags-select
  (kbd ", g") 'google-query
  (kbd ", c") 'magit-status
  (kbd ", C-c") 'magit-checkout
  (kbd ", o") 'helm-occur)

(evil-define-key 'visual global-map (kbd ", g") 'google-query)

(evil-define-key 'emacs global-map
  (kbd ", f") 'ido-find-file
  (kbd ", C-c") 'magit-checkout
  (kbd ", d") 'ido-dired)

(evil-add-hjkl-bindings magit-branch-manager-mode-map 'emacs
  (kbd "C-f") 'evil-scroll-page-down
  (kbd "C-b") 'evil-scroll-page-up)
(evil-add-hjkl-bindings magit-status-mode-map 'emacs
  (kbd "C-f") 'evil-scroll-page-down
  (kbd "C-b") 'evil-scroll-page-up
  (kbd "K") 'magit-discard-item
  (kbd "h") 'magit-toggle-diff-refine-hunk
  (kbd "l") 'magit-key-mode-popup-logging)

(evil-define-key 'motion magit-status-mode-map
  (kbd "<tab>") 'magit-toggle-section
  (kbd "<enter>") 'magit-visit-item
  (kbd ", C-c") 'magit-checkout
  (kbd ", c") 'magit-status)

(add-hook 'compilation-mode-hook '(lambda ()
                                    (local-unset-key "g")
                                    (local-unset-key "h")
                                    (evil-define-key 'motion compilation-mode-map "r" 'recompile)
                                    (evil-define-key 'motion compilation-mode-map "h" 'evil-backward-char)))

(evil-define-key 'normal dired-mode-map (kbd ", k") 'dired-up-directory)

(evil-define-key 'motion help-mode-map
  (kbd "<left>") 'help-go-back
  (kbd "<right>") 'help-go-forward)

(defun google-query ()
  "Googles a query or region if any."
  (interactive)
  (browse-url
   (concat
    "http://www.google.com/search?ie=utf-8&oe=utf-8&q="
    (if mark-active
        (buffer-substring (region-beginning) (region-end))
      (read-string "Google: " (concat (thing-at-point 'symbol) " "))))))

;; (setq evil-want-fine-undo t)

(define-key evil-insert-state-map "k" #'cofi/maybe-exit)

(evil-define-command cofi/maybe-exit ()
  :repeat change
  (interactive)
  (let ((modified (buffer-modified-p)))
    (insert "k")
    (let ((evt (read-event (format "Insert %c to exit insert state" ?j)
			   nil 0.5)))
      (cond
       ((null evt) (message ""))
       ((and (integerp evt) (char-equal evt ?j))
	(delete-char -1)
	(set-buffer-modified-p modified)
	(push 'escape unread-command-events))
       (t (setq unread-command-events (append unread-command-events
					      (list evt))))))))


(evil-define-key 'normal emacs-lisp-mode-map (kbd "RET") 'elisp-slime-nav-find-elisp-thing-at-point)

(require 'evil-integration)
