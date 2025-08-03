(defun start-alive-lsp-package()
  "Start alive-lsp package"
  (interactive)
  (if (not (eq system-type 'windows-nt))
      (unless (get-process "alive-lsp")
        (start-process "alive-lsp" "*alive-lsp*"
                       "~/.emacs.d/start-alive-lsp.sh")
        (message "INFO: Starting alive-lsp package") t)
    (progn
      (message "INFO: Failed to start alive-lsp package")
      nil)))

(use-package eglot :defer t
  :hook 
  ((c-mode . eglot-ensure))
  ((c++-mode . eglot-ensure))
  ((c3-mode . eglot-ensure))
  ((zig-mode . eglot-ensure))
  ((rust-mode . eglot-ensure))
  ((nim-mode . eglot-ensure))
  ((go-mode . eglot-ensure))
  ((dart-mode . eglot-ensure))
  ((tuareg-mode . eglot-ensure))
  ((haskell-mode . eglot-ensure))
  ((java-mode . eglot-ensure))
  ((typescript-mode . eglot-ensure))
  ((javascript-mode . eglot-ensure))
  ((python-mode . eglot-ensure))
  ((lua-mode . eglot-ensure))
  ((web-mode . eglot-ensure))
  ((slint-mode . eglot-ensure))
  :bind
  (("C-." . #'eglot-code-actions)
        ("C-c C-f" . #'eglot-format)
        ("<f2>" . #'eglot-rename))
  :config
  (push '(lisp-mode . ("localhost" 57846)) eglot-server-programs)
  (add-to-list 'eglot-server-programs
               '(nim-mode . ("nimlangserver")))
  (add-hook 'nim-mode-hook 'eglot-ensure)

  (add-to-list 'eglot-server-programs
               '(slint-mode . ("slint-lsp")))
  (add-hook 'slint-mode-hook 'eglot-ensure)

  (add-to-list 'eglot-server-programs
               '(c3-mode . ("c3lsp")))
  (add-hook 'c3-mode-hook 'eglot-ensure)

  (add-to-list 'eglot-server-programs
             '((web-mode) . ("typescript-language-server" "--stdio")))
  :hook
  ((web-mode . (lambda()
                 (when (string-equal "tsx" (file-name-extension buffer-file-name))
                   (eglot-ensure))))))

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
