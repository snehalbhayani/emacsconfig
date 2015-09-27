(require 'helm-config)
(add-hook 'after-init-hook #'helm-mode)

;; Enable helm-adaptive-mode
(add-hook 'after-init-hook #'helm-adaptive-mode)

(require 'helm-descbinds)
(setq helm-descbinds-window-style 'split-window)
(helm-descbinds-mode)

(setq helm-mode-fuzzy-match                 t
      helm-recentf-fuzzy-match              t
      helm-buffers-fuzzy-matching           t
      helm-locate-fuzzy-match             nil
      helm-M-x-fuzzy-match                  t
      helm-semantic-fuzzy-match             t
      helm-imenu-fuzzy-match                t
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
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-h f") 'helm-apropos)
(global-set-key (kbd "C-h r") 'helm-info-emacs)
(global-set-key [remap locate] #'helm-locate)
(global-set-key (kbd "C-h C-l") 'helm-locate-library)
(global-set-key (kbd "C-c h o") 'helm-occur)
(global-set-key [remap imenu] 'helm-imenu)

(define-key minibuffer-local-map (kbd "C-c C-l") 'helm-minibuffer-history)

(require 'helm-projectile)
(with-eval-after-load 'projectile
  (helm-projectile-on)
  (setq projectile-switch-project-action 'helm-projectile)
  (setq projectile-completion-system 'helm)
  (setq helm-mini-default-sources '(helm-source-buffers-list
                                    helm-source-projectile-buffers-list
                                    helm-source-projectile-files-list
                                    helm-source-buffer-not-found
                                    helm-source-recentf)))

(require 'helm-company)
(with-eval-after-load 'company
  (define-key company-active-map (kbd "C-<return>") 'helm-company))

(require 'helm-eshell)
(add-hook 'eshell-mode-hook
          #'(lambda ()
              (define-key eshell-mode-map (kbd "C-c C-l") 'helm-eshell-history)))

(define-key shell-mode-map (kbd "C-c C-l") 'helm-comint-input-ring)

(require 'helm-flycheck)
(eval-after-load 'flycheck
  '(define-key flycheck-mode-map (kbd "C-c ! h") 'helm-flycheck))
