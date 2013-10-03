(require 'auto-complete-autoloads)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(setq rsense-home "/usr/local/Cellar/rsense/0.3/libexec")
(add-to-list 'load-path (concat rsense-home "/etc"))
(setq ac-auto-start 3)

(setq ac-expand-on-auto-complete t)
(setq ac-use-quick-help t)
(setq ac-dwim t) ; To get pop-ups with docs even if a word is uniquely completed

(eval-after-load "auto-complete"
  '(progn
     (add-to-list 'ac-modes 'enh-ruby-mode)
     (add-to-list 'ac-modes 'shell-mode)
     (add-to-list 'ac-modes 'rhtml-mode)
     (add-to-list 'ac-modes 'html-mode)

     (define-key ac-completing-map (kbd "C-n") 'ac-next)
     (define-key ac-completing-map (kbd "C-p") 'ac-previous)
     (define-key ac-completing-map [return] nil)
     (define-key ac-completing-map "\r" nil)

     (global-auto-complete-mode t)))

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


(defun asok/ac-emacs-lisp-mode-setup ()
  (setq ac-sources (append '(ac-source-features ac-source-functions ac-source-variables ac-source-symbols) ac-sources)))

(defun asok/ac-cc-mode-setup ()
  (setq ac-sources (append '(ac-source-gtags) ac-sources)))

(defun asok/ac-ruby-mode-setup ())

(defun asok/ac-css-mode-setup ()
  (setq ac-sources (append '(ac-source-css-property) ac-sources)))

(setq-default ac-sources '(ac-source-abbrev
			   ac-source-dictionary
			   ac-source-words-in-same-mode-buffers
			   ac-source-filename
			   ac-source-yasnippet))

(add-hook 'emacs-lisp-mode-hook 'asok/ac-emacs-lisp-mode-setup)
(add-hook 'c-mode-common-hook 'asok/ac-cc-mode-setup)
(add-hook 'ruby-mode-hook 'asok/ac-ruby-mode-setup)
(add-hook 'css-mode-hook 'asok/ac-css-mode-setup)



