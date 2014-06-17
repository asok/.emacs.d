(add-hook 'ruby-mode-hook 'asok/delete-trailing-whitespace-on-file-write)

(evil-define-key 'insert ruby-mode-map (kbd "RET") 'evil-ret-and-indent)

(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))

(defun asok/indend-ruby ()
  (when (looking-back "\\(?:\\_<end\\|\\_<else\\)")
    (indent-according-to-mode)))

(defun asok/add-indend-ruby-to-ruby-mode-hook ()
  (add-hook 'evil-insert-state-exit-hook 'asok/indend-ruby nil t))
(add-hook 'ruby-mode-hook 'asok/add-indend-ruby-to-ruby-mode-hook)
