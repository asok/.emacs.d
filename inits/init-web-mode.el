(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(add-to-list 'auto-mode-alist '("\\.js\\.erb\\'" . js-mode))

(setq web-mode-symbol-face 'font-lock-constant-face
      web-mode-markup-indent-offset 2
      web-mode-css-indent-offset 2
      web-mode-enable-auto-quoting nil
      web-mode-code-indent-offset 2)

(defun asok/turn-on-sp-maybe ()
  (when (string-match-p "\\.js$" (buffer-file-name))
    (smartparens-mode +1)))

(add-hook 'web-mode-hook #'asok/turn-on-sp-maybe)

;; (eval-after-load 'flycheck
;;   '(progn
;;      (flycheck-define-checker jsxhint-checker
;;        "A JSX syntax and style checker based on JSXHint."

;;        :command ("jsxhint" source)
;;        :error-patterns
;;        ((error line-start (1+ nonl) ": line " line ", col " column ", " (message) line-end))
;;        :modes (web-mode))
;;      (add-hook 'web-mode-hook
;;                (lambda ()
;;                  (when (equal web-mode-content-type "jsx")
;;                    ;; enable flycheck
;;                    (flycheck-select-checker 'jsxhint-checker)
;;                    (flycheck-mode))))))
