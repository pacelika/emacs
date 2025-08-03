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

(defvar last-project-path nil)
(defvar current-project-path nil)

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
            (try-load-slime)
            (setf current-project-path (or (get-project-root-dir) default-directory))
            (when (slime-connected-p)
              (when (and last-project-path (not (string= last-project-path current-project-path)))
                (slime-cd current-project-path))
              (setf last-project-path current-project-path))))

(add-hook 'slime-connected-hook
          (lambda()
            (slime-cd (or (get-project-root-dir) default-directory))))
