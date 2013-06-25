(require 'package)
(require 'cl)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(defvar asok/packages
  '(evil
    surround
    haml-mode
    markdown-mode
    bundler
    inf-ruby
    yaml-mode
    mmm-mode
    rbenv
    ace-jump-mode
    ack-and-a-half
    wgrep
    wgrep-ack
    magit
    ;readline-complete
    enh-ruby-mode
    rspec-mode
    robe
    slim-mode
    dash
    elisp-slime-nav
    expand-region
    ;; flycheck
    ;; gist
    ;; guru-mode
    helm
    ido-ubiquitous
    ;rainbow-mode
    smex
    solarized-theme
    undo-tree
    ;; volatile-highlights
    yasnippet
    exec-path-from-shell
    ruby-end
    zenburn-theme
    auto-complete
    helm-ag
    helm-rails)
  "List of packages installed via package.el")

(defun asok/install-packages (&optional force)
  (package-initialize)
  (when (or force (notevery #'package-installed-p asok/packages))
    (package-refresh-contents)
    (mapc #'package-install
          (remove-if #'package-installed-p asok/packages))))

(defun asok/init-packages ()
  (loop for package in asok/packages do
        (let ((file (concat "~/.emacs.d/inits/" (symbol-name package))))
          (when (file-exists-p (concat file ".el")) 
            (load file)))))

(defun asok/init-manual-packages ()
  (let ((asok/packages '(peep-dired arm)))
    (loop for package in asok/packages
          do (add-to-list 'load-path (concat "~/.emacs.d/site-lisp/" (symbol-name package))))
    (asok/init-packages)))
