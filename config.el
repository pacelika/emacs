(with-eval-after-load 
    (message (concat "Ermm Emacs took " (emacs-init-time) " to initialize")))

(defun goto-config-file() (interactive) (find-file (expand-file-name "~/.emacs.d/config.el")))
(keymap-global-set "C-x C-\\" 'goto-config-file)

(when (and (fboundp 'bookmark-bmenu-list)
           (not noninteractive)
           (null command-line-args-left))
  ((lambda()
     (bookmark-bmenu-list)
     (switch-to-buffer "*Bookmark List*"))))

(add-to-list 'load-path "~/.emacs.d/vendor")

(load "~/.emacs.d/configs/modes-conf.el")
(load "~/.emacs.d/configs/compile-conf.el")
(load "~/.emacs.d/configs/shell-conf.el")
(load "~/.emacs.d/configs/lsp-conf.el")
(load "~/.emacs.d/configs/beacon-conf.el")
