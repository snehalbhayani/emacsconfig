;; Initialize cask
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; Fix load path
(when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize))

;; Set path
(setq root-dir "~/.emacs.d")
(setq core-dir (concat root-dir "/core"))
(setq hooks-dir (concat root-dir "/hooks"))

;; Load core files
(add-to-list 'load-path core-dir)

(require 'rk-ui)
(require 'rk-editor)
(require 'rk-global-keybindings)

;; Load the hooks
(mapcar 'load (directory-files hooks-dir t "\\.el\\'"))
