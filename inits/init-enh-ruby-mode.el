(require 'enh-ruby-mode)

(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . enh-ruby-mode))

;; (add-hook 'enh-ruby-mode-hook 'asok/evil-paste-ad)

(setq enh-ruby-program "ruby")

(add-hook 'enh-ruby-mode-hook 'asok/delete-trailing-whitespace-on-file-write)

(evil-define-key 'insert enh-ruby-mode-map (kbd "RET") 'evil-ret-and-indent)

(remove-hook 'enh-ruby-mode-hook 'erm-define-faces)

(defun asok/toggle-ruby-block-style ()
  (interactive)
  (enh-ruby-beginning-of-block)
  (if (looking-at-p "{")
      (let ((beg (point)))
	(delete-char 1)
	(insert (if (looking-back "[^ ]") " do" "do"))
	(when (looking-at "[ ]*|.*|")
	  (search-forward-regexp "[ ]*|.*|" (line-end-position)))
	(insert "\n")
	(goto-char (- (line-end-position) 1))
	(delete-char 1)
	(insert "\nend")
	(evil-indent beg (point))
	)
    (progn
      (ruby-end-of-block)
      (save-excursion ;; join lines if block is 1 line of code long
	(let ((end (line-end-position)))
	  (enh-ruby-beginning-of-block)
	  (if (= 2 (- (line-number-at-pos end) (line-number-at-pos)))
	      (evil-join (point) end)))
	(kill-line)
	(insert " }")
	(enh-ruby-beginning-of-block)
	(delete-char 2)
	(insert "{" )))))

(defun asok/indend-according-to-mode-locally ()
  (add-hook 'evil-insert-state-exit-hook 'indent-according-to-mode nil t))
(add-hook 'enh-ruby-mode-hook 'asok/indend-according-to-mode-locally)
