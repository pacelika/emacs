(setq tool-bar-mode nil)
(setq menu-bar-mode nil)
(setq scroll-bar-mode nil)

(when (fboundp 'aggressive-indent-mode)
  (aggressive-indent-mode -1))
(setq use-dialog-box nil)
(setq file-name-handler-alist nil)
(set-face-attribute 'default nil :height 170)
