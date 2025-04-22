(with-eval-after-load 
    (message (concat "Ermm Emacs took " (emacs-init-time) " to initialize")))

(defun goto-config-file() (interactive) (find-file (expand-file-name "~/.emacs.d/config.el")))
(keymap-global-set "C-x C-\\" 'goto-config-file)

(add-to-list 'load-path "~/.emacs.d/vendor")

(let ((dir (expand-file-name "~/.emacs.d/configs")))
  (dolist (file (nthcdr 0 (directory-files dir t "\\.el$")))
    (load file)))
