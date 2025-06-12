;; (use-package company
;;   :ensure t
;;   :defer t
;;   :hook (after-init . global-company-mode)
;;   :config
;;   (setq company-idle-delay 0.2
;;         company-minimum-prefix-length 1
;;         company-selection-wrap-around t
;;         company-tooltip-align-annotations t
;;         company-transformers '(company-sort-by-occurrence)
;;         company-show-numbers t)
;;   (define-key company-active-map (kbd "TAB") 'company-complete-selection)
;;   (define-key company-active-map (kbd "<tab>") 'company-complete-selection))
