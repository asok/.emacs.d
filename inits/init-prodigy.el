(prodigy-define-service
  :name "Elastic search"
  :command "elasticsearch"
  :args '("-D" "es.config=/usr/local/opt/elasticsearch/config/elasticsearch.yml")
  :cwd "~"
  :tags '(macbook)
  :kill-signal 'sigkill)

(prodigy-define-service
  :name "navigart-api"
  :command "shotgun"
  :cwd "~/projects/navigart-api"
  :tags '(macbook)
  :kill-signal 'sigkill)

(prodigy-define-service
  :name "navigart3-v2"
  :command "grunt"
  :args '("server")
  :cwd "~/projects/navigart3-v2"
  :tags '(macbook)
  :kill-signal 'sigkill)

(prodigy-define-service
  :name "Redis"
  :command "redis-server"
  :args '("/usr/local/etc/redis.conf")
  :cwd "~"
  :tags '(macbook)
  :kill-signal 'sigkill)

(evil-add-hjkl-bindings prodigy-mode-map 'emacs)
