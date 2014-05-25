(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . js2-mode))
(setq js2-strict-missing-semi-warning nil)
(setq-default js2-basic-offset 2)
(eval-after-load "js2-mode"
  '(progn (define-key js2-mode-map (kbd "RET") 'newline-and-indent)))


