(use-package eglot :defer 2 
  :ensure t
  :hook 
  ((zig-mode . eglot-ensure))
  ((c-mode . eglot-ensure)))

(load "~/.emacs.d/corfu.el")
