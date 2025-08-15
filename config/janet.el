(use-package janet-mode
  :defer t
  :load-path "~/.emacs.d/modes"
  :mode "\\.janet\\'")

(use-package ajrepl
  :defer t
  :mode "\\.janet\\'"
  :load-path "~/.emacs.d/modes/ajrepl"
  :bind
  (:map janet-mode-map
        ("C-c C-l" . ajrepl-send-buffer)
        ("C-c C-c" . ajrepl-send-region))
  :hook
  (janet-mode . ajrepl-interaction-mode)
  (janet-mode . ajrepl))
