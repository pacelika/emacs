(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(defun goto-config-file() (interactive) (find-file (expand-file-name "~/.emacs.d/config.org")))
(keymap-global-set "C-x C-\\" 'goto-config-file)

(with-eval-after-load 
    (message (concat "Emacs took: " (emacs-init-time) " to load")))

(load "~/.emacs.d/defaults.el")
(keymap-global-set "C-," 'duplicate-line)

(use-package expand-region
  :ensure t
  :defer 2
  :bind ("C-=" . er/expand-region))

(require 'compile)

(setq compilation-scroll-output t)

(defun find-project-root()
  "Find the root of the project by searching for .git, Makefile, or similar markers."
  (or (locate-dominating-file default-directory ".git")
      (locate-dominating-file default-directory "Makefile")
      (locate-dominating-file default-directory "Cargo.toml")))

(defun compile-root-wo-prompt()
  "Run `compile` from the project root."
  (interactive)
  (let ((default-directory (or (find-project-root) default-directory)))
    (compile "make -k")))

(defun compile-root-w-prompt()
  "Prompt for a compile command and run it from the project root."
  (interactive)
  (let* ((root (or (find-project-root) default-directory))
         (default-command "make")
         (command (read-shell-command "Compile command: " default-command)))
    (let ((default-directory root))
      (compile command))))

(global-set-key (kbd "C-c C-.") 'compile-root-w-prompt)

(global-set-key (kbd "C-c g") 'rgrep)

(defun ripgrep-search (query)
  (interactive "SSearch for: ")
  (let ((default-directory (read-directory-name "Directory: ")))
    (grep (format "rg --no-heading --line-number %s %s"
                  (shell-quote-argument query)
                  (shell-quote-argument default-directory)))))
(global-set-key (kbd "C-c r") 'ripgrep-search)

(use-package company :ensure t :defer 2
:config
(setq company-idle-delay 0.2)
(setq company-minimum-prefix-length 1)
(setq company-tooltip-limit 10)
(setq company-selection-wrap-around t)
(setq company-quickhelp-delay 0.2)
(setq company-backends '((company-capf) (company-files)))
(global-company-mode 1))

(use-package lsp-mode :ensure t 
  :defer 2 
  :hook
  (c-mode . lsp)
  (cpp-mode .lsp)
  (lua-mode .lsp)
  (rust-mode .lsp))

(use-package lsp-ui :ensure t :defer 2 :commands lsp-ui-mode :hook (lsp-mode . lsp-ui-mode))
