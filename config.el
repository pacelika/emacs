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

(use-package zig-mode :ensure t)

(use-package expand-region
  :ensure t
  :defer 2
  :bind ("C-=" . er/expand-region))

(require 'compile)

  (setq compilation-scroll-output t)
  (defvar last-compile-command nil)

(defun detect-project-type(root)
  "Detect the type of project based on files in ROOT."
  (cond
   ((file-exists-p (expand-file-name "Cargo.toml" root)) "cargo run")
   ((file-exists-p (expand-file-name "package.json" root)) "npm run start")
   ((file-exists-p (expand-file-name "build.zig" root)) "zig build")
   ((file-exists-p (expand-file-name "Makefile" root)) "make")
   ((file-exists-p (expand-file-name "CMakeLists.txt" root)) "cmake --build .")
   ((file-exists-p (expand-file-name "venv" root)) "python main.py")
   (t nil)))

  (defun find-project-root()
    "Find the root of the project by searching for .git, Makefile, or similar markers."
    (or (locate-dominating-file default-directory ".git")
        (locate-dominating-file default-directory "Makefile")
        (locate-dominating-file default-directory "CMakeLists.txt")
        (locate-dominating-file default-directory "package.json")
        (locate-dominating-file default-directory "Cargo.toml")
        (locate-dominating-file default-directory "build.zig")))

  (defun compile-root-wo-prompt()
    "Run `compile` from the project root."
    (interactive)
    (let ((default-directory (or (find-project-root) default-directory)))
      (compile last-compile-command)))

  (defun compile-root-w-prompt()
    "Prompt for a compile command and run it from the project root."
    (interactive)
    (let* ((root (or (find-project-root) default-directory))
           (default-command (or last-compile-command (detect-project-type root)))
           (command (read-shell-command "Compile command: " default-command)))
      (setq last-compile-command command)
      (let ((default-directory root))
        (compile command))))

  (global-set-key (kbd "C-c C-.") 'compile-root-w-prompt)
  (global-set-key (kbd "C-c C-/") 'compile-root-wo-prompt)

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
  (rust-mode .lsp)
  (zig-mode .lsp))

(use-package lsp-ui :ensure t :defer 2 :commands lsp-ui-mode :hook (lsp-mode . lsp-ui-mode))
