(require 'package)
(require 'cl)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(defvar asok/packages
  '(evil
    surround
    evil-indent-textobject
    haml-mode
    markdown-mode
    bundler
    inf-ruby
    yaml-mode
    ;; mmm-mode
    rbenv
    ace-jump-mode
    ack-and-a-half
    magit
    ;readline-complete
    ;; enh-ruby-mode
    rspec-mode
    robe
    slim-mode
    ;; paredit-mode
    dash
    elisp-slime-nav
    expand-region
    flycheck
    ;; gist
    helm
    ido-ubiquitous
    rainbow-mode
    smex
    solarized-theme
    undo-tree
    ;; volatile-highlights
    yasnippet
    exec-path-from-shell
    ;; ruby-end
    zenburn-theme
    auto-complete
    helm-ag
    js2-mode
    ag
    ;; rhtml-mode
    scss-mode
    ;; web-mode
    ruby-refactor
    lorem-ipsum
    feature-mode
    powerline
    helm-rails)
  "List of packages installed via package.el")

(defun asok/install-packages ()
  (package-initialize)
  (when (notevery #'package-installed-p asok/packages)
    (package-refresh-contents)
    (mapc #'package-install
          (remove-if #'package-installed-p asok/packages))))

(defun asok/init-packages ()
  (loop for package in (append asok/packages (asok/discover-site-lisp-packages)) do
        (let ((file (concat "~/.emacs.d/inits/init-" (symbol-name package))))
          (when (file-exists-p (concat file ".el")) 
            (load file)))))

(defun asok/discover-site-lisp-packages ()
  (let ((root "~/.emacs.d/site-lisp/"))
    (mapcar '(lambda (dir) (add-to-list 'load-path (concat root dir)) (intern dir))
            (directory-files root nil "^[^.]+$"))))
