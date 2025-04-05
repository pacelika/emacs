(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-auto-revert-mode 1)
(global-display-line-numbers-mode 1)
(set-face-attribute 'default nil :height 170)

(ido-mode 1)
(ido-everywhere 1)
(icomplete-mode 1)

(electric-pair-mode 1)
(remove-hook 'text-mode-hook 'turn-on-auto-fill)
(global-auto-revert-mode -1)
'(compilation-message-face 'default)

(recentf-mode 1)
(savehist-mode 1)
(setq history-length 25)
(save-place-mode 1)

(setq semanticdb-default-save-directory nil)
(setq inhibit-startup-message t)
(setq make-backup-files nil)
(setq use-dialog-box nil)
(setq global-auto-revert-non-file-buffers t)
(setq display-line-numbers-type 'relative)
(setq ring-bell-function 'ignore)
(setq visible-bell t)
(setq file-name-handler-alist nil)

(setq inhibit-startup-message t
      initial-scratch-message nil
      inhibit-compacting-font-caches t
      gc-cons-threshold 100000000
      cursor-type 'bar)

(setq indent-line-function 'insert-tab)
(setq c-syntactic-indentation t)
(setq c-basic-offset 4)
(setq truncate-lines t)
(setq history-length 100)

(setq icomplete-compute-delay 0
      icomplete-max-delay-chars 2
      icomplete-show-matches-on-no-input t)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default electric-indent-mode nil)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(defalias 'yes-or-no-p 'y-or-n-p)

(when (fboundp 'aggressive-indent-mode)
  (aggressive-indent-mode -1))

(setq warning-suppress-types '((comp) (emacs)))
(setq warning-minimum-level :error)
(setq warning-minimum-level :silent)
(setq warning-suppress-types '((use-package) (initialization)))
(keymap-global-set "C-," 'duplicate-line)
