(use-package consult
  :ensure t
  :defer t
  :bind
  (("C-x b" . consult-buffer)
   ("C-S-s" . consult-ripgrep)
   ("C-s" . consult-line)
  ("C-;" . #'consult-find-w-dir))
  :config
  (setq consult-preview-key nil))

(defun consult-find-w-dir()
  (interactive)
  (let ((current-prefix-arg '(4)))
    (call-interactively #'consult-find)))
