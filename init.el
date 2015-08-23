(when (version< emacs-version "24.1")
  (error "Requires at least GNU Emacs 24.1, but you're running %s" emacs-version))

;; Initialize cask
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; Activate installed packages
(package-initialize)

;; Enable async byte compilation for all packages
(setq async-bytecomp-allowed-packages '(all))
(async-bytecomp-package-mode)

;; Always load newest byte code
(setq load-prefer-newer t)

;; Fix load path
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; Increase the frequency of garbage collection
(setq gc-cons-threshold (* 100 1024 1024))

;; Warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)

;; Set path
(defvar root-dir (file-name-directory load-file-name))
(defvar core-dir (expand-file-name "core" root-dir))
(defvar hooks-dir (expand-file-name "hooks" root-dir))

;; Load core files
(add-to-list 'load-path core-dir)

(require 'rk-ui)
(require 'rk-editor)
(require 'rk-keybindings)

;; Load the hooks
(mapc 'load (directory-files hooks-dir t ".*\.el"))
