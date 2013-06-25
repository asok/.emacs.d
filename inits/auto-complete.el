(require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)
(setq rsense-home "/usr/local/Cellar/rsense/0.3/libexec")
(add-to-list 'load-path (concat rsense-home "/etc"))
(setq ac-auto-start 4)

(setq ac-expand-on-auto-complete t)
(setq ac-use-quick-help t)

(global-auto-complete-mode t)
(setq ac-dwim t) ; To get pop-ups with docs even if a word is uniquely completed
(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)

;; hook AC into completion-at-point
(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))
(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)

;; (define-key evil-insert-state-map (kbd "C-n") nil)
;; (define-key evil-insert-state-map (kbd "C-p") nil)

;; (setq ac-use-menu-map nil)

;; (evil-define-key 'insert global-map (kbd "C-n") 'ac-next)
;; (evil-define-key 'insert global-map (kbd "C-p") 'ac-previous)

(defadvice ac-previous (after asok/expand-string activate)
  (ac-expand-string (ac-selected-candidate)))

(defadvice ac-next (after asok/expand-string activate)
  (ac-expand-string (ac-selected-candidate)))

(define-key ac-completing-map [return] nil)
(define-key ac-completing-map "\r" nil)
