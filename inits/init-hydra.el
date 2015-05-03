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
  ("a" helm-projectile-ag "ag"))

(defhydra hydra-hl (:color blue)
  "Highlight"
  ("s" highlight-symbol-at-point "symbol at point")
  ("i" highlight-indentation-mode "indentation")
  ("h" hi-lock-mode "toggle hi-lock-mode"))

(setq asok/hydra-global-heads
      '(("h" hydra-hl/body "highlight")
        ("p" hydra-projectile/body "projectile")
        ("e" hydra-eval/body "eval")
        ("0" delete-window "delete window")
        ("1" delete-other-windows "delete other windows")
        ("2" split-window-below "split horizontally")
        ("3" split-window-right "split vertically")
        ("o" helm-swoop "swoop")
        ("m" helm-all-mark-rings "all mark rings")
        ("f" helm-find-files "find files")
        ("d" ido-dired "dired")
        ("c" magit-status "git status")
        ("C" magit-checkout "git checkout")
        ("a" ag-project "ag project")
        ("A" ag "ag dir")
        ("SPC" evil-ace-jump-word-mode "ace jump")))

(eval
 `(defhydra hydra-spawn-global (:color blue)
    "Hydra"
    ,@asok/hydra-global-heads))

(evil-define-key 'normal global-map (kbd "<SPC>") 'hydra-spawn-global/body)
