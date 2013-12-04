(defun asok/rhtml-mode-hook ()
  (flyspell-mode-off)
  (turn-off-auto-fill)
  (abbrev-mode -1))
(add-hook 'rhtml-mode-hook 'asok/rhtml-mode-hook)

(add-to-list 'auto-mode-alist '("\\.text\\.erb$" . rhtml-mode))
;; (add-to-list 'auto-mode-alist '("\\.js\\.erb$" . rhtml-mode))

(modify-syntax-entry ?\' "\"" rhtml-mode-syntax-table)
