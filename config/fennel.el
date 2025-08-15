(use-package fennel-mode
  :load-path "~/.emacs.d/modes/fennel-mode"
  :defer t
  :mode "\\.fnl\\'"
  :bind (:map fennel-mode-map
              ("C-c C-c" . #'fennel-eval-region)))
