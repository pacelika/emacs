(use-package ivy
  :defer t
  :ensure t
  :diminish
  :config
  (ivy-mode 1))

(use-package counsel
  :defer t
  :ensure t
  :bind (("C-M-j" . 'counsel-switch-buffer)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history)
         ("M-x" . 'counsel-M-x)
         ("C-x C-f" . 'counsel-find-file)
         ("C-x C-d" . 'counsel-dired))
  :config
  (counsel-mode 1))

(load "~/.emacs.d/ivy-rich.el")
(ivy-rich-mode)
(global-set-key (kbd "C-x d") 'counsel-dired)
