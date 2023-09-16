(use-package auto-complete
  :ensure t :init (progn (ac-config-default) (global-auto-complete-mode t)))

(require 'lsp-mode)
(use-package lsp-mode
  :ensure t
  :hook(after-init . lsp-mode))

(icomplete-mode)
(global-company-mode)
(company-mode)
;;(with-eval-after-load 'lsp-mode)

(defun setup_cpp_flags ()
  (setq flycheck-cppcheck-standards '("c++20"))
  (setq flycheck-clang-language-standard "c++20")
  (setq flycheck-gcc-language-standard "c++20")
  (setq flycheck-clang-language-standard "c++20")
  (setq flycheck-gcc-language-standard "c++20")
  (define-key c-mode-base-map (kbd "C-c C-l") 'compile)
  (lsp-mode))

(defun init_rust_lsp()
  (use-package rustic
    :ensure
    :bind (:map rustic-mode-map
                ("M-j" . lsp-ui-imenu)
                ("M-?" . lsp-find-references)
                ("C-c C-c l" . flycheck-list-errors)
                ("C-c C-c a" . lsp-execute-code-action)
                ("C-c C-c r" . lsp-rename)
                ("C-c C-c q" . lsp-workspace-restart)
                ("C-c C-c Q" . lsp-workspace-shutdown)
                ("C-c C-c s" . lsp-rust-analyzer-status))
    :config
    (setq rustic-format-on-save t)
    (add-hook 'rustic-mode-hook 'rk/rustic-mode-hook))

  (defun rk/rustic-mode-hook ()
    (when buffer-file-name
      (setq-local buffer-save-without-query t))
    (add-hook 'before-save-hook 'lsp-format-buffer nil t))
  )

(defun setup_c_flags ()
  (lsp-mode)
  (define-key c-mode-base-map (kbd "C-c C-l") 'compile))

(add-hook 'c++-mode-hook 'setup_cpp_flags)
(add-hook 'c-mode-hook 'setup_c_flags)
(add-hook 'rust-mode-hook 'init-rust-lsp)
(add-hook 'python-mode 'lsp-mode)
(add-hook 'c++-mode 'lsp-mode)
(add-hook 'c-mode 'lsp-mode)

(add-hook 'c-mode-common-hook 
          (lambda () (define-key c-mode-base-map (kbd "C-c C-l") 'compile)))
