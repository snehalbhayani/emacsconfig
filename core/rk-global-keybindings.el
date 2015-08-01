(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; Font size
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
(global-set-key (kbd "C-S-a") 'mc/mark-all-in-region)

(global-set-key (kbd "C-c M-y") 'browse-kill-ring)

(provide 'rk-global-keybindings)
