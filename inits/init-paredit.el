(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)

(eval-after-load 'evil 
  '(progn
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
       (kbd "S-<right>") 'paredit-forward-slurp-sexp
       (kbd "S-<left>") 'paredit-backward-slurp-sexp
       (kbd "S-<up>") 'paredit-forward-barf-sexp
       (kbd "S-<down>") 'paredit-backward-barf-sexp

       (kbd "M-o") 'asok/open-below-within-sexp
       (kbd "C") 'asok/paredit-change-line
       (kbd "D") 'asok/paredit-delete-line

       
       )))

