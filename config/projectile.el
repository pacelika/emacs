(use-package projectile
  :ensure t
  :defer t
  :init
  (projectile-mode +1)
  :custom
  (projectile-completion-system 'default)
  :bind-keymap
  ("C-c p" . projectile-command-map))
