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

(keymap-global-set "C-," 'duplicate-line)
(load "~/.emacs.d/defaults.el")

(use-package gruber-darker-theme :ensure t)

(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))

(use-package vterm :ensure :defer 2 :bind ("M-*" . vterm))

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

(use-package ivy
  :ensure t
  :init
  (ivy-mode 1))

(use-package swiper
  :ensure t
  :bind (("C-s" . swiper)))

(use-package corfu
  :ensure t
  :defer 3
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-auto-prefix 2)
  (corfu-auto-delay 0.1)
  (corfu-popupinfo-delay '(0.5 . 0.2))
  (corfu-preview-current 'insert)
  (corfu-preselect 'prompt)
  (corfu-on-exact-match nil)
  :bind (:map corfu-map
              ("M-SPC"      . corfu-insert-separator)
              ("TAB"        . corfu-next)
              ([tab]        . corfu-next)
              ("S-TAB"      . corfu-previous)
              ([backtab]    . corfu-previous)
              ("S-<return>" . corfu-insert)
              ("RET"        . nil))

  :init
  (global-corfu-mode)
  (corfu-history-mode)
  (corfu-popupinfo-mode))

(use-package lsp-mode :ensure t 
  :defer 2 
  :hook
  (c-mode . lsp)
  (cpp-mode .lsp))

(use-package lsp-ui :ensure t :defer 2 :commands lsp-ui-mode :hook (lsp-mode . lsp-ui-mode))
