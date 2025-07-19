(use-package slime
  :ensure t
  :defer t
  :hook
  (lisp-mode . slime-mode)
  :config
  (setq inferior-lisp-program "sbcl")
  (slime-setup '(slime-fancy)))
