;; (evil-add-hjkl-bindings magit-branch-manager-mode-map 'emacs
;;   (kbd "C-f") 'evil-scroll-page-down
;;   (kbd "C-b") 'evil-scroll-page-up)

;; (evil-add-hjkl-bindings magit-status-mode-map 'emacs
;;   (kbd "C-f") 'evil-scroll-page-down
;;   (kbd "C-b") 'evil-scroll-page-up
;;   (kbd "K") 'magit-discard-item
;;   (kbd "h") 'magit-toggle-diff-refine-hunk
;;   (kbd "l") 'magit-key-mode-popup-logging)

;; (evil-define-key 'motion magit-status-mode-map
;;   (kbd "<tab>") 'magit-toggle-section
;;   (kbd "<enter>") 'magit-visit-item
;;   (kbd ", C-c") 'magit-checkout
;;   (kbd ", c") 'magit-status)

(evil-define-key 'motion magit-status-mode-map
  (kbd "C-1") 'magit-show-level-1
  (kbd "C-2") 'magit-show-level-2
  (kbd "C-3") 'magit-show-level-3
  (kbd "C-4") 'magit-show-level-4

  (kbd "M-1") 'magit-show-level-1-all
  (kbd "M-2") 'magit-show-level-2-all
  (kbd "M-3") 'magit-show-level-3-all
  (kbd "M-4") 'magit-show-level-4-all

  (kbd "{") 'magit-goto-previous-sibling-section
  (kbd "}") 'magit-goto-next-sibling-section
  (kbd "K") 'magit-discard-item
  (kbd "TAB") 'magit-toggle-section)

(add-to-list 'evil-motion-state-modes 'magit-status-mode)
