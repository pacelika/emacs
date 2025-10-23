(defun goto-config-file()
  (interactive)
  (find-file (expand-file-name "~/.emacs.d/init.el")))

(keymap-global-set "C-x C-\\" 'goto-config-file)

(with-eval-after-load
    (message (concat "Emacs took " (emacs-init-time) " to initialize")))

(load "~/.emacs.d/settings.el")

(add-to-list 'load-path "~/.emacs.d/deps")
(add-to-list 'load-path "~/.emacs.d/utils")

(let ((dir (expand-file-name "~/.emacs.d/config")))
  (dolist (file (nthcdr 0 (directory-files dir t "\\.el$")))
    (load file)))
