(use-package geiser
  :ensure t
  :defer t
  :hook
  (scheme-mode . geiser-mode))

(use-package geiser-chez
  :ensure t
  :defer t
  :config
  (setq geiser-chez-binary "scheme")
  (setq geiser-active-implementations '(chez)))
