(use-package cider
  :defer t
  :mode "\\.clj\\'"
  :load-path "~/.emacs.d/modes/cider-1.19.0"
  :hook
  (clojure-mode . cider-mode))
