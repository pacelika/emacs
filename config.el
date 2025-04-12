(with-eval-after-load 
    (message (concat "Ermm Emacs took " (emacs-init-time) " to initialize")))

(add-to-list 'load-path "~/.emacs.d/vendor")

(defun goto-config-file() (interactive) (find-file (expand-file-name "~/.emacs.d/config.el")))
(keymap-global-set "C-x C-\\" 'goto-config-file)

(when (and (fboundp 'bookmark-bmenu-list)
           (not noninteractive)
           (null command-line-args-left))
  ((lambda()
     (bookmark-bmenu-list)
     (switch-to-buffer "*Bookmark List*"))))

(load "~/.emacs.d/compile-conf.el")
(load "~/.emacs.d/languages.el")
(load "~/.emacs.d/configs/lsp-conf.el")
