(defun asok/rspec-recompile ()
  (interactive)
  (with-current-buffer "*compilation*"
    (recompile)))

(evil-define-key 'normal rspec-verifiable-mode-map
  (kbd ", p") 'rspec-toggle-example-pendingness
  (kbd ", s") 'rspec-verify-single
  (kbd ", v") 'rspec-verify
  (kbd ", t") 'rspec-toggle-spec-and-target
  (kbd ", r") 'asok/rspec-recompile)

(add-hook 'arm-mode-hook 'rspec-verifiable-mode)

(setq rspec-use-rvm nil)
