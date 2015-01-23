(require 'chruby)

(add-hook 'ruby-mode-hook #'chruby-use-corresponding)

(defun asok/chruby-use-corresponding ()
  ;; it will be set for ruby-mode already
  (when (not (eq major-mode 'ruby-mode))
    (chruby-use-corresponding)))

'(add-hook 'projectile-switch-project #'asok/chruby-use-corresponding))
