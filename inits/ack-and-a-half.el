(defalias 'ack 'ack-and-a-half)
(defalias 'ack-same 'ack-and-a-half-same)
(defalias 'ack-find-file 'ack-and-a-half-find-file)
(defalias 'ack-find-file-same 'ack-and-a-half-find-file-same)

(defun ack-in-directory (pattern &optional regexp directory)
  "Run ack inside a directory"
  (interactive (ack-and-a-half-interactive))
  (ack-and-a-half-run (read-directory-name "directory to look in") regexp pattern))

(evil-define-key 'normal global-map (kbd ", w") 'ack-in-directory)
