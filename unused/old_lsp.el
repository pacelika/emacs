(use-package corfu
  :ensure t
  :defer 3
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-quit-at-boundary 'separator)
  (corfu-auto-prefix 1)
  (corfu-auto-delay 0.0)
  (corfu-popupinfo-delay '(0.3 . 0.2))
  (corfu-echo-documentation 0.25)
  (corfu-preview-current 'insert)
  (corfu-preselect 'prompt)
  (corfu-on-exact-match nil)
  :bind (:map corfu-map
              ("M-SPC"      . corfu-insert-separator)
              ("TAB"        . corfu-next)
              ([tab]        . corfu-next)
              ("S-TAB"      . corfu-previous)
              ([backtab]    . corfu-previous)
              ("S-<return>" . corfu-insert)
              ("RET"        . nil))

  :init
  (global-corfu-mode)
  (corfu-history-mode)
  (corfu-popupinfo-mode))

(use-package lsp-mode :ensure t 
  :defer 2 
  :hook
  (c-mode . lsp)
  (cpp-mode .lsp)
  (lua-mode .lsp)
  (rust-mode .lsp)
  (zig-mode .lsp))

(use-package lsp-ui :ensure t :defer 2 :commands lsp-ui-mode :hook (lsp-mode . lsp-ui-mode))
