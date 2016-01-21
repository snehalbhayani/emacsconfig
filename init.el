;; Ensure we are using atleast GNU Emacs 24.4
(when (version< emacs-version "24.4")
  (error "Requires at least GNU Emacs 24.4, but you're running %s. Please upgrade and try again!" emacs-version))

;; Initialize cask
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; Initialize pallet
(require 'pallet)
(pallet-mode t)

;; Activate installed packages
(package-initialize)

;; Enable async byte compilation for all packages
(require 'async-bytecomp)
(setq async-bytecomp-allowed-packages '(all))
(async-bytecomp-package-mode)

;; Always load newest byte code
(setq load-prefer-newer t)

;; Enable auto-compile mode
(require 'auto-compile)
(auto-compile-on-load-mode 1)
(auto-compile-on-save-mode 1)

;; Enable all disabled commands
(setq disabled-command-function nil)

;; Fix load path
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; Increase the frequency of garbage collection
(setq gc-cons-threshold (* 128 1024 1024))

;; Warn when opening files bigger than 100MB
(setq large-file-warning-threshold (* 100 1024 1024))

;; Set path
;; (defvar root-dir (file-name-directory load-file-name))
(defvar root-dir "~/.emacs.d")
(defvar core-dir (concat root-dir "/core"))
(defvar hooks-dir (concat root-dir "/hooks"))
(defvar lang-dir (concat root-dir "/lang"))
(defvar custom-dir (concat root-dir "/custom"))

;; Load core files
(add-to-list 'load-path core-dir)

(require 'rk-ui)
(require 'rk-editor)
(require 'rk-windows)
(require 'rk-keybindings)

(mapc 'load (directory-files hooks-dir t "\\.el\\'"))
(mapc 'load (directory-files lang-dir t "\\.el\\'"))
(mapc 'load (directory-files custom-dir t "\\.el\\'"))
