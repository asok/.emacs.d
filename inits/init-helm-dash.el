(require 'helm-dash)

(add-hook 'emacs-lisp-mode-hook '(lambda ()
                                   (setq-local helm-dash-docsets '("Emacs Lisp"))
                                   (setq helm-current-buffer (current-buffer))))

(add-hook 'ruby-mode-hook '(lambda ()
                             (setq-local helm-dash-docsets '("Redis" "Ruby on Rails" "Ruby"))
                             (setq helm-current-buffer (current-buffer))))

(add-hook 'clojure-mode-hook '(lambda ()
                                (setq-local helm-dash-docsets '("Clojure"))
                                (setq helm-current-buffer (current-buffer))))

(add-hook 'js2-mode-hook '(lambda ()
                            (setq-local helm-dash-docsets '("UnderscoreJS" "React" "Jasmine"))
                            (setq helm-current-buffer (current-buffer))))

(add-hook 'js-mode-hook '(lambda ()
                           (setq-local helm-dash-docsets '("UnderscoreJS" "React" "Jasmine"))
                           (setq helm-current-buffer (current-buffer))))

(add-hook 'web-mode-hook '(lambda ()
                            (setq-local helm-dash-docsets '("UnderscoreJS" "React"))
                            (setq helm-current-buffer (current-buffer))))

(add-hook 'projectile-rails-mode-hook '(lambda()
																				 (setq-local helm-dash-docsets '("Redis" "Ruby on Rails" "Ruby" "jQuery"))))

(evil-define-key 'normal global-map (kbd "M-SPC") 'helm-dash-at-point)

(setq helm-dash-browser-func 'eww-browse-url)

(print "ran1!!!!11---11")
