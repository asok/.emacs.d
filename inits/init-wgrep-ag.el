(autoload 'wgrep-ag-setup "wgrep-ag")
(add-hook 'ag-mode-hook 'wgrep-ag-setup)
(add-hook 'wgrep-setup-hook 'evil-normal-state)

(setq wgrep-auto-save-buffer t)
