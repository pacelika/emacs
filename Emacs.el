(use-package undo-tree :defer 2 :commands undo-tree-visualize :defer 1)

(use-package expand-region
  :ensure t
  :bind ("M-m" . er/expand-region))

(use-package ivy
  :defer 2
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package ivy-rich
  :after ivy
  :init
  (ivy-rich-mode 1))

(use-package counsel
  :bind (("C-M-j" . 'counsel-switch-buffer)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history)
         ("M-x" . 'counsel-M-x)
         ("C-x C-f" . 'counsel-find-file))
  :custom
  (counsel-linux-app-format-function #'counsel-linux-app-format-function-name-only)
  :config
  (counsel-mode 1))

(use-package all-the-icons :defer 2 :if (display-graphic-p))

(use-package doom-modeline
  :defer 2
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package no-littering)
;; (setq auto-save-file-name-transforms '((".*" , (no-littering-expand-var-file-name "auto-save/") t)))

(defalias 'yes-or-no-p 'y-or-n-p)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1) 
(electric-pair-mode 1)
(global-display-line-numbers-mode 1)
(semantic-mode)
(recentf-mode 1)
(savehist-mode 1)
(save-place-mode 1)
(global-auto-revert-mode 1)

(setq history-length 25)
(setq use-dialog-box nil)
(setq global-auto-revert-non-file-buffers t)
(setq display-line-numbers-type 'relative)
(setq inhibit-startup-message t
      initial-scratch-message ""
      cursor-type 'bar)
 '(compilation-message-face 'default)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq indent-line-function 'insert-tab)
(setq c-syntactic-indentation t)
(setq c-basic-offset 4)
(setq truncate-lines t)
(setq inhibit-startup-message t)
(setq make-backup-files nil)

(use-package dashboard
  :ensure t
  :defer 5
  :init
  (progn
    (setq dashboard-startup-banner "~/.emacs.d/anime-banner.jpg")
    (setq dashboard-banner-logo-title "emacs chad'in")
    (setq dashboard-set-heading-icons t)
    (setq dashboard-items '((recents . 5)))
    :config (dashboard-setup-startup-hook)))

(use-package perspective
  :commands persp-switch-to-buffer
  :bind
  ("C-x C-b" . persp-list-buffers)         ; or use a nicer switcher, see below
  :custom
  (persp-mode-prefix-key (kbd "C-c M-p"))  ; pick your own prefix key here
  :init
  (persp-mode))

(use-package auto-complete
    :ensure t :defer 5 :init (progn (ac-config-default) (global-auto-complete-mode t)))

  (use-package lsp-mode
    :ensure t
    :commands lsp-mode
    :hook(after-init . lsp-mode))

(defun setup_c_flags()
  (define-key c-mode-base-map (kbd "C-c C-l") 'projectile-compile-project)
  (lsp-mode))

(defun init_rust_lsp()
  (use-package rustic
    :ensure
    :bind (:map rustic-mode-map
                ("M-j" . lsp-ui-imenu)
                ("M-?" . lsp-find-references)
                ("C-c C-c l" . flycheck-list-errors)
                ("C-c C-c a" . lsp-execute-code-action)
                ("C-c C-c r" . lsp-rename)
                ("C-c C-c q" . lsp-workspace-restart)
                ("C-c C-c Q" . lsp-workspace-shutdown)
                ("C-c C-c s" . lsp-rust-analyzer-status))
    :config
    (setq rustic-format-on-save t)
    (add-hook 'rustic-mode-hook 'rk/rustic-mode-hook))

  (defun rk/rustic-mode-hook ()
    (when buffer-file-name
      (setq-local buffer-save-without-query t))
    (add-hook 'before-save-hook 'lsp-format-buffer nil t)))

(add-hook 'c++-mode-hook 'setup_c_flags)
(add-hook 'c-mode-hook 'setup_c_flags)
(add-hook 'python-mode 'lsp-mode)

(use-package multiple-cursors
  :commands mc/edit-lines
  :ensure t
  :bind(("C-S-c C-S-c" . 'mc/edit-lines)
        ("C->" . 'mc/mark-next-like-this)
        ("C-<" . 'mc/mark-previous-like-this)
        ("C-c C-<" . 'mc/mark-all-like-this)
        ("C-c C-c" . 'ace-jump-mode)
        ("C-x M-r" . 'replace-string)))

(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :bind (("C-x C-j" . dired-jump))
  :custom ((dired-listing-switches "-agho --group-directories-first")))

(use-package dired-single
  :commands (dired dired-jump))

(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))

(use-package dired-open
  :commands (dired dired-jump)
  :config
  ;; Doesn't work as expected!
  ;;(add-to-list 'dired-open-functions #'dired-open-xdg t)
  (setq dired-open-extensions '(("png" . "feh")
                                ("mkv" . "mpv"))))

(use-package projectile
  :ensure t
  :defer 
  :diminish projectile-mode
  :bind
  (("C-c p f" . helm-projectile-find-file)
   ("C-c p p" . helm-projectile-switch-project)
   ("C-c p s" . projectile-save-project-buffers))
  :config
  (projectile-mode +1)
)
