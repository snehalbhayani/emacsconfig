(defun rekenerd-beginning-of-line-or-indent ()
  "Go to the position of the first non-whitespace character.
If already there, go to actual beginning of line."
  (interactive "^")
  (if (bolp)
      (back-to-indentation)
    (move-beginning-of-line nil)))
(global-set-key [remap move-beginning-of-line] 'rekenerd-beginning-of-line-or-indent)

(provide 'ia-core)
