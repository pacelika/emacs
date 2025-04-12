(use-package eglot :defer t
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

(use-package completion-preview
  :config
  (global-completion-preview-mode))

(setq completion-ignore-case t)
(setq read-buffer-completion-ignore-case t)
(setq tab-always-indent 'complete)
(setq icomplete-prospects-height 10)
(setq icomplete-with-completion-tables t)

(setq completion-styles '(basic flex)
      completion-auto-select t
      completion-auto-help 'visible
      completions-sort 'history-length
      completions-max-height 20
      completion-ignore-case t)
