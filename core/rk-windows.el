;; Use switch-window for switching between windows
(global-set-key (kbd "C-x o") 'switch-window)
(global-set-key (kbd "M-o") #'switch-window)

(defun rk/split-window-vertically ()
  (interactive)
  (select-window (split-window-vertically)))

(defun rk/split-window-horizontally ()
  (interactive)
  (select-window (split-window-horizontally)))

(global-set-key (kbd "C-x -") #'rk/split-window-vertically)
(global-set-key (kbd "C-x \\") #'rk/split-window-horizontally)

(defun rk/kill-other-buffers ()
  "Kill all buffers but the current one"
  (interactive)
  (when (y-or-n-p "Are you sure you want to kill all buffers but the current one?")
    (-each
        (->> (buffer-list)
             (-filter #'buffer-file-name)
             (--remove (eql (current-buffer) it)))
      #'kill-buffer)))

(global-set-key (kbd "C-c k") 'rk/kill-other-buffers)

(provide 'rk-windows)
