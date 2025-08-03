(use-package sly
  :ensure t
  :defer t
  :hook
  (lisp-mode . sly-mode)
  :config
  (setq inferior-lisp-program "sbcl")
  (setq sly-protocol-version 'ignore)
  (sly-setup '(sly-fancy)))

(require 'sly)

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

(defun try-load-sly()
  (unless (sly-connected-p)
    (save-excursion
      (sly))))

(add-hook 'lisp-mode-hook
          (lambda()
            (try-load-sly)
            (setf current-project-path (or (get-project-root-dir) default-directory))
            (when (sly-connected-p)
              (when (and last-project-path (not (string= last-project-path current-project-path)))
                (sly-cd current-project-path))
              (setf last-project-path current-project-path))))

(add-hook 'sly-connected-hook
          (lambda()
            (sly-cd (or (get-project-root-dir) default-directory))))
