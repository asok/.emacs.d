(prodigy-define-service
  :name "Elastic search"
  :command "elasticsearch"
  :args '("-D" "es.config=/usr/local/opt/elasticsearch/config/elasticsearch.yml")
  :cwd "~"
  :tags '(macbook)
  :kill-signal 'sigkill)

(evil-add-hjkl-bindings prodigy-mode-map 'emacs)
