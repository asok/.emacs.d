(evil-define-motion evil-ace-jump-char-mode (count)
  :type exclusive
  (ace-jump-mode 5)
  (recursive-edit))

(evil-define-motion evil-ace-jump-line-mode (count)
  :type line
  (ace-jump-mode 9)
  (recursive-edit))

(evil-define-motion evil-ace-jump-word-mode (count)
  :type exclusive
  (ace-jump-mode 1)
  (recursive-edit))

(evil-define-motion evil-ace-jump-char-direct-mode (count)
  :type inclusive
  (ace-jump-mode 5)
  (forward-char 1)
  (recursive-edit))

(add-hook 'ace-jump-mode-end-hook 'exit-recursive-edit)

(asok/evil-define-key-when-global-map '(normal motion)
                                      (kbd "SPC") 'evil-ace-jump-word-mode
                                      (kbd "C-SPC") 'evil-ace-jump-char-mode)
