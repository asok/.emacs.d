(require 'evil)
(evil-mode 1)

(defun comint-goto-end-and-insert ()
  (interactive)
  (if (not (comint-after-pmark-p))
      (progn (comint-goto-process-mark)
             (evil-append-line nil))
    (evil-insert 1)))

(evil-define-key 'normal comint-mode-map "i" 'comint-goto-end-and-insert)
(evil-define-key 'normal inf-ruby-mode-map "i" 'comint-goto-end-and-insert)

(evil-define-key 'insert comint-mode-map
  (kbd "<up>") 'comint-previous-input
  (kbd "<down>") 'comint-next-input)

;;todo

(defmacro asok/evil-define-key-when-global-map (states &rest bindings)
  `(loop for state in ,states
         do (evil-define-key state global-map ,@bindings)))

(asok/evil-define-key-when-global-map '(normal motion)
                                      (asok/leader-kbd "0") 'delete-window
                                      (asok/leader-kbd "1") 'delete-other-windows
                                      (asok/leader-kbd "2") 'split-window-below
                                      (asok/leader-kbd "3") 'split-window-right
                                      (asok/leader-kbd "x") 'smex
                                      (asok/leader-kbd "k") 'helm-show-kill-ring
                                      (asok/leader-kbd "b") 'helm-bookmarks
                                      (asok/leader-kbd "f") 'ido-find-file
                                      (asok/leader-kbd "s") 'save-buffer
                                      (asok/leader-kbd "d") 'ido-dired
                                      (asok/leader-kbd "h") 'google-query
                                      (asok/leader-kbd "c") 'magit-status
                                      (asok/leader-kbd "C-c") 'magit-checkout
                                      (asok/leader-kbd "o") 'asok/helm-occur)

(evil-define-key 'visual global-map (asok/leader-kbd "g") 'google-query)

(evil-define-key 'emacs global-map
  (asok/leader-kbd "f") 'ido-find-file
  (asok/leader-kbd "C-c") 'magit-checkout
  (asok/leader-kbd "d") 'ido-dired)

(add-hook 'compilation-mode-hook '(lambda ()
                                    (local-unset-key "g")
                                    (local-unset-key "h")
                                    (evil-define-key 'motion compilation-mode-map "r" 'recompile)
                                    (evil-define-key 'motion compilation-mode-map "h" 'evil-backward-char)))

(evil-define-key 'normal dired-mode-map (asok/leader-kbd "k") 'dired-up-directory)

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
(setq evil-default-cursor t)

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

(evil-define-key 'normal emacs-lisp-mode-map (asok/leader-kbd "e") 'eval-expression)

(require 'evil-integration)

(defun asok/sgml-skip-tag-forward-or-backward ()
  (interactive)
  (if (string-match-p "/" (symbol-name (symbol-at-point)))
      (sgml-skip-tag-backward 1)
    (sgml-skip-tag-forward 1)))
(evil-define-key 'normal html-mode-map (kbd "%") 'asok/sgml-skip-tag-forward-or-backward)

(add-to-list 'evil-emacs-state-modes 'makey-key-mode)

(evil-define-command asok/open-below-within-sexp ()
  :repeat t
  (interactive)
  (forward-sexp 1)
  (indent-new-comment-line)
  (evil-insert-state))

(defun asok/at-comment-p ()
  (let ((face (face-at-point t)))
    (or
     (eq face 'font-lock-comment-delimiter-face)
     (eq face 'font-lock-comment-face))))

(evil-define-command asok/paredit-change-line ()
  :repeat t
  (interactive)
  (if (asok/at-comment-p) 
      (call-interactively 'evil-change-line)
    (paredit-kill)
    (evil-insert-state)))

(evil-define-command asok/paredit-delete-line ()
  :repeat t
  (interactive)
  (if (asok/at-comment-p) 
      (call-interactively 'evil-delete-line)
    (paredit-kill)))

(evil-define-key 'normal paredit-mode-map
  (asok/leader-kbd "9") '(lambda ()
                           (interactive)
                           (paredit-wrap-round)
                           (evil-insert 1))
  (asok/leader-kbd "[") '(lambda ()
                           (interactive)
                           (paredit-wrap-square)
                           (evil-insert 1))
  (asok/leader-kbd "{") '(lambda ()
                           (interactive)
                           (paredit-wrap-curly)
                           (evil-insert 1))
  (asok/leader-kbd "<right>") 'paredit-forward-slurp-sexp
  (asok/leader-kbd "<left>") 'paredit-backward-slurp-sexp
  (asok/leader-kbd "<up>") 'paredit-forward-barf-sexp
  (asok/leader-kbd "<down>") 'paredit-backward-barf-sexp

  (kbd "M-o") 'asok/open-below-within-sexp
  (kbd "C") 'asok/paredit-change-line
  (kbd "D") 'asok/paredit-delete-line

  
  )

(add-to-list 'evil-motion-state-modes 'package-menu-mode 'occur-mode)

(evil-define-key 'insert global-map (kbd "RET") 'comint-send-input)
(evil-define-key 'insert cider-repl-mode-map (kbd "RET") #'cider-repl-return)

(evil-define-key 'motion occur-mode-map (kbd "RET") 'occur-mode-goto-occurrence)
