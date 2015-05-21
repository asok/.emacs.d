(require 'evil)
(evil-mode 1)

(require 'cl-macs)

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

(defmacro asok/evil-define-key-when-global-map (states &rest bindings)
  `(cl-loop for state in ,states
            do (evil-define-key state global-map ,@bindings)))

(add-hook 'compilation-mode-hook '(lambda ()
                                    (local-unset-key "g")
                                    (local-unset-key "h")
                                    (evil-define-key 'motion compilation-mode-map "r" 'recompile)
                                    (evil-define-key 'motion compilation-mode-map "h" 'evil-backward-char)))

(evil-define-key 'motion help-mode-map
  (kbd "<left>") 'help-go-back
  (kbd "<right>") 'help-go-forward)

;; (setq evil-want-fine-undo t)
(setq evil-default-cursor t
      evil-regexp-search t)

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

(defun asok/sgml-skip-tag-forward-or-backward ()
  (interactive)
  (if (string-match-p "/" (symbol-name (symbol-at-point)))
      (sgml-skip-tag-backward 1)
    (sgml-skip-tag-forward 1)))
(evil-define-key 'normal html-mode-map (kbd "%") 'asok/sgml-skip-tag-forward-or-backward)

(cl-loop for mode in '(makey-key-mode prodigy-mode)
         do (add-to-list 'evil-emacs-state-modes mode))

(cl-loop for mode in '(package-menu-mode
                       occur-mode
                       messages-buffer-mode
                       eww-mode)
         do (add-to-list 'evil-motion-state-modes mode))

(add-to-list 'evil-insert-state-modes 'git-commit-mode)

(evil-define-command asok/open-below-within-sexp ()
  :repeat t
  (interactive)
  (end-of-line)
  (indent-new-comment-line)
  (evil-insert-state))

(evil-define-key 'insert global-map          (kbd "RET") #'newline-and-indent)
(evil-define-key 'insert comint-mode-map     (kbd "RET") #'comint-send-input)
(evil-define-key 'insert cider-repl-mode-map (kbd "RET") #'cider-repl-return)
(evil-define-key 'insert org-mode-map        (kbd "RET") #'org-return)
(evil-define-key 'insert eshell-mode-map     (kbd "RET") #'eshell-send-input)
(evil-define-key 'insert ielm-map            (kbd "RET") #'ielm-send-input)

(evil-define-key 'motion occur-mode-map (kbd "RET") 'occur-mode-goto-occurrence)
