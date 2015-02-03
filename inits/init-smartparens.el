(add-hook 'clojure-mode-hook 'smartparens-mode)
(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(add-hook 'ruby-mode-hook 'smartparens-mode)

(defun asok/sp-change-line ()
  (interactive)
  (if (asok/at-comment-p)
      (call-interactively #'evil-change-line)
    (call-interactively #'sp-kill-hybrid-sexp)
    (evil-insert-state)))

(defun asok/sp-delete-line ()
  (interactive)
  (if (asok/at-comment-p)
      (call-interactively #'evil-delete-line)
    (call-interactively #'sp-kill-hybrid-sexp)))

(defun asok/sp-open-line-below-sexp ()
  (interactive)
  (sp-end-of-sexp)
  (newline-and-indent)
  (evil-insert-state))

(eval-after-load 'evil
  '(progn
     (evil-define-command asok/sp-change-line-command ()
       :repeat t
       (asok/sp-change-line))

     (evil-define-command asok/sp-delete-line-command ()
       :repeat t
       (asok/sp-delete-line))

     (evil-define-key 'normal smartparens-mode-map
       (asok/leader-kbd "9") '(lambda ()
                                (interactive)
                                (sp-wrap-with-pair "(")
                                (evil-insert 1))
       (asok/leader-kbd "[") '(lambda ()
                                (interactive)
                                (sp-wrap-with-pair "[")
                                (evil-insert 1))
       (asok/leader-kbd "{") '(lambda ()
                                (interactive)
                                (sp-wrap-with-pair "{")
                                (evil-insert 1))
       (kbd "S-<right>") 'sp-forward-slurp-sexp
       (kbd "S-<left>") 'sp-backward-slurp-sexp
       (kbd "S-<up>") 'sp-forward-barf-sexp
       (kbd "S-<down>") 'sp-backward-barf-sexp

       (kbd "M-r") #'sp-raise-sexp
       (kbd "M-o") #'asok/sp-open-line-below-sexp
       (kbd "C") 'asok/sp-change-line-command
       (kbd "D") 'asok/sp-delete-line-command)))
