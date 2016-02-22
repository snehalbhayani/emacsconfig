(require 'helm-config)
(add-hook 'after-init-hook #'helm-mode)

;; Enable helm-adaptive-mode
(add-hook 'after-init-hook #'helm-adaptive-mode)

(require 'helm-descbinds)
(setq helm-descbinds-window-style 'split-window)
(helm-descbinds-mode)

(require 'helm-mode)
(require 'helm-command)
(require 'helm-semantic)
(require 'helm-elisp)

(setq helm-mode-fuzzy-match                 t
      helm-recentf-fuzzy-match              t
      helm-buffers-fuzzy-matching           t
      helm-locate-fuzzy-match             nil
      helm-M-x-fuzzy-match                  t
      helm-semantic-fuzzy-match             t
      helm-apropos-fuzzy-match              t
      helm-lisp-fuzzy-completion            t
      helm-completion-in-region-fuzzy-match t)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
;; credit: http://tuhdo.github.io/helm-intro.html
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-command-map (kbd "g") 'helm-do-grep)
(define-key helm-command-map (kbd "SPC") 'helm-all-mark-rings)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x p") 'helm-mini)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-h f") 'helm-apropos)
(global-set-key (kbd "C-h r") 'helm-info-emacs)
(global-set-key [remap locate] #'helm-locate)
(global-set-key (kbd "C-h C-l") 'helm-locate-library)
(global-set-key (kbd "C-c h o") 'helm-occur)

(require 'helm-imenu)
(global-set-key [remap imenu] 'helm-imenu)
(setq helm-imenu-fuzzy-match t)
(setq helm-imenu-execute-action-at-once-if-one nil)

(define-key minibuffer-local-map (kbd "C-c C-l") 'helm-minibuffer-history)

(require 'helm-projectile)
(with-eval-after-load 'projectile
  (helm-projectile-on)
  (setq projectile-switch-project-action #'helm-projectile)
  (setq projectile-completion-system 'helm)
  (setq helm-mini-default-sources '(helm-source-buffers-list
                                    helm-source-ido-virtual-buffers
                                    helm-source-projectile-buffers-list
                                    helm-source-projectile-files-list
                                    helm-source-projectile-projects
                                    helm-source-recentf
                                    helm-source-buffer-not-found
                                    helm-source-locate)))

(with-eval-after-load 'helm-projectile
  (defvar rk/helm-source-file-not-found
    (helm-build-dummy-source
        "Create file"
      :action (lambda (cand) (find-file cand))))

  (add-to-list 'helm-projectile-sources-list rk/helm-source-file-not-found t))

(require 'helm-company)
(with-eval-after-load 'company
  (define-key company-active-map (kbd "C-\\") 'helm-company))

(define-key shell-mode-map (kbd "C-c C-l") 'helm-comint-input-ring)

(require 'helm-flycheck)
(eval-after-load 'flycheck
  '(define-key flycheck-mode-map (kbd "C-c ! h") 'helm-flycheck))

;;; helm-grep configuration
;; Use C-c C-c to save grep results
(defun rk/helm-grep-save-results ()
  (interactive)
  (helm-exit-and-execute-action 'helm-grep-save-results))

(with-eval-after-load 'helm-grep
  (define-key helm-grep-map (kbd "C-c C-c") #'rk/helm-grep-save-results))

;; Helm flx integration
(helm-flx-mode +1)
(helm-fuzzier-mode +1)

;; Replace rgrep helm equivalents
(defun helm-do-grep ()
  "Copied from older helm (https://github.com/emacs-helm/helm/blob/4d4b9d63c5fbe33fe472cf75ac83167d8d82c8e5/helm-grep.el)
   The latest versions do not come with it."
  (interactive)
  (let* ((only (helm-read-file-name
                "Search in file(s): "
                :marked-candidates t))
         (prefarg (or current-prefix-arg helm-current-prefix-arg)))
    (helm-do-grep-1 only prefarg)))

(global-set-key [remap rgrep] #'helm-do-grep)
