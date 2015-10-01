(defun asok/rspec-recompile ()
  (interactive)
  (with-current-buffer "*rspec-compilation*"
    (when (string= major-mode "inf-ruby-mode")
      (inf-ruby-mode))
    (recompile)))

;; TODO: migrate the keybindings to hydra
;; (evil-define-key 'normal rspec-verifiable-mode-map
;;   (asok/leader-kbd "p") 'rspec-toggle-example-pendingness
;;   (asok/leader-kbd "s") 'rspec-verify-single
;;   (asok/leader-kbd "v") 'rspec-verify
;;   (asok/leader-kbd "t") 'rspec-toggle-spec-and-target
;;   (asok/leader-kbd "r") 'asok/rspec-recompile)

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

(defun asok/rspec-2-split ()
  (interactive)
  (delete-other-windows)
  (split-window-right)
  (other-window 1)
  (rspec-toggle-spec-and-target)
  (other-window 1))
