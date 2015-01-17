(require 'package)
(require 'cl)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(defvar asok/packages
  '(paredit
    evil
    evil-surround
    evil-indent-textobject
    evil-matchit
    diminish
    haml-mode
    markdown-mode
    bundler
    yaml-mode
    ;; mmm-mode
    rbenv
    ace-jump-mode
    magit
    ;readline-complete
    rspec-mode
    slim-mode
    dash
    elisp-slime-nav
    expand-region
    flycheck
    helm
    ido-ubiquitous
    flx-ido
    ido-vertical-mode
    rainbow-mode
    rainbow-delimiters
    smex
    solarized-theme
    undo-tree
    ;; volatile-highlights
    yasnippet
    exec-path-from-shell
    ruby-end
    zenburn-theme
    ample-theme
    grizzl
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
    wgrep
    wgrep-ag
    sublime-themes)
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
