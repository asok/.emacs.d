(require 'smartparens)

(add-hook 'clojure-mode-hook 'smartparens-mode)
(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(add-hook 'js2-mode 'smartparens-mode)

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

(eval-after-load 'hydra
  '(progn
     (defhydra hydra-sp (:color red)
       "Smartparens"
       ("h" sp-backward-slurp-sexp "backward-slurp")
       ("j" sp-backward-barf-sexp "backward-barf")
       ("k" sp-forward-barf-sexp "forward-barf")
       ("l" sp-forward-slurp-sexp "forward-slurp"))

     (setq asok/hydra-sp-heads
           '(("9" (lambda ()
                    (interactive)
                    (sp-wrap-with-pair "(")
                    (evil-insert 1))
              "wrap (")
             ("[" (lambda ()
                    (interactive)
                    (sp-wrap-with-pair "[")
                    (evil-insert 1))
              "wrap [")
             ("{" (lambda ()
                    (interactive)
                    (sp-wrap-with-pair "{")
                    (evil-insert 1))
              "wrap {")
             ("'" (lambda ()
                    (interactive)
                    (sp-wrap-with-pair "\"")
                    (evil-insert 1))
              "wrap \"")
             ("s" hydra-sp/body "sp")
             ))

     (eval
      `(defhydra hydra-spawn-sp (:color blue)
         "Hydra"
         ,@asok/hydra-global-heads
         ,@asok/hydra-sp-heads))

     (evil-define-key 'normal smartparens-mode-map
       (kbd "<SPC>") 'hydra-spawn-sp/body)))

