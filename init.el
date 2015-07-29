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
(setq configs-dir (concat root-dir "/configs"))
(setq hooks-dir (concat root-dir "/hooks"))

;; load configs
(add-to-list 'load-path configs-dir)

(require 'ia-core)
(require 'ia-settings)
(require 'ia-keybindings)

;; load the hooks
(mapcar 'load (directory-files hooks-dir t "\\.el\\'"))
