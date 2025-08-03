(which-key-mode 1)
(global-display-line-numbers-mode 1)
(electric-pair-mode t)
(electric-indent-mode t)

(setq c-syntactic-indentation t)
(setq visible-bell t)
(setq ring-bell-function 'ignore)
(setq inhibit-startup-message t)

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

;; Version Control
(setq vc-handled-backends '(Git))
(setq help-at-pt-display-when-idle nil)

;; Garbage Collector
(setq gc-cons-threshold (* 50 1000 1000))
(setq gc-cons-percentage 0.1)
(setq gc-cons-threshold 100000000)

;; History 
(setq recentf-mode nil)
(setq savehist-mode nil)
(setq auto-save-default nil)
(setq make-backup-files nil)
(setq auto-save-visited-file-name nil)
(setq history-length 100)

(setq display-line-numbers-type 'relative)
(setq inhibit-startup-message t
      initial-scratch-message nil
      inhibit-compacting-font-caches t
      cursor-type 'bar)
(defalias 'yes-or-no-p 'y-or-n-p)
'(compilation-message-face 'default)
(remove-hook 'text-mode-hook 'turn-on-auto-fill)

;; Tab specs ;;
(setq indent-line-function 'insert-tab)
(setq c-basic-offset 4)
(setq truncate-lines t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
