(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(defun goto-config-file() (interactive) (find-file (expand-file-name "~/.emacs.d/Emacs.org")))
(keymap-global-set "C-x C-\\" 'goto-config-file)

;; (with-eval-after-load 
;;     (message (concat "Emacs took: " (emacs-init-time) " to load")))

(use-package undo-tree :defer 2 :commands undo-tree-visualize :defer 1)

(use-package expand-region
  :ensure t
  :bind ("M-m" . er/expand-region))

(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

(use-package ivy
  :defer 0
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
(set-face-attribute 'default nil :height 170)

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
  :defer 1
  :init
  (progn
    (setq dashboard-startup-banner "~/.emacs.d/images/anime-banner.jpg")
    (setq dashboard-banner-logo-title "emacs chad'in")
    (setq dashboard-set-heading-icons t)
    (setq dashboard-items '((recents . 5)))
    :config (dashboard-setup-startup-hook)))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;;  (global-company-mode)
  (use-package auto-complete
    :ensure t :defer 2 :init (progn (ac-config-default) (global-auto-complete-mode t)))

  ;; Trigger completion immediately.
  (setq company-idle-delay 0)

  ;; Number the candidates (use M-1, M-2 etc to select completions).
  (setq company-show-numbers t)

  (use-package lsp-mode
    :ensure t
    :commands lsp-mode
    :hook(after-init . lsp-mode))

  (defun setup_c_flags()
    ;; (define-key c-mode-base-map (kbd "C-c C-\/") 'projectile-compile-project)
    (lsp-mode))

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

(use-package projectile
  :ensure t
  :defer 
  :diminish projectile-mode
  :bind
  (("C-c p f" . helm-projectile-find-file)
   ("C-c p p" . helm-projectile-switch-project)
   ("C-c C-." . projectile-compile-project)
   ("C-c C-\/" . projectile-run-project)
   ("C-c p s" . projectile-save-project-buffers))
  :config
  (projectile-mode +1))

(use-package beacon :commands beacon-mode :defer 1 :init (beacon-mode))
