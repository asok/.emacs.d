(require 'haml-mode)
(add-hook 'haml-mode-hook 'asok/delete-trailing-whitespace-on-file-write)
(modify-syntax-entry ?\' "\"" haml-mode-syntax-table)
