(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(setq js2-strict-missing-semi-warning nil)
(eval-after-load "js2-mode"
  '(progn (define-key js2-mode-map (kbd "RET") 'newline-and-indent)))


