;; Initialize cask
(require 'cask "~/.cask/cask.el")
(cask-initialize)

(when (version< emacs-version "24.1")
  (error "Requires at least GNU Emacs 24.1, but you're running %s" emacs-version))

;; Always load newest byte code
(setq load-prefer-newer t)

;; Fix load path
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; Set path
(defvar root-dir (file-name-directory load-file-name))
(defvar core-dir (expand-file-name "core" root-dir))
(defvar hooks-dir (expand-file-name "hooks" root-dir))

;; Load core files
(add-to-list 'load-path core-dir)

(require 'rk-ui)
(require 'rk-editor)
(require 'rk-global-keybindings)

;; Load the hooks
(mapcar 'load (directory-files hooks-dir t "\\.el\\'"))

;;; init.el ends here
