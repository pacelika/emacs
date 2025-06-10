;; Off ;;
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(when (fboundp 'aggressive-indent-mode)
  (aggressive-indent-mode -1))
(setq use-dialog-box nil)
(setq file-name-handler-alist nil)

;; On ;;
(which-key-mode 1)
(setq visible-bell t)
(setq ring-bell-function 'ignore)
(setq c-syntactic-indentation t)

(global-display-line-numbers-mode 1)
(setq inhibit-startup-message t)

;; Electric modes
(electric-pair-mode t)
(electric-indent-mode t)

;; Refresh
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)
(setq semanticdb-default-save-directory nil)
(setq global-auto-revert-non-file-buffers t)

;; Completion ;;
;; (ido-mode)
(fido-vertical-mode 1)
(icomplete-mode 1)
(setq icomplete-compute-delay 0
      icomplete-max-delay-chars 2
      icomplete-show-matches-on-no-input t)
(remove-hook 'text-mode-hook 'turn-on-auto-fill)
'(compilation-message-face 'default)

;; Version Control
(setq vc-handled-backends '(Git))
(setq help-at-pt-display-when-idle nil)
(setq vc-handled-backends nil)

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

;; Appearance ;;
(set-face-attribute 'default nil :height 170)
(setq display-line-numbers-type 'relative)
(setq inhibit-startup-message t
      initial-scratch-message nil
      inhibit-compacting-font-caches t
      cursor-type 'bar)
(defalias 'yes-or-no-p 'y-or-n-p)

;; Tab specs ;;
(setq indent-line-function 'insert-tab)
(setq c-basic-offset 4)
(setq truncate-lines t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
