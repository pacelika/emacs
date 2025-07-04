(use-package rust-mode 
  :ensure t 
  :defer t)

(use-package lua-mode 
  :ensure t 
  :defer t)

(use-package php-mode 
  :ensure t 
  :defer t)

(use-package go-mode 
  :ensure t 
  :defer t)

(let ((dir (expand-file-name "~/.emacs.d/modes")))
  (dolist (file (nthcdr 0 (directory-files dir t "\\.el$")))
    (load file)))

(add-to-list 'load-path "~/.emacs.d/modes/nim-mode")
(autoload 'nim-mode "~/.emacs.d/modes/nim-mode/nim-mode.el" nil t)
(add-to-list 'auto-mode-alist '("\\.nim\\'" . nim-mode))

(add-to-list 'auto-mode-alist '("\\.nims\\'" . nim-mode))
(add-to-list 'auto-mode-alist '("\\.nimble\\'" . nim-mode))

(use-package nim-mode
  :defer t)

