(require 'arm)
(define-key arm-mode-map (kbd "C-c C-r") 'arm/start-server)
(define-key arm-mode-map (kbd "C-c r") 'arm/rake)

(add-hook 'arm-mode-hook 'evil-normalize-keymaps)

(defun asok/arm/find-view-or-tag-dwim-maybe ()
  (interactive)
  (if (find 'arm-mode minor-mode-list)
      (arm/find-view-or-tag-dwim)))

(evil-define-key 'normal arm-mode-map (kbd ", a") 'ag-project
  (kbd ", h") arm/shortcut-map)

(evil-define-key 'normal ruby-mode-map (kbd "<return>") 'asok/arm/find-view-or-tag-dwim-maybe)
(evil-define-key 'normal enh-ruby-mode-map (kbd "<return>") 'asok/arm/find-view-or-tag-dwim-maybe)
(evil-define-key 'normal rhtml-mode-map (kbd "<return>") 'asok/arm/find-view-or-tag-dwim-maybe)
(evil-define-key 'normal haml-mode-map (kbd "<return>") 'asok/arm/find-view-or-tag-dwim-maybe)

(evil-define-key 'normal arm-mode-map
  (kbd "<f7>") 'arm/project-shell
  (kbd "<f5>") 'arm/start-server
  (kbd "<f6>") 'arm/rails-console)
(evil-define-key 'insert arm-mode-map
  (kbd "<f7>") 'arm/project-shell
  (kbd "<f5>") 'arm/start-server
  (kbd "<f6>") 'arm/rails-console)

(defun asok/arm-helm-ag ()
  (interactive)
  (arm/in-root (helm-ag)))

;; (evil-define-key 'normal arm-mode-map (kbd ", a") 'asok/arm-helm-ag)
