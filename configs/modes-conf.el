(use-package rust-mode 
  :ensure t 
  :defer t)

(use-package lua-mode 
  :ensure t 
  :defer t)

(use-package fennel-mode 
  :defer t
  :bind (("C-c C-c" . #'fennel-eval-region))
  :config 
  (setq fennel-program "fennel --repl"))

(let ((dir (expand-file-name "~/.emacs.d/modes")))
  (dolist (file (nthcdr 0 (directory-files dir t "\\.el$")))
    (load file)))
