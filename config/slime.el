(use-package slime
  :ensure t
  :defer t
  :hook
  (lisp-mode . slime-mode)
  :config
  (setq inferior-lisp-program "sbcl")
  (setq slime-protocol-version 'ignore)
  (slime-setup '(slime-fancy)))

(require 'slime)

(defun find-root-asd()
  (let ((dir (locate-dominating-file
              default-directory
              (lambda (dir) (directory-files dir nil "\\.asd\\'")))))
    (when dir
      (expand-file-name
       (car (directory-files dir nil "\\.asd\\'"))
       dir))))

(defun find-project-root()
  (locate-dominating-file
   default-directory
   (lambda (dir)
     (directory-files dir nil "\\.asd\\'"))))

(defun _load-slime()
  (unless (slime-connected-p)
    (save-excursion
      (slime))))

(add-hook 'lisp-mode-hook
          (lambda()
            (if (eq system-type 'windows-nt)
            (setq inferior-lisp-program (concat "~/.emacs.d/scripts/start-sbcl.bat "
                                                (or (find-project-root) default-directory)))
            (setq inferior-lisp-program (concat "~/.emacs.d/scripts/start-sbcl.sh "
                                                (or (find-project-root) default-directory)))
                )
            (_load-slime)))
