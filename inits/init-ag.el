(setq ag-highlight-search t)

(evil-define-key 'normal global-map (kbd ", a") 'ag-project)

;; (defun ag/helm-init ()
;;   (helm-init-candidates-in-buffer
;;    'local
;;    (insert (shell-command-to-string (concat "ag" arguments (ag/shell-quote string))))))

;; (defvar ag-helm-source
;;   '((name . "Ag helm source")
;;     (type . file)
;;     (disable-shortcuts)
;;     (init . ag-helm-init)
;;     (candidates-in-buffer)
;;     (mode-line . helm-generic-file-mode-line-string)
;;     (action . ag-helm-ff)))

;; (defun ag-helm ()
;;   (interactive)
;;   (helm :sources '(ag-helm-source)
;;         :prompt "Search string: "
;;         :input (ag/dwim-at-point)))

(defun af-helm-ff (c)
  ()
  )

(evil-define-key 'normal global-map (kbd ", w") 'ag)
