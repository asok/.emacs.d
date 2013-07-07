(defun asok/rspec-recompile ()
  (interactive)
  (with-current-buffer "*rspec-compilation*"
    (recompile)))

(evil-define-key 'normal rspec-verifiable-mode-map
  (kbd ", p") 'rspec-toggle-example-pendingness
  (kbd ", s") 'rspec-verify-single
  (kbd ", v") 'rspec-verify
  (kbd ", t") 'rspec-toggle-spec-and-target
  (kbd ", r") 'asok/rspec-recompile)

(add-hook 'arm-mode-hook 'rspec-verifiable-mode)

(setq rspec-use-rvm nil
      rspec-use-opts-file-when-available nil
      rspec-use-rake-when-possible nil)

(defun asok/rspec-compilation-hook ()
  (make-local-variable 'compilation-scroll-output)
  (setq compilation-scroll-output 'first-error))

(add-hook 'rspec-compilation-mode-hook 'asok/rspec-compilation-hook)



