(use-package rust-mode 
  :ensure t 
  :defer t)

(use-package lua-mode 
  :ensure t 
  :defer t)

(let ((dir (expand-file-name "~/.emacs.d/modes")))
  (dolist (file (nthcdr 0 (directory-files dir t "\\.el$")))
    (load file)))
