(require 'smartparens)

(add-hook 'clojure-mode-hook 'smartparens-mode)
(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(add-hook 'js2-mode-hook 'smartparens-mode)
(add-hook 'web-mode-hook 'smartparens-mode)

(add-hook 'js2-mode-hook (lambda () (electric-pair-mode -1)) t)

(add-to-list 'sp-autoescape-string-quote-if-empty 'ruby-mode)
(setq sp-autoescape-string-quote nil)

(add-hook 'ruby-mode-hook #'smartparens-mode)

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
       (kbd "M-r") #'sp-raise-sexp
       (kbd "M-o") #'asok/sp-open-line-below-sexp
       (kbd "C") #'asok/sp-change-line-command
       (kbd "D") #'asok/sp-delete-line-command)))

(defun asok/sp-wrap-with-parenthesis ()
  (interactive)
  (sp-wrap-with-pair "(")
  (evil-insert 1))

(defun asok/sp-wrap-with-curly-braces ()
  (interactive)
  (sp-wrap-with-pair "{")
  (evil-insert 1))

(defun asok/sp-wrap-with-square-brackets ()
  (interactive)
  (sp-wrap-with-pair "{")
  (evil-insert 1))

(defun asok/sp-wrap-with-quotes ()
  (interactive)
  (sp-wrap-with-pair "\"")
  (evil-insert 1))
