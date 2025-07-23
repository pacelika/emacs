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

(defun get-root-asd-file()
  (let ((dir (locate-dominating-file
              default-directory
              (lambda (dir) (directory-files dir nil "\\.asd\\'")))))
    (when dir
      (expand-file-name
       (car (directory-files dir nil "\\.asd\\'"))
       dir))))

(defun get-project-root-dir()
  (locate-dominating-file
   default-directory
   (lambda (dir)
     (directory-files dir nil "\\.asd\\'"))))

(defun try-load-slime()
  (unless (slime-connected-p)
    (save-excursion
      (slime))))

(add-hook 'lisp-mode-hook
          (lambda()
            (if (eq system-type 'windows-nt)
            (setq inferior-lisp-program (concat "~/.emacs.d/scripts/start-sbcl.bat "
                                                (or (get-project-root-dir) default-directory)))
            (setq inferior-lisp-program (concat "~/.emacs.d/scripts/start-sbcl.sh "
                                                (or (get--project-root-dir) default-directory))))
            (try-load-slime)))
