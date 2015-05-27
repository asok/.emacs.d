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

(defhydra hydra-eval (:color blue)
  "Eval"
  ("e" eval-expression "expression")
  ("d" eval-defun "defun")
  ("b" eval-buffer "buffer")
  ("l" eval-last-sexp "last sexp"))

(defhydra hydra-projectile (:color blue)
  "Projectile"
  ("f" helm-projectile-find-file "find file")
  ("g" helm-projectile-find-file-dwim "find file dwim")
  ("F" helm-projectile-find-file-in-known-projects "file in projects")
  ("p" helm-projectile-switch-project "switch project")
  ("P" projectile-test-project "test")
  ("a" helm-projectile-ag "ag"))

(defhydra hydra-hl (:color blue)
  "Highlight"
  ("s" highlight-symbol-at-point "symbol at point")
  ("r" highlight-regexp "regexp")
  ("i" highlight-indentation-mode "indentation")
  ("h" hi-lock-mode "toggle hi-lock-mode"))

(defhydra hydra-winner (:color red)
  "Winner"
  ("h" winner-undo "undo")
  ("l" winner-redo "redo"))

(defhydra hydra-help (:color blue)
  ("f" describe-function "function")
  ("F" Info-goto-emacs-command-node "goto command")
  ("v" describe-variable "variable")
  ("m" describe-mode "mode")
  ("@" describe-face "face")
  ("k" describe-key "key")
  ("t" describe-theme "theme")
  ("b" describe-bindings "bindings")
  ("p" describe-package "package"))

(defhydra hydra-magit (:color blue)
  ("c" magit-status "status")
  ("C" magit-checkout "checkout")
  ("v" magit-branch-manager "branch manager")
  ("m" magit-merge "merge")
  ("m" magit-log "log")
  ("!" magit-git-command "command")
  ("$" magit-process "process"))

(setq asok/hydra-global-heads
      '(
        ("0" delete-window "delete window")
        ("1" delete-other-windows "delete other windows")
        ("2" split-window-below "split horizontally")
        ("3" split-window-right "split vertically")
        ("w" hydra-winner/body "winner")
        ("8" helm-swoop "swoop")
        ("o" helm-global-mark-ring)
        ("k" helm-show-kill-ring "kill ring")
        ("m" helm-all-mark-rings "all mark rings")
        ("f" helm-find-files "find files")
        ("d" ido-dired "dired")
        ("x" helm-M-x "M-x")
        ("." helm-resume "helm resume")
        ("g" hydra-engine/body "engine")
        ("c" hydra-magit/body "magit")
        ("a" ag-project "ag project")
        ("A" ag "ag dir")
        ("SPC" evil-ace-jump-word-mode "ace jump")
        ("h" hydra-hl/body "highlight")
        ("p" hydra-projectile/body "projectile")
        ("e" hydra-eval/body "eval")
        ("?" hydra-help/body "help")
        )
      )

(eval
 `(defhydra hydra-spawn-global (:color blue)
    "Hydra"
    ,@asok/hydra-global-heads))

(evil-define-key 'normal global-map (kbd "<SPC>") 'hydra-spawn-global/body)
(evil-define-key 'motion global-map (kbd "<SPC>") 'hydra-spawn-global/body)

(evil-declare-not-repeat 'hydra-spawn-global/body)
