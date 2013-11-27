(require 'projectile-rails)
(setq projectile-completion-system 'grizzl)
(add-hook 'projectile-mode-hook 'projectile-rails-on)

(global-set-key (kbd "s-t") 'projectile-rails-controllers)
(global-set-key (kbd "s-y") 'projectile-rails-models)
(global-set-key (kbd "s-u") 'projectile-rails-views)
(global-set-key (kbd "s-o") 'projectile-rails-specs)
(global-set-key (kbd "s-r") 'projectile-find-file)
