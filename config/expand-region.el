(use-package expand-region
  :load-path "~/.emacs.d/modes/expand-region-1.0.0"
  :bind
  ("C--" . #'er/contract-region)
  ("C-=" . #'er/expand-region))
