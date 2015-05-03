# Greetings stranger

## Introduction

This is my Emacs config repository. I use [Evil](https://gitorious.org/evil/pages/Home) which is a Vim modal editing emulation for Emacs.
I don't find it particulary well suited for Emacs newbies but maybe it might be helpful for someone.
You might want to look at the way I use packages, customize them, load them and incorporate it to your Emacs setup.
Also if you want to use Evil *maybe* the file `inits/init-evil.el` will be of some help to you.

I am using [Hydra](https://github.com/abo-abo/hydra) as well.

For a full blown Emacs setup see [Emacs prelude](http://batsov.com/prelude/) or [Spacemacs](https://github.com/syl20bnr/spacemacs).

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
themes/                 | Custom themes that are just plain el files and need to be loaded manually from `theming.el` file

## Keybindings

### Emacs windows navigation

Often instead of opening a buffer list and selecting a buffer to switch to I just cycle the buffers through with `<s-d>` and `<s-f>`.
Rationale behind it is that when I edit a file and I know that a moment ago I was editing another file, instead of making a mental effort to remember the file's name, opening the buffer list, reading it and selecting the corrent one I just cycle to the previous buffer. Maybe it will not be the buffer right before the current one, but I will just keep cycling back by 1-4 buffers and once I see it I just stop.

### Global keybingins

Hit `SPC` when in `evil-normal-state` to see what keybindings are available.

### Keybindings that are in use when some mode is on

#### Ido

Keybinding | Command        | Description
-----------|----------------|------------------
`<SPC>`    | ido-next-match | Cycles to the next choice. Normally I use ido to choose a function or a file. Functions in Emacs they never have a space in their name. When I look at my files I do not put spaces in the names of my files neither. So hitting `<SPC>` is much faster then hitting `<C-n>` which is the default binding for `ido-next-match`.
`<C-SPC>`  | ido-prev-match | Cycles to prev choice. Rational behind this as described for `ido-next-match`.

## Todos

* integrate Evil with magit better

## Useful links for newbies

### Emacs in general

* [Mastering Emacs blog](http://www.masteringemacs.org/)
* [Emacs introduction](http://tuhdo.github.io/)
* [Emacs screencasts](http://emacsrocks.com/)
* [Emacs prelude](http://batsov.com/prelude/)

### Emacs setup for Ruby on Rails

* [Setup with projectile-rails package](http://lorefnon.me/2014/02/02/configuring-emacs-for-rails.html)
* [Setup with plain projectile package](http://crypt.codemancers.com/posts/2013-09-26-setting-up-emacs-as-development-environment-on-osx/)

## Help

Feel free to use [Issues](https://github.com/asok/.emacs.d/issues) to ask me a question.
