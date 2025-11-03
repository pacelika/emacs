(use-package consult
  :defer t
  :load-path "~/.emacs.d/modes/consult-2.9"
  :bind
  (("C-x b" . consult-buffer)
   ("C-S-s" . consult-ripgrep)
   ("C-s" . consult-line)
  ("C-;" . #'consult-find-w-dir))
  :config
  (setq consult-preview-key nil))

(require 'consult)

(defun consult-find-w-dir()
  (interactive)
  (let ((current-prefix-arg '(4)))
    (call-interactively #'consult-find)))
