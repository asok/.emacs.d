(setq clojure-defun-style-default-indent t
      cider-show-error-buffer 'except-in-repl
      clojure-use-backtracking-indent nil)

(evil-define-key 'normal cider-mode-map (kbd "RET") 'cider-jump-to-var)
(require 'clojure-mode)
(define-key clojure-mode-map (kbd "RET") 'newline-and-indent)

(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)
