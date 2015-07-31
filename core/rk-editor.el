;; Allows syntax highlighting to work
(global-font-lock-mode 1)

;; No tabs for indentation
(setq-default indent-tabs-mode nil)

;; Save buffer at end of session
(setq desktop-restore-frames nil)
(desktop-save-mode 1)

;; projectile
(require 'projectile)
(require 'grizzl)
(projectile-global-mode)
;; (setq projectile-enable-caching nil)
(setq projectile-indexing-method 'alien)
(setq projectile-use-git-grep t)
(setq projectile-completion-system 'grizzl)

;; pallet
(require 'pallet)
(pallet-mode t)

;; IDO
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; magit
(setq magit-last-seen-setup-instructions "2.1.0")
(setq magit-status-buffer-switch-function 'switch-to-buffer)

;; smex
(require 'smex)
(smex-initialize)

;; Trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Set guru mode
(guru-global-mode +1)

;; Set smartparens mode
(smartparens-global-mode 1)

;; Enable company mode
(global-company-mode t)

;; diff-hl
(global-diff-hl-mode)

;; which-key
(which-key-mode)
(which-key-setup-side-window-right)

;; Scratch buffer configuration
(kill-buffer "*scratch*")
(setq initial-scratch-message nil)

;; Allow pasting selection outside of Emacs
(setq x-select-enable-clipboard t)

;; Auto refresh buffers
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)
(add-hook 'ibuffer-mode-hook (lambda () (ibuffer-auto-mode 1)))

;; UTF-8 encoding
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(defun rekenerd-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.
Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.
If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there.
source: http://emacsredux.com/blog/2013/05/22/smarter-navigation-to-the-beginning-of-a-line/"
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

(global-set-key [remap move-beginning-of-line] 'rekenerd-move-beginning-of-line)

(provide 'rk-editor)
