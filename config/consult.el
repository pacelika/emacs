(use-package consult
  :ensure t
  :defer t
  :bind
  (
   ("C-x b" . consult-buffer)
   ("C-s" . consult-line)
   ("C-S-s" . consult-ripgrep)
   ))
