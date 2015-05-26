(require 'helm-dash)

(add-hook 'emacs-lisp-mode-hook '(lambda () (setq-local helm-dash-docsets '("Emacs Lisp"))))
(add-hook 'ruby-mode-hook '(lambda () (setq-local helm-dash-docsets '("Redis" "Ruby on Rails" "Ruby"))))
(add-hook 'clojure-mode-hook '(lambda () (setq-local helm-dash-docsets '("Clojure"))))
(add-hook 'js-mode-hook '(lambda () (setq-local helm-dash-docsets '("UnderscoreJS" "React"))))
(add-hook 'web-mode-hook '(lambda () (setq-local helm-dash-docsets '("UnderscoreJS" "React"))))

(add-hook 'projectile-rails-mode-hook '(lambda()
																				 (setq-local helm-dash-docsets '("Redis" "Ruby on Rails" "Ruby" "jQuery"))))

(evil-define-key 'normal global-map (kbd "M-SPC") 'helm-dash-at-point)

(setq helm-dash-browser-func 'eww-browse-url)
