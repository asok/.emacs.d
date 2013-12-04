(add-hook 'ruby-mode-hook 'ruby-refactor-mode-launch)

(eval-after-load 'ruby-refactor
  '(diminish 'ruby-refactor-mode " ΡΡ"))

