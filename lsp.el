(icomplete-mode)
(global-company-mode)
;;(company-mode)
(setq make-backup-files nil) ; stop creating ~ files
(semantic-mode)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)
(ido-mode t)

(use-package auto-complete
  :ensure t
  :init
  (progn (ac-config-default) (global-auto-complete-mode t))
  )

(require 'lsp-mode)
(use-package lsp-mode
  :ensure t
  :hook(after-init . lsp-mode))

;;(use-package lsp-treemacs :ensure t)
(lsp-mode)

(add-hook 'python-mode 'lsp-mode)
(add-hook 'c++-mode 'lsp-mode)
(add-hook 'c-mode 'lsp-mode)
(with-eval-after-load 'lsp-mode)

;; (ccls-tree-mode) 

;; ;; (after! ccls
;; (setq ccls-executable "~/.dotfiles/scripts/.scripts/cclsInit.sh")
;; (set-lsp-priority! 'ccls 0)) 

(defun setup_cpp_flags ()
  (setq flycheck-cppcheck-standards '("c++20"))
  (setq flycheck-clang-language-standard "c++20")
  (setq flycheck-gcc-language-standard "c++20")
  (setq flycheck-clang-language-standard "c++20")
  (setq flycheck-gcc-language-standard "c++20")
  (lsp-mode))

(add-hook 'c++-mode-hook 'setup_cpp_flags)
