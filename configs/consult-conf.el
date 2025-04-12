(use-package consult
  :ensure t
  :defer t
  :bind (("C-s" . consult-line)
         ("M-y" . consult-yank-pop)
         ("C-x b" . consult-buffer)
         ("C-x p b" . consult-project-buffer)))

(use-package wgrep
  :ensure t :defer t)

(use-package orderless
  :ensure t
  :defer t
  :custom
  (completion-styles '(orderless basic)))

(use-package vertico
  :ensure t
  :defer t
  :init
  (vertico-mode))

(use-package marginalia
  :ensure t
  :defer t
  :init
  (marginalia-mode))
