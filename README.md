# Greetings stranger

## Introduction

This is my Emacs config repository. I use [Evil](https://gitorious.org/evil/pages/Home) which is a Vim modal editing emulation for Emacs.
I don't find it particulary well suited for Emacs newbies but maybe it might be helpful for someone.
You might want to look at the way I use packages, customize them, load them and incorporate it to your Emacs setup.
Also if you want to use Evil *maybe* the file `inits/init-evil.el` will be of some help to you.

## Files

File or directory       | Description
------------------------|------------------------------------------------------------------------------------------
init.el                 | This file is loaded by Emacs when it starts up. It holds customization of Emacs and the packages that are shipped with it. This file also loads `bindings.el`, `packages.el`, `theming.el`.
bindings.el             | File that mainly holds keybindings to the Emacs' global map and some commands written by me or found in the depths of the Internet.
packages.el             | Sets up the packages. It sets [melpa](http://melpa.org/#/) as the package's archive. It lists the packages used by me. Loads the init files of each package in the `inits` directory. Also it looks up in the `site-lisp/` for packages and loads them. The idea is that if I do not want to install a package from melpa I just clone it to `site-lisp/`. There I can change something in the package or develop my own.
theming.el              | Small file that sets up a theme.
inits/                  | A directory where the customization of the packages takes place. Files from this directory are loaded from `packages.el` file.
site-lisp/              | Manually installed packages go here. Files from this directory are loaded from `packages.el` file.

## Keybindings

Short introductory to the Emacs terminology:

Emacs       | Rest of the world
------------|-----------------------------------------
frame       | window
point       | cursor
window      | a part of a window displaying its own buffer
buffer      | buffer/file
`<s-x>`     | Hold down Super/Command key and press x
`<M-x>`     | Hold down Meta/Alt key and press x
`<C-x>`     | Hold down Control key and press x
`<C-X>`     | Hold down Control key together with Shift key and press x
`<C-x C-c>` | Hold down Control key and while it's down press first x and then c
`<C-x c>`   | Hold down Control key and press x, release the Control key and press c

## Custom "Global" keybindings (that are in use in 99% of the time)

Keybinding      | Command                | Description
----------------|------------------------|--------------------------------------------------
`<s-d>`         | previous-buffer        | Shows the previous buffer in the current window
`<s-f>`         | next-buffer            | Shows the next buffer in the current window
`<s-j>`         | windmove-down          | Puts the cursor in the window below the current one
`<s-k>`         | windmove-up            | Puts the cursor in the window above the current one
`<s-l>`         | windmove-right         | Puts the cursor in the window to the rigth of the current one
`<s-h>`         | windmove-left          | Puts the cursor in the window to the left of the current one
`<, 1>`         | delete-other-windows   | Closes all windows except for the current one
`<, 2>`         | split-window-below     | Like Vim's horizontal split
`<, 3>`         | split-window-right     | Like Vim's vertical split
`<, 0>`         | delete-window          | Deletes the current window
`<s-a>`         | asok/helm-mini         | Normal helm-mini command (opened buffers and recently visited files) + shows files in the current project
`kj`            | cofi/maybe-exit        | When in Evil's insert-state when you press "k" and immediately after that "j" it will go back to the normal-state
`<C-backspace>` | backward-kill-word     | Instead of deleting 1 character before the point it deletes whole word. 3rd item in the [Steve Yegge's tips](https://sites.google.com/site/steveyegge2/effective-emacs)
`<, f>`         | ido-find-file          | Uses to open a file
`<, d>`         | ido-dired              | Uses to open a directory

## Keybindings that are in use when some mode is on

TODO


## Todo

* integrate Evil with magit better

# Useful links for newbies

* [Mastering Emacs blog](http://www.masteringemacs.org/)
* [Emacs introduction](http://tuhdo.github.io/)
* [Emacs screencasts](http://emacsrocks.com/)
