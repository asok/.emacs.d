(require 'helm-dash)

(add-hook 'emacs-lisp-mode-hook '(lambda () (setq-local helm-dash-docsets '("Emacs Lisp"))))
(add-hook 'ruby-mode-hook '(lambda () (setq-local helm-dash-docsets '("Redis" "Ruby on Rails" "Ruby"))))

(evil-define-key 'normal global-map (kbd "M-SPC") 'helm-dash )
