(use-package ajrepl
  :hook
  (janet-mode . ajrepl-interaction-mode)
  (janet-mode . ajrepl)
  :load-path "~/.emacs.d/modes/ajrepl")
