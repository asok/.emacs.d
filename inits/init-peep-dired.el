(require 'peep-dired)

(define-key dired-mode-map (kbd "C-c C-p") 'peep-dired)

(evil-define-key 'normal peep-dired-mode-map (kbd "<SPC>") 'peep-dired-scroll-page-down)
(evil-define-key 'normal peep-dired-mode-map (kbd "C-<SPC>") 'peep-dired-scroll-page-up)
(evil-define-key 'normal peep-dired-mode-map (kbd "<backspace>") 'peep-dired-scroll-page-up)

(evil-define-key 'normal peep-dired-mode-map (kbd "j") 'peep-dired-next-file)
(evil-define-key 'normal peep-dired-mode-map (kbd "k") 'peep-dired-prev-file)

(add-hook 'peep-dired-mode-hook 'evil-normalize-keymaps)
