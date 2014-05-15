(require 'projectile-rails)
(setq projectile-completion-system 'grizzl)

(evil-define-key 'normal projectile-rails-mode-map (kbd "s-t") 'projectile-rails-find-controller)
(evil-define-key 'normal projectile-rails-mode-map (kbd "s-y") 'projectile-rails-find-model)
(evil-define-key 'normal projectile-rails-mode-map (kbd "s-u") 'projectile-rails-find-view)
(evil-define-key 'normal projectile-rails-mode-map (kbd "s-o") 'projectile-rails-find-spec)
(evil-define-key 'normal projectile-rails-mode-map (kbd "s-r") 'projectile-find-file)

(evil-define-key 'normal ruby-mode-map (kbd "RET") '(lambda ()
						      (interactive)
						      (and
						       projectile-rails-mode
						       (projectile-rails-goto-file-at-point))))

(define-key projectile-rails-mode-map (kbd "C-c g") projectile-rails-mode-goto-map)

(add-hook 'projectile-mode-hook 'projectile-rails-on)

(diminish 'projectile-rails-mode " Ρ")

(evil-define-key 'normal web-mode-map (kbd "RET") 'projectile-rails-goto-file-at-point)
(evil-define-key 'normal haml-mode-map (kbd "RET") 'projectile-rails-goto-file-at-point)
