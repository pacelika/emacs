(use-package rust-mode 
  :ensure t 
  :defer t)

(use-package lua-mode 
  :ensure t 
  :defer t)

(use-package fennel-mode 
  :ensure t 
  :defer t
  :bind (("C-c C-c" . #'fennel-eval-region))
  :config 
  (setq fennel-program "lua fennel.lua --repl"))

(let ((dir (expand-file-name "~/.emacs.d/modes")))
  (dolist (file (nthcdr 0 (directory-files dir t "\\.el$")))
    (load file)))
