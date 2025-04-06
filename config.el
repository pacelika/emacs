(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(defun goto-config-file() (interactive) (find-file (expand-file-name "~/.emacs.d/config.el")))
(keymap-global-set "C-x C-\\" 'goto-config-file)

(with-eval-after-load 
    (message (concat "Ermm Emacs took: " (emacs-init-time) " to initialize")))

;; (use-package expand-region
;;   :ensure t
;;   :defer t
;;   :bind ("C-=" . er/expand-region))

(load "~/.emacs.d/defaults.el")
(load "~/.emacs.d/compile.el")
(load "~/.emacs.d/languages.el")
(load "~/.emacs.d/lsp.el")
