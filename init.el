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

;; load configs
(add-to-list 'load-path configs-dir)

(require 'ima-settings)
