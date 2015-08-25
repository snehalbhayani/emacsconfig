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

(defun rekenerd-kill-other-buffers ()
  "Kill all buffers but the current one"
  (interactive)
  (when (y-or-n-p "Are you sure you want to kill all buffers but the current one?")
    (-each
        (->> (buffer-list)
             (-filter #'buffer-file-name)
             (--remove (eql (current-buffer) it)))
      #'kill-buffer)))

(global-set-key (kbd "C-c k") 'rekenerd-kill-other-buffers)

(provide 'rk-windows)
