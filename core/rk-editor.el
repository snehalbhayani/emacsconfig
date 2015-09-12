;; Allows syntax highlighting to work
(global-font-lock-mode 1)

;; Indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; Replace selected region with typed text
(delete-selection-mode)

;; Save buffer at end of session
(setq desktop-restore-frames nil)
(desktop-save-mode 1)

;; auto-complete
(setq ac-auto-start 3
      ac-auto-show-menu 0.5
      ac-use-fuzzy t
      ac-use-menu-map t)

;; projectile
(require 'projectile)
(projectile-global-mode)
;; (setq projectile-enable-caching nil)
(setq projectile-indexing-method 'alien)
(setq projectile-use-git-grep t)
(setq projectile-completion-system 'grizzl)

;; IDO
(require 'ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(setq ido-enable-flex-matching t)
(setq read-buffer-function #'ido-read-buffer)

;; flx-ido
(require 'flx-ido)
(setq flx-ido-threshold 1000)

;;; magit
(require 'magit)
(setq magit-restore-window-configuration t
      magit-revert-buffers 'silent
      magit-push-always-verify nil
      magit-delete-by-moving-to-trash nil
      magit-diff-auto-show-delay 0.1
      magit-log-section-arguments nil
      magit-log-show-margin nil
      magit-completing-read-function 'magit-ido-completing-read)

;; Do not check for commit conventions in magit commit buffer
(with-eval-after-load 'magit
  (remove-hook 'git-commit-finish-query-functions #'git-commit-check-style-conventions))

;; Start magit in fullscreen, on exit (from magit) restore window configuration
(with-eval-after-load 'magit
  (defadvice magit-status (around magit-fullscreen activate)
    (window-configuration-to-register :magit-fullscreen)
    ad-do-it
    (delete-other-windows)))

(defun magit-quit-session ()
  "Restores the previous window configuration and kills the magit buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))

(with-eval-after-load 'magit
  (define-key magit-status-mode-map (kbd "q") 'magit-quit-session))

;; Enable magit-gitflow
(require 'magit-gitflow)
(add-hook 'magit-mode-hook 'turn-on-magit-gitflow)
(with-eval-after-load 'magit-gitflow
  (define-key magit-gitflow-mode-map (kbd "C-f") nil)
  (define-key magit-gitflow-mode-map (kbd "C-c f") 'magit-gitflow-popup))

;; smex
(require 'smex)
(smex-initialize)

;; Trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Set guru mode
(guru-global-mode +1)

;; Set smartparens mode
(require 'smartparens)
(setq sp-base-key-bindings 'paredit)
(setq sp-autoskip-closing-pair 'always)
(setq sp-hybrid-kill-entire-symbol nil)
(sp-use-paredit-bindings)
(smartparens-global-mode 1)
(show-smartparens-global-mode +1)

;; diff-hl
(global-diff-hl-mode +1)
(add-hook 'dired-mode-hook 'diff-hl-dired-mode)

;; which-key
(require 'which-key)
(which-key-mode +1)
(which-key-setup-side-window-bottom)
;; (setq which-key-idle-delay 0.5)
(setq which-key-side-window-max-height 0.5)

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

;; Setup browse kill ring
(require 'browse-kill-ring)
(setq browse-kill-ring-display-duplicates nil)
(setq browse-kill-ring-highlight-inserted-item nil)
(setq browse-kill-ring-maximum-display-length 100)
(setq browse-kill-ring-no-duplicates t)
(setq browse-kill-ring-recenter t)

(defun rk/move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.
   Move point to the first non-whitespace character on this line.
   If point is already there, move to the beginning of the line.
   Effectively toggle between the first non-whitespace character and
   the beginning of the line.
   If ARG is not nil or 1, move forward ARG - 1 lines first.
   If point reaches the beginning or end of the buffer, stop there.

   credit: http://emacsredux.com/blog/2013/05/22/smarter-navigation-to-the-beginning-of-a-line/"
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

(global-set-key [remap move-beginning-of-line] 'rk/move-beginning-of-line)

;; Use shift + arrow keys to switch between visible buffers
(require 'windmove)
(windmove-default-keybindings)

;; Use ibuffer-projectile to group buffers by projects
(defun ibuffer-projectile-setup ()
  (ibuffer-projectile-set-filter-groups)
  (unless (eq ibuffer-sorting-mode 'alphabetic)
    (ibuffer-do-sort-by-alphabetic)))

(add-hook 'ibuffer-hook #'ibuffer-projectile-setup)

;; Do not show empty groups in ibuffer
(setq ibuffer-show-empty-filter-groups nil)

(defun rk/comment-line-or-region (n)
  "Comment or uncomment current line and leave point after it.
   With positive prefix, apply to N lines including current one.
   With negative prefix, apply to -N lines above.
   If region is active, apply to active region instead.
   credit: http://endlessparentheses.com/implementing-comment-line.html"
  (interactive "p")
  (if (use-region-p)
      (comment-or-uncomment-region
       (region-beginning) (region-end))
    (let ((range
           (list (line-beginning-position)
                 (goto-char (line-end-position n)))))
      (comment-or-uncomment-region
       (apply #'min range)
       (apply #'max range)))
    ;; (forward-line 1)
    (back-to-indentation)))

(global-set-key (kbd "C-;") #'rk/comment-line-or-region)

(provide 'rk-editor)
