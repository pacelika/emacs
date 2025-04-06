(use-package eglot :defer t
  :ensure t
  :hook 
  ((zig-mode . eglot-ensure))
  ((c-mode . eglot-ensure))
  ((java-mode . eglot-ensure)))

(load "~/.emacs.d/corfu.el")
