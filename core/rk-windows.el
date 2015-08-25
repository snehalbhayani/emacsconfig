;; Use switch-window for switching between windows
(global-set-key (kbd "C-x o") 'switch-window)
(global-set-key (kbd "M-o") #'switch-window)

(defun rk-split-window-vertically ()
  (interactive)
  (select-window (split-window-vertically)))

(defun rk-split-window-horizontally ()
  (interactive)
  (select-window (split-window-horizontally)))

(global-set-key (kbd "C-x -") #'rk-split-window-vertically)
(global-set-key (kbd "C-x \\") #'rk-split-window-horizontally)

(provide 'rk-windows)
