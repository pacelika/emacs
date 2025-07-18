(use-package expand-region
  :ensure t
  :defer t
  :bind
  ("C--" . #'er/contract-region)
  ("C-=" . #'er/expand-region)
  )
