(require 'engine-mode)

(setq engine/browser-function 'browse-url-chromium)

(defengine wikipedia
 "http://www.wikipedia.org/search-redirect.php?language=en&go=Go&search=%s"
 :keybinding "w"
 :docstring "Searchin' the wikis.")

(defengine duckduckgo
 "https://duckduckgo.com/?q=%s"
 :keybinding "d")

(defengine github
 "https://github.com/search?ref=simplesearch&q=%s")

(defengine google
 "http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s"
 :keybinding "g")

(defengine google-images
 "http://www.google.com/images?hl=en&source=hp&biw=1440&bih=795&gbv=2&aq=f&aqi=&aql=&oq=&q=%s")

(defengine google-maps
 "http://maps.google.com/maps?q=%s"
 :docstring "Mappin' it up.")

(eval-after-load 'hydra
  `(defhydra hydra-engine (:color blue)
     ("w" engine/search-wikipedia     "wikipedia")
     ("d" engine/search-duckduckgo    "duckduckgo")
     ("h" engine/search-github        "github")
     ("g" engine/search-google        "google")
     ("i" engine/search-google-images "google-images")
     ("m" engine/search-google-maps   "google-maps")))
