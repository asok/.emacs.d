(require 'package)
(require 'cl)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(defvar asok/packages
  '(evil
    evil-surround
    evil-indent-textobject
    evil-matchit
    evil-easymotion
    hydra
    string-inflection
    smartparens
    diminish
    haml-mode
    markdown-mode
    bundler
    yaml-mode
    ;; mmm-mode
    ;; rbenv
    chruby
    ace-jump-mode
    magit
    ;; readline-complete
    rspec-mode
    slim-mode
    dash
    elisp-slime-nav
    expand-region
    flycheck
    helm
    helm-swoop
    ;; ido-ubiquitous
    flx-ido
    ido-vertical-mode
    rainbow-mode
    rainbow-delimiters
    smex
    solarized-theme
    anti-zenburn-theme
    undo-tree
    ;; volatile-highlights
    yasnippet
    exec-path-from-shell
    ruby-end
    zenburn-theme
    ample-theme
    grizzl
    prodigy
    ;; auto-complete
    company
    robe
    helm-ag
    js2-mode
    ag
    scss-mode
    web-mode
    jsx-mode
    ruby-refactor
    lorem-ipsum
    feature-mode
    projectile
    helm-projectile
    less-css-mode
    helm-dash
    helm-projectile
    discover
    cider
    cljsbuild-mode
    aggressive-indent
    whitespace-cleanup-mode
    highlight-indentation
    lorem-ipsum
    web-beautify
    coffee-mode
    emmet-mode
    evil-commentary
    fullframe
    wgrep
    wgrep-ag
    skewer-mode
    engine-mode
    nameless
    color-theme-sanityinc-tomorrow
    edit-server
    )
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
    (mapcar #'(lambda (dir) (add-to-list 'load-path (concat root dir)) (intern dir))
            (directory-files root nil "^[^.]+$"))))
