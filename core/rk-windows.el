;; Use switch-window for switching between windows
(global-set-key (kbd "C-x o") 'switch-window)
(global-set-key (kbd "M-o") #'switch-window)

(defun rekenerd-split-window-vertically ()
  (interactive)
  (select-window (split-window-vertically)))

(defun rekenerd-split-window-horizontally ()
  (interactive)
  (select-window (split-window-horizontally)))

(global-set-key (kbd "C-x -") #'rekenerd-split-window-vertically)
(global-set-key (kbd "C-x \\") #'rekenerd-split-window-horizontally)

(provide 'rk-windows)
