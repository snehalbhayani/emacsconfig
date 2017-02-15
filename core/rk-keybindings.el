;; Change font size
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; Start eshell or switch to it if it's active.
(global-set-key (kbd "C-x m") 'eshell)

;; Toggle menu-bar visibility
(global-set-key (kbd "<f12>") 'menu-bar-mode)

(global-set-key (kbd "C-x g") 'magit-status)

;; Replace buffer-menu with ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Mutliple cursors
(global-set-key (kbd "C-S-m") 'mc/mark-more-like-this-extended)
(global-set-key (kbd "C-S-l") 'mc/edit-lines)
(global-set-key (kbd "C-S-c") 'mc/mark-all-like-this-dwim)
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)
(global-set-key (kbd "C-S-r") 'set-rectangular-region-anchor)
(global-set-key (kbd "C-S-a") 'mc/mark-all-in-region-regexp)
(global-set-key (kbd "C-c u t") 'kill-region)
(global-set-key (kbd "C-c p y") 'kill-ring-save)
(global-set-key (kbd "C-p") 'yank)
(global-set-key (kbd "<right>") 'forward-char)
(global-set-key (kbd "<left>") 'backward-char)
(global-set-key (kbd "<delete>") 'delete-char)
(defun snehal/move-to-next-delimiter ()
  (interactive)
  (ignore-errors (search-forward-regexp "[^[:alnum:]]")))
(defun snehal/move-to-prev-delimiter ()
  (interactive)
  (ignore-errors (search-backward-regexp "[^[:alnum:]]")))

(with-eval-after-load 'smartparens
  (global-set-key (kbd "<C-left>") nil)
  (global-set-key (kbd "<C-right>") nil))

(define-key smartparens-mode-map (kbd "<C-right>") 'snehal/move-to-next-delimiter)
(define-key smartparens-mode-map (kbd "<C-left>") 'snehal/move-to-prev-delimiter)

;; (global-set-key (kbd "<tab>") 'exp/goto-prev-buffer)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-c d") 'multi-line)
(global-set-key (kbd "C-x w") 'elfeed)

(provide 'rk-keybindings)
