(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1) 
(electric-pair-mode 1)
(global-display-line-numbers-mode 1)
(semantic-mode)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq display-line-numbers-type 'relative)
(setq inhibit-startup-message t
      initial-scratch-message ""
      cursor-type 'bar)
 '(compilation-message-face 'default)
(setq-default tab-width 4)
(setq tab-width 4)
(setq-default indent-tabs-mode nil)
(setq indent-line-function 'insert-tab)
(setq c-syntactic-indentation t)
(setq c-basic-offset 4)
(setq truncate-lines t)
(setq inhibit-startup-message t)
(setq make-backup-files nil)
;; (setq ido-everywhere t)
;; (setq ido-enable-flex-matching t)
;;(ido-mode t)
;;(add-hook 'after-init-hook #'doom-modeline-mode
(load-file "~/.emacs.d/swiper.el")
