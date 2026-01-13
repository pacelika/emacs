(use-package fennel-mode
  :load-path "~/.emacs.d/modes/fennel-mode-0.9.3"
  :defer t
  :mode "\\.fnl\\'"
  :bind (:map fennel-mode-map
              ("C-c C-c" . #'fennel-eval-region)))
