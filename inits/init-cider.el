(setq clojure-defun-style-default-indent t
      clojure-use-backtracking-indent nil)

(evil-define-key 'normal cider-mode-map (kbd "RET") 'cider-jump-to-var)
