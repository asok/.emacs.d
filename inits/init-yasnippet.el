(yas-global-mode 1)
(require 'yasnippet)
(setq yas/root-directory "~/.emacs.d/snippets")
(yas/load-directory yas/root-directory)

(defun asok/insert-new-line-maybe ()
  (save-excursion
    (goto-char yas-snippet-end)
    (unless (or (looking-at "\n\n") (looking-at "\n[\t ]+end"))
      (insert "\n"))))

(add-hook 'ruby-mode-hook 'asok/register-ruby-yas-after-exit-snippet-hook)
(add-hook 'enh-ruby-mode-hook 'asok/register-ruby-yas-after-exit-snippet-hook)
(defun asok/register-ruby-yas-after-exit-snippet-hook ()
  (add-hook 'yas-after-exit-snippet-hook 'asok/insert-new-line-maybe t t))

(diminish 'yas-minor-mode " Υ")

