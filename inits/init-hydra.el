(require 'hydra)

(defun asok/set-hydra-faces ()
  (set-face-attribute
   'hydra-face-red nil
   :foreground (face-attribute 'font-lock-constant-face :foreground))
  (set-face-attribute
   'hydra-face-blue nil
   :foreground (face-attribute 'font-lock-string-face :foreground)))

(defadvice load-theme
    (after set-hydra-faces activate)
  (asok/set-hydra-faces))

(asok/set-hydra-faces)

(defhydra hydra-eval (:color blue :columns 8)
  "Eval"
  ("e" eval-expression "expression")
  ("d" eval-defun "defun")
  ("b" eval-buffer "buffer")
  ("l" eval-last-sexp "last sexp")
  ("1" async-shell-command "shell-command"))

(defhydra hydra-projectile (:color blue :columns 8)
  "Projectile"
  ("f" helm-projectile-find-file "find file")
  ("g" helm-projectile-find-file-dwim "find file dwim")
  ("F" helm-projectile-find-file-in-known-projects "file in projects")
  ("p" helm-projectile-switch-project "switch project")
  ("P" projectile-test-project "test")
  ("a" helm-projectile-ag "ag")
  ("j" helm-projectile-switch-to-buffer "buffer"))

(defhydra hydra-hl (:color blue :columns 8)
  "Highlight"
  ("s" highlight-symbol-at-point "symbol at point")
  ("r" highlight-regexp "regexp")
  ("i" highlight-indentation-mode "indentation")
  ("h" hi-lock-mode "toggle hi-lock-mode"))

(defhydra hydra-winner (:color red :columns 8)
  "Winner"
  ("h" winner-undo "undo")
  ("l" winner-redo "redo"))

(defhydra hydra-help (:color blue :columns 8)
  "Help"
  ("f" describe-function "function")
  ("F" Info-goto-emacs-command-node "goto command")
  ("v" describe-variable "variable")
  ("m" describe-mode "mode")
  ("@" describe-face "face")
  ("k" describe-key "key")
  ("t" describe-theme "theme")
  ("b" describe-bindings "bindings")
  ("p" describe-package "package")
  ("d" helm-dash "dash")
  ("." helm-dash-at-point "dash at point"))

(defhydra hydra-magit (:color blue :columns 8)
  "Magit"
  ("c" magit-status "status")
  ("C" magit-checkout "checkout")
  ("v" magit-branch-manager "branch manager")
  ("m" magit-merge "merge")
  ("l" magit-log "log")
  ("!" magit-git-command "command")
  ("$" magit-process "process"))

(defhydra hydra-sp (:color red :columns 8)
  "Smartparens"
  ("h" sp-backward-slurp-sexp "backward-slurp")
  ("j" sp-backward-barf-sexp "backward-barf")
  ("k" sp-forward-barf-sexp "forward-barf")
  ("l" sp-forward-slurp-sexp "forward-slurp")
  ("s" sp-splice-sexp "forward-slurp")
  ("9" asok/sp-wrap-with-parenthesis "wrap (" :exit t)
  ("[" asok/sp-wrap-with-square-brackets "wrap [" :exit t)
  ("{" asok/sp-wrap-with-curly-braces "wrap {" :exit t)
  ("'" asok/sp-wrap-with-quotes "wrap \"" :exit t)
  )

(defhydra hydra-rspec (:color blue :columns 8)
  "RSpec"
  ("r" rspec-rerun "rerun")
  ("v" rspec-verify "verify")
  ("a" rspec-verify-all "all")
  ("t" rspec-toggle-spec-and-target "toggle")
  ("e" rspec-toggle-spec-and-target-find-example "toggle method")
  ("f" rspec-run-last-failed "failed")
  ("s" rspec-verify-single "single")
  ("m" rspec-verify-matching "matching")
  ("d" rspec-toggle-example-pendingness "pending")
  )

(setq asok/hydra-global-heads
      '(
        ("0" delete-window "delete window")
        ("1" delete-other-windows "delete other windows")
        ("2" split-window-below "split horizontally")
        ("3" split-window-right "split vertically")
        ("#" server-edit "server edit")
        ("w" hydra-winner/body "winner")
        ("9" hydra-sp/body "sp")
        ("s" save-buffer "save")
        ("o" helm-global-mark-ring "global mark ring")
        ("k" helm-show-kill-ring "kill ring")
        ("m" helm-all-mark-rings "all mark rings")
        ("f" helm-find-files "find files")
        ("d" ido-dired "dired")
        ("x" helm-M-x "M-x")
        ("j" asok/helm-mini "helm mini")
        ("." helm-resume "helm resume")
        ("g" hydra-engine/body "engine")
        ("c" hydra-magit/body "magit")
        ("a" ag-project "ag project")
        ("A" ag "ag dir")
        ("SPC" avy-goto-char "avy")
        ("8" hydra-hl/body "highlight")
        ("*" helm-swoop "swoop")
        ("p" hydra-projectile/body "projectile")
        ("e" hydra-eval/body "eval")
        ("r" hydra-rspec/body "rspec")
        ("R" hydra-projectile-rails/body "rails")
        ("h" hydra-help/body "help")
        )
      )

(eval
 `(defhydra hydra-spawn-global (:color blue :columns 8)
    "Hydra"
    ,@asok/hydra-global-heads))

(evil-define-key 'spc    global-map (kbd "<SPC>") 'hydra-spawn-global/body)
(evil-define-key 'normal global-map (kbd "<SPC>") 'hydra-spawn-global/body)
(evil-define-key 'motion global-map (kbd "<SPC>") 'hydra-spawn-global/body)

(evil-declare-not-repeat 'hydra-spawn-global/body)
