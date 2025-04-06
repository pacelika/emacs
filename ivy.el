(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

(use-package swiper
  :ensure t :defer t)

(use-package ivy
  :defer t
  :ensure t
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package ivy-rich
  :defer t
  :ensure t
  :init
  (ivy-rich-mode 1))

(use-package counsel
  :defer t
  :ensure t
  :bind (("C-M-j" . 'counsel-switch-buffer)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history)
         ("M-x" . 'counsel-M-x)
         ("C-x C-f" . 'counsel-find-file))
  :config
  (counsel-mode 1))
