(use-package corfu
  :ensure t
  :defer t
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-quit-at-boundary 'separator)
  (corfu-auto-prefix 1)
  (corfu-auto-delay 0.0)
  (corfu-popupinfo-delay '(0.3 . 0.2))
  (corfu-echo-documentation 0.25)
  (corfu-preview-current 'insert)
  (corfu-preselect 'prompt)
  (corfu-on-exact-match nil)
  :bind (:map corfu-map
              ("M-SPC"      . corfu-insert-separator)
              ("TAB"        . corfu-next)
              ("S-TAB"      . corfu-previous)
              ("S-<return>" . corfu-insert)
              ("RET"        . nil))
  :init
  (global-corfu-mode)
  (corfu-history-mode)
  (corfu-popupinfo-mode))
