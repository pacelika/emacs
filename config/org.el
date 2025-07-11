(use-package org-superstar
  :ensure t
  :defer t
  :hook (org-mode . org-superstar-mode)
  :config
  (setq org-superstar-headline-bullets-list '("◉" "○" "✸" "✿")))
