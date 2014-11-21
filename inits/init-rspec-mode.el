(defun asok/rspec-recompile ()
  (interactive)
  (with-current-buffer "*rspec-compilation*"
    (when (string= major-mode "inf-ruby-mode")
      (inf-ruby-mode))
    (recompile)))

(evil-define-key 'normal rspec-verifiable-mode-map
  (kbd ", p") 'rspec-toggle-example-pendingness
  (kbd ", s") 'rspec-verify-single
  (kbd ", v") 'rspec-verify
  (kbd ", t") 'rspec-toggle-spec-and-target
  (kbd ", r") 'asok/rspec-recompile)

(add-hook 'enh-ruby-mode-hook 'rspec-verifiable-mode)
(add-hook 'ruby-mode-hook 'rspec-verifiable-mode)
(add-hook 'rspec-mode-hook 'evil-normalize-keymaps)

(setq rspec-use-rvm nil
      rspec-use-opts-file-when-available nil
      rspec-use-rake-when-possible nil)

(defun asok/rspec-compilation-hook ()
  (make-local-variable 'compilation-scroll-output)
  (setq compilation-scroll-output 'first-error)
  (define-key rspec-compilation-mode-map (kbd "C-x C-q") '(lambda ()
							    (interactive)
							    (inf-ruby-switch-from-compilation)
							    (comint-goto-end-and-insert))))

(add-hook 'rspec-compilation-mode-hook 'asok/rspec-compilation-hook)

(eval-after-load 'rspec-mode
                 '(progn
                    (diminish 'rspec-mode "ΡΣ")
                    (diminish 'rspec-verifiable-mode "ΡΣΩ")))
