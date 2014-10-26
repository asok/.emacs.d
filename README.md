# Greetings stranger

## Introduction

This is my Emacs config repository. I use [Evil](https://gitorious.org/evil/pages/Home) which is a Vim modal editing emulation for Emacs.
I don't find it particulary well suited for Emacs newbies but maybe it might be helpful for someone.
You might want to look at the way I use packages, customize them, load them and incorporate it to your Emacs setup.
Also if you want to use Evil *maybe* the file `inits/init-evil.el` will be of some help to you.

For a full blown Emacs setup see [Emacs prelude](http://batsov.com/prelude/).

## Files

File or directory       | Description
------------------------|------------------------------------------------------------------------------------------
init.el                 | This file is loaded by Emacs when it starts up. It holds customization of Emacs and the packages that are shipped with it. This file also loads `bindings.el`, `packages.el`, `theming.el`.
bindings.el             | File that mainly holds keybindings to the Emacs' global map and some commands written by me or found in the depths of the Internet.
packages.el             | Sets up the packages. It sets [melpa](http://melpa.org/#/) as the package's archive. It lists the packages used by me. Loads the init files of each package in the `inits` directory. Also it looks up in the `site-lisp/` for packages and loads them.
theming.el              | Small file that sets up a theme.
inits/                  | A directory where the customization of the packages takes place. Files from this directory are loaded from `packages.el` file.
site-lisp/              | Manually installed packages go here. Files from this directory are loaded from `packages.el` file. The idea is that if I do not want to install a package from melpa I just clone it to `site-lisp/`. There I can change something in the package or develop my own.
snippets/               | Snippets for [yasnippet](https://github.com/capitaomorte/yasnippet)

## Keybindings

Short introductory to the Emacs terminology:

Emacs       | Rest of the world
------------|-----------------------------------------
frame       | window
point       | cursor
window      | a part of a window displaying its own buffer/file
buffer      | buffer/file
`<s-x>`     | Hold down Super/Command key and press x
`<M-x>`     | Hold down Meta/Alt key and press x
`<C-x>`     | Hold down Control key and press x
`<C-X>`     | Hold down Control key together with Shift key and press x
`<C-x C-c>` | Hold down Control key and while it's down press first x and then c
`<C-x c>`   | Hold down Control key and press x, release the Control key and press c

## Custom "Global" keybindings (that are in use in 99% of the time)

Keybinding      | Evil state    | Command              | Description
----------------|---------------|----------------------|--------------------------------------------------
`<s-d>`         | *any*         | previous-buffer      | Shows the previous buffer in the current window
`<s-f>`         | *any*         | next-buffer          | Shows the next buffer in the current window
`<s-j>`         | *any*         | windmove-down        | Puts the cursor in the window below the current one
`<s-k>`         | *any*         | windmove-up          | Puts the cursor in the window above the current one
`<s-l>`         | *any*         | windmove-right       | Puts the cursor in the window to the rigth of the current one
`<s-h>`         | *any*         | windmove-left        | Puts the cursor in the window to the left of the current one
`<, 1>`         | normal/motion | delete-other-windows | Closes all windows except for the current one
`<, 2>`         | normal/motion | split-window-below   | Like Vim's horizontal split
`<, 3>`         | normal/motion | split-window-right   | Like Vim's vertical split
`<, 0>`         | normal/motion | delete-window        | Deletes the current window
`<s-a>`         | *any*         | asok/helm-mini       | Normal helm-mini command (opened buffers and recently visited files) + shows files in the current project and in the `~/.emacs.d/` directory
`<s-s>`         | *any*         | save-buffer          | Saves the buffer to the file
`kj`            | insert        | cofi/maybe-exit      | When you press "k" and immediately after that "j" it will go back to the normal-state
`<C-backspace>` | insert/normal | backward-kill-word   | Instead of deleting 1 character before the point it deletes whole word. 3rd item in the [Steve Yegge's tips](https://sites.google.com/site/steveyegge2/effective-emacs)
`<, f>`         | normal        | ido-find-file        | Uses ido to open a file
`<, d>`         | normal        | ido-dired            | Uses ido to open a directory

## Keybindings that are in use when some mode is on

TODO


# Todos

* integrate Evil with magit better

# Useful links for newbies

## Emacs in general

* [Mastering Emacs blog](http://www.masteringemacs.org/)
* [Emacs introduction](http://tuhdo.github.io/)
* [Emacs screencasts](http://emacsrocks.com/)
* [Emacs prelude](http://batsov.com/prelude/)

## Emacs setup for Ruby on Rails

* [Setup with projectile-rails package](http://lorefnon.me/2014/02/02/configuring-emacs-for-rails.html)
* [Setup with plain projectile package](http://crypt.codemancers.com/posts/2013-09-26-setting-up-emacs-as-development-environment-on-osx/)

# Help

Feel free to use [Issues](https://github.com/asok/.emacs.d/issues) to ask me a question.
