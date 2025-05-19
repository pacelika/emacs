(use-package rust-mode 
  :ensure t 
  :defer t)

(use-package lua-mode 
  :ensure t 
  :defer t)

(autoload 'fennel-mode "~/.emacs.d/modes/fennel-mode/fennel-mode.el" nil t)
(add-to-list 'auto-mode-alist '("\\.fnl\\'" . fennel-mode))

(use-package fennel-mode 
  :defer t
  :bind (("C-c C-c" . #'fennel-eval-region))
  :config 
  (setq fennel-program "fennel --repl"))

(add-to-list 'load-path "~/.emacs.d/modes/nim-mode")
(autoload 'nim-mode "~/.emacs.d/modes/nim-mode/nim-mode.el" nil t)
(add-to-list 'auto-mode-alist '("\\.nim\\'" . nim-mode))

(add-to-list 'auto-mode-alist '("\\.nims\\'" . nim-mode))
(add-to-list 'auto-mode-alist '("\\.nimble\\'" . nim-mode))

(let ((dir (expand-file-name "~/.emacs.d/modes")))
  (dolist (file (nthcdr 0 (directory-files dir t "\\.el$")))
    (load file)))
