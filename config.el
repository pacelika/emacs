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
