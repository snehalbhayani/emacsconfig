;;; Theme
;; (setq spacemacs-theme-comment-bg nil)
;; (load-theme 'spacemacs-light t)
(load-theme 'noctilux t)

;; Mode line theme
(powerline-default-theme)

;; Font
(set-frame-font "Source Code Pro 13")
;; (set-frame-font "Inconsolata 14")

;; Disable startup screen
(setq inhibit-startup-screen t)

;; Start in maximized mode
(toggle-frame-maximized)

;; Show line number
(global-linum-mode t)

;; Highlight current line
(global-hl-line-mode +1)

;; Highlight matching parentheses
(show-paren-mode t)

;; Hide right fringe
;; (fringe-mode (quote (nil . 0)))

;; No GUI
(dolist (mode '(menu-bar-mode
                tool-bar-mode
                tooltip-mode
                scroll-bar-mode
                blink-cursor-mode))
  (when (fboundp mode) (funcall mode -1)))

;; Some GUI
(dolist (mode '(column-number-mode))
  (when (fboundp mode) (funcall mode 1)))

;; Confirm before killing
(setq confirm-kill-emacs 'y-or-n-p)

;; Replace yes-no questions with y-n questions
(fset 'yes-or-no-p 'y-or-n-p)

;; Diminsh some minor modes
(require 'diminish)
(diminish 'visual-line-mode)
(with-eval-after-load 'auto-complete (diminish 'auto-complete-mode))
(with-eval-after-load 'company (diminish 'company-mode))
(with-eval-after-load 'eldoc (diminish 'eldoc-mode))
(with-eval-after-load 'guru-mode (diminish 'guru-mode))
(with-eval-after-load 'helm-mode (diminish 'helm-mode))
(with-eval-after-load 'smartparens (diminish 'smartparens-mode))
(with-eval-after-load 'tern (diminish 'tern-mode))
(with-eval-after-load 'which-key (diminish 'which-key-mode))

;; Make custom linum consistent
;; credit: http://www.emacswiki.org/emacs/LineNumbers#toc6
(require 'linum)
(with-eval-after-load 'linum
  (defface linum-leading-zero
    `((t :inherit 'linum
         :foreground ,(face-attribute 'linum :background nil t)))
    "Face for displaying leading zeroes for line numbers in display margin."
    :group 'linum)

  (defun linum-format-func (line)
    (let ((w (length
              (number-to-string (count-lines (point-min) (point-max))))))
      (concat
       (propertize (make-string (- w (length (number-to-string line))) ?0)
                   'face 'linum-leading-zero)
       (propertize (concat " " (number-to-string line) " ") 'face 'linum))))

  (setq linum-format 'linum-format-func))

(provide 'rk-ui)
