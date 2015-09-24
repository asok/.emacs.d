(require 'exec-path-from-shell)

(let ((secrets "~/.secrets.sh"))
  (when (file-exists-p secrets)
    (with-temp-buffer
      (insert-file-contents secrets)
      (while (re-search-forward "\\bexport \\(.+\\)=\".*\"" nil t)
        (add-to-list 'exec-path-from-shell-variables (match-string 1))))))

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
