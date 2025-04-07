(use-package company :ensure t :defer t
  :hook (eglot-managed-mode . company-mode)
  :config
  (setq company-idle-delay 0.2)
  (setq company-minimum-prefix-length 1)
  (setq company-tooltip-limit 10)
  (setq company-selection-wrap-around t)
  (setq company-quickhelp-delay 0.2)
  (setq company-backends '((company-capf) (company-files)))
  (global-company-mode 1))
