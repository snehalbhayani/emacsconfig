;; initialize cask
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(package-initialize)

(setq inhibit-splash-screen t)

;; Fix load path
(when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize))

;; set path
(setq root-dir "~/.emacs.d")
(setq core-dir (concat root-dir "/core"))
(setq hooks-dir (concat root-dir "/hooks"))

;; load core files
(add-to-list 'load-path core-dir)

(require 'rk-ui)
(require 'rk-editor)
(require 'rk-global-keybindings)

;; load the hooks
(mapcar 'load (directory-files hooks-dir t "\\.el\\'"))
