(require 'magit)

(evil-add-hjkl-bindings magit-branch-manager-mode-map 'spc
  (kbd "C-f") 'evil-scroll-page-down
  (kbd "C-b") 'evil-scroll-page-up)

(evil-add-hjkl-bindings magit-status-mode-map 'spc
  (kbd "C-f") 'evil-scroll-page-down
  (kbd "C-b") 'evil-scroll-page-up
  (kbd "K") 'magit-discard-item
  (kbd "h") 'magit-toggle-diff-refine-hunk
  (kbd "l") 'magit-key-mode-popup-logging
  (kbd "{") 'magit-goto-previous-sibling-section
  (kbd "}") 'magit-goto-next-sibling-section)

(evil-add-hjkl-bindings magit-commit-mode-map 'spc
  (kbd "{") 'magit-goto-previous-section
  (kbd "}") 'magit-goto-next-section
  )

(evil-add-hjkl-bindings magit-log-mode-map 'spc
  (kbd "C-f") 'evil-scroll-page-down
  (kbd "C-b") 'evil-scroll-page-up
  )

(evil-add-hjkl-bindings magit-branch-manager-mode-map 'spc
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

(defun endless/visit-pull-request-url ()
  "Visit the current branch's PR on Github."
  (interactive)
  (browse-url
   (format "https://github.com/%s/compare/%s"
           (replace-regexp-in-string
            "\\`.+github\\.com:\\(.+\\)\\.git\\'" "\\1"
            (magit-get "remote"
                       (magit-get-current-remote)
                       "url"))
           (magit-get-current-branch))))

(eval-after-load 'magit
  '(define-key magit-mode-map "V"
     #'endless/visit-pull-request-url))

(fset 'asok/magit-pull-upstream
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([70 21 70 117 112 115 116 114 101 97 109 return 134217848 107 109 97 99 99 114 backspace backspace 114 111 45 101 110 100 45 14 14] 0 "%d")) arg)))
