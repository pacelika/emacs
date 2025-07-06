(add-to-list 'load-path "~/.emacs.d/modes/dashboard")
(autoload 'dashboard "~/.emacs.d/modes/dashboard/dashboard.el" nil t)

(require 'dashboard)

(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-banner-logo-title "The one true editor Emacs")
  ;; (setq dashboard-startup-banner "~/.emacs.d/resources/anime-banner.jpg")
  (setq dashboard-center-content t)
  (setq dashboard-vertically-center-content t)
  :bind
  ("C-x C-'" . dashboard-open))
