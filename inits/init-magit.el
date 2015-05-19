(require 'magit)

(evil-add-hjkl-bindings magit-branch-manager-mode-map 'emacs
  (kbd "C-f") 'evil-scroll-page-down
  (kbd "C-b") 'evil-scroll-page-up)

(evil-add-hjkl-bindings magit-status-mode-map 'emacs
  (kbd "C-f") 'evil-scroll-page-down
  (kbd "C-b") 'evil-scroll-page-up
  (kbd "K") 'magit-discard-item
  (kbd "h") 'magit-toggle-diff-refine-hunk
  (kbd "l") 'magit-key-mode-popup-logging
  (kbd "{") 'magit-goto-previous-sibling-section
  (kbd "}") 'magit-goto-next-sibling-section)

(evil-add-hjkl-bindings magit-commit-mode-map 'emacs
  (kbd "{") 'magit-goto-previous-section
  (kbd "}") 'magit-goto-next-section
  )

(evil-add-hjkl-bindings magit-log-mode-map 'emacs
  (kbd "C-f") 'evil-scroll-page-down
  (kbd "C-b") 'evil-scroll-page-up
  )

(evil-add-hjkl-bindings magit-branch-manager-mode-map 'emacs
  (kbd "K") 'magit-discard-item)

(require 'magit-blame)

(defun asok/visit-github (arg)
  (interactive "P")
  (unless arg
    (setq arg '(0)))
  (let ((url (or
              (magit-get "remote"
                         (if (= (car arg) 4) "upstream" "origin")
                         "url")
              (magit-get "remote" "origin" "url"))))

    (browse-url
     (if (s-contains? "@" url)
         (replace-regexp-in-string "\\(.+\\)@" "https://"
                                   (s-replace ".git" ""
                                              (s-replace ":" "/" url))))
     url)))


(fset 'asok/magit-pull-upstream
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([70 21 70 117 112 115 116 114 101 97 109 return 134217848 107 109 97 99 99 114 backspace backspace 114 111 45 101 110 100 45 14 14] 0 "%d")) arg)))
