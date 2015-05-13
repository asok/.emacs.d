(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#002b36" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#839496"])
 '(column-number-mode t)
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("1db337246ebc9c083be0d728f8d20913a0f46edc0a00277746ba411c149d7fe5" "efb148b9a120f417464713fe6cad47eb708dc45c7f2dbfeea4a7ec329214e63e" "57d7e8b7b7e0a22dc07357f0c30d18b33ffcbb7bcd9013ab2c9f70748cfa4838" "50d8de7ef10b93c4c7251888ff845577004e086c5bfb2c4bb71eca51b474063a" "eb399cbd3ea4c93d9ab15b513fd6638e801600e13c8a70b56f38e609397a5eca" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "7bde52fdac7ac54d00f3d4c559f2f7aa899311655e7eb20ec5491f3b5c533fe8" "4e4276f190039674038a4fb98b434588ab3995a9e52b416d4c9f433f0854683c" "bbb51078321186cbbbcb38f9b74ea154154af10c5d9c61d2b0258cb4401ac038" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "f9e975bdf5843982f4860b39b2409d7fa66afab3deb2616c41a403d788749628" "9dae95cdbed1505d45322ef8b5aa90ccb6cb59e0ff26fef0b8f411dfc416c552" "c9445e1f0bd72e79e35f3e6f04c22ccf37e3a187a8e5581b84e8ea8116fe0912" "8d6fb24169d94df45422617a1dfabf15ca42a97d594d28b3584dc6db711e0e0b" "1a85b8ade3d7cf76897b338ff3b20409cb5a5fbed4e45c6f38c98eee7b025ad4" "c1af7190a6855a376f7a7563445687064af6d8bdca423136cb013c93fbfd1b00" "d809ca3cef02087b48f3f94279b86feca896f544ae4a82b523fba823206b6040" "8f7e1668dd3a097964e6016c26d36822ab2e48fc3e9a3a2e2634224a5ca728c8" "1e194b1010c026b1401146e24a85e4b7c545276845fc38b8c4b371c8338172ad" "6e92ca53a22d9b0577ad0b16e07e2e020c8b621197e39fec454048e51b7954cb" "ae6bd7f084a34cb4b843318257e432923def9d319425fe2de363fb198e9c340c" "7a9f392481b6e2fb027ab9d8053ab36c0f23bf5cc1271206982339370d894c74" "7510a584af781790efcf5e88d038e1b236da4f63596e4aa877ad80e117e0eb70" "2a7d3aa0e2abac5ff8cb297d890ea4ff0d602d3627d2228d97f2f353d2286f63" "900c43009d74b7f7a14decf31c7158541b7672e83110873b9225d06a8cd3d8a3" "b22d00ccd4759f84d8a1d024812555a9408b26fc2fccaf2f07251c5331f20554" "cc9cba8d35b4f25185111fdbe54e63be89b22908e16db2eb9b63e39065001f42" "6cd73285bbc41109add8129531b239543e355d97f35ed74714175ee00ac4f537" "3d6b08cd1b1def3cc0bc6a3909f67475e5612dba9fa98f8b842433d827af5d30" "d0ff5ea54497471567ed15eb7279c37aef3465713fb97a50d46d95fe11ab4739" "c7359bd375132044fe993562dfa736ae79efc620f68bab36bd686430c980df1c" "61d1a82d5eaafffbdd3cab1ac843da873304d1f05f66ab5a981f833a3aec3fc0" "e26780280b5248eb9b2d02a237d9941956fc94972443b0f7aeec12b5c15db9f3" "978bd4603630ecb1f01793af60beb52cb44734fc14b95c62e7b1a05f89b6c811" "f220c05492910a305f5d26414ad82bf25a321c35aa05b1565be12f253579dec6" "29a4267a4ae1e8b06934fec2ee49472daebd45e1ee6a10d8ff747853f9a3e622" "dc46381844ec8fcf9607a319aa6b442244d8c7a734a2625dac6a1f63e34bc4a6" "d293542c9d4be8a9e9ec8afd6938c7304ac3d0d39110344908706614ed5861c9" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(electric-indent-mode nil)
 '(electric-pair-mode t)
 '(evil-symbol-word-search t)
 '(fci-rule-color "#073642")
 '(fringe-mode nil nil (fringe))
 '(global-aggressive-indent-mode nil)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 '(hl-fg-colors
   (quote
    ("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(linum-format " %7i ")
 '(magit-use-overlays t)
 '(safe-local-variable-values
   (quote
    ((eval progn
           (setq web-mode-content-types-alist
                 (\`
                  (("jsx" \,
                    (concat default-directory ".*\\.js"))))))
     (eval progn
           (add-hook
            (quote js2-mode-hook)
            (quote
             (lambda nil
               (when
                   (string-match-p "\\bReact\\.createClass\\b"
                                   (buffer-substring-no-properties
                                    (point-min)
                                    (point-max)))
                 (web-mode))))
            t t)
           (setq web-mode-content-types-alist
                 (\`
                  (("jsx" \,
                    (concat default-directory ".*\\.js"))))))
     (eval progn
           (add-hook
            (quote js2-mode-hook)
            (quote
             (lambda nil
               (when
                   (string-match-p "\\bReact\\.createClass\\b"
                                   (buffer-substring-no-properties 0
                                                                   (point-max)))
                 (web-mode))))
            t t)
           (setq web-mode-content-types-alist
                 (\`
                  (("jsx" \,
                    (concat default-directory ".*\\.js"))))))
     (web-mode-enable-auto-quoting)
     (eval setq web-mode-content-types-alist
           (\`
            (("jsx" \,
              (concat default-directory ".*\\.js")))))
     (eval when
           (and
            (buffer-file-name)
            (file-regular-p
             (buffer-file-name))
            (string-match-p "^[^.]"
                            (buffer-file-name)))
           (emacs-lisp-mode)
           (when
               (fboundp
                (quote flycheck-mode))
             (flycheck-mode -1))
           (unless
               (featurep
                (quote package-build))
             (let
                 ((load-path
                   (cons ".." load-path)))
               (require
                (quote package-build))))
           (package-build-minor-mode))
     (eval when
           (fboundp
            (quote rainbow-mode))
           (rainbow-mode 1)))))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(syslog-debug-face
   (quote
    ((t :background unspecified :foreground "#2aa198" :weight bold))))
 '(syslog-error-face
   (quote
    ((t :background unspecified :foreground "#dc322f" :weight bold))))
 '(syslog-hour-face (quote ((t :background unspecified :foreground "#859900"))))
 '(syslog-info-face
   (quote
    ((t :background unspecified :foreground "#268bd2" :weight bold))))
 '(syslog-ip-face (quote ((t :background unspecified :foreground "#b58900"))))
 '(syslog-su-face (quote ((t :background unspecified :foreground "#d33682"))))
 '(syslog-warn-face
   (quote
    ((t :background unspecified :foreground "#cb4b16" :weight bold))))
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#b58900")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#859900")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#2aa198")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-selection ((t (:underline "ForestGreen")))))
