(require 'exec-path-from-shell)

(add-to-list 'exec-path-from-shell-variables "JAVA_OPTS")

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
