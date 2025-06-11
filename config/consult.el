(use-package consult
  :ensure t
  :defer t
  :bind
  (
   ("C-x b" . consult-buffer)
   ("C-S-s" . consult-ripgrep)
   ("C-s" . consult-line)
   )
  :config
  (setq consult-preview-key nil))
