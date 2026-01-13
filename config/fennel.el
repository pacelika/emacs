(use-package fennel-mode
  :load-path "~/.emacs.d/modes/fennel-mode-0.9.3"
  :defer t
  :mode "\\.fnl\\'"
  :bind (:map fennel-mode-map
              ("C-c C-c" . #'fennel-eval-region))
  :config
  (setq inferior-lisp-program "fennel"))

(defun run-fennel-repl()
  (unless (comint-check-proc "*inferior-lisp*")
    (save-window-excursion
      (run-lisp inferior-lisp-program))))

(add-hook 'fennel-mode-hook #'run-fennel-repl)

