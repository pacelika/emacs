(autoload 'fennel-mode "~/.emacs.d/modes/fennel-mode/fennel-mode.el" nil t)
(add-to-list 'auto-mode-alist '("\\.fnl\\'" . fennel-mode))

(use-package fennel-mode 
  :defer t
  :bind (("C-c C-c" . #'fennel-eval-region))
  :config 
  (setq fennel-program "fennel --repl"))
