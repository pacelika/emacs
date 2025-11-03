(use-package cider
  :ensure t
  :defer t
  :mode "\\.clj\\'"
  :hook
  (clojure-mode . cider-mode))
