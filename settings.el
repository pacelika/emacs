(setq visible-bell t)
(setq ring-bell-function 'ignore)
(setq c-syntactic-indentation t)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)
(setq inhibit-startup-message t
      initial-scratch-message nil
      inhibit-compacting-font-caches t
      cursor-type 'bar)
(defalias 'yes-or-no-p 'y-or-n-p)
'(compilation-message-face 'default)
(remove-hook 'text-mode-hook 'turn-on-auto-fill)
(electric-pair-mode t)
(electric-indent-mode t)

;; Refresh
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)
(setq semanticdb-default-save-directory nil)
(setq global-auto-revert-non-file-buffers t)

;; Completion ;;
(icomplete-mode 1)
(setq icomplete-compute-delay 0
      icomplete-max-delay-chars 2
      icomplete-show-matches-on-no-input t)
(which-key-mode 1)

;; Version Control
(setq vc-handled-backends '(Git))
(setq help-at-pt-display-when-idle nil)

;; History 
(setq recentf-mode nil)
(setq savehist-mode nil)
(setq auto-save-default nil)
(setq make-backup-files nil)
(setq auto-save-visited-file-name nil)
(setq history-length 100)

;; Tab specs ;;
(setq indent-line-function 'insert-tab)
(setq c-basic-offset 4)
(setq truncate-lines t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
