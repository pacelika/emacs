(load "~/.emacs.d/settings.el")

(with-eval-after-load
    (message (concat "Emacs took " (emacs-init-time) " to initialize")))

(defun goto-config-file() (interactive) (find-file (expand-file-name "~/.emacs.d/init.el")))
(keymap-global-set "C-x C-\\" 'goto-config-file)

(add-to-list 'load-path "~/.emacs.d/deps")

(let ((dir (expand-file-name "~/.emacs.d/config")))
  (dolist (file (nthcdr 0 (directory-files dir t "\\.el$")))
    (load file)))
