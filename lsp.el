(use-package eglot :defer t
  :ensure t
  :hook 
  ((zig-mode . eglot-ensure))
  ((rust-mode . eglot-ensure))
  ((c-mode . eglot-ensure))
  ((cpp-mode . eglot-ensure))
  ((java-mode . eglot-ensure))
  ((javascript-mode . eglot-ensure))
  ((python-mode . eglot-ensure))
  ((lisp-mode . eglot-ensure))
)

(load "~/.emacs.d/corfu.el")
