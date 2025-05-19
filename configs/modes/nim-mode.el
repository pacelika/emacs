(add-to-list 'load-path "~/.emacs.d/modes/nim-mode")
(autoload 'nim-mode "~/.emacs.d/modes/nim-mode/nim-mode.el" nil t)
(add-to-list 'auto-mode-alist '("\\.nim\\'" . nim-mode))

(add-to-list 'auto-mode-alist '("\\.nims\\'" . nim-mode))
(add-to-list 'auto-mode-alist '("\\.nimble\\'" . nim-mode))

(use-package nim-mode
  :defer t
  :bind (("C-c C-c" . #'compile-root-wo-prompt)))

(add-hook 'nim-mode-hook (lambda()))
