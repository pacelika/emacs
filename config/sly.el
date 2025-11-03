(use-package sly
  :defer t
  :load-path "~/.emacs.d/modes/sly-1.0.43/"
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
  "Queries the root asd file"
  (let ((dir (locate-dominating-file
              default-directory
              (lambda (dir) (directory-files dir nil "\\.asd\\'")))))
    (when dir
      (expand-file-name
       (car (directory-files dir nil "\\.asd\\'"))
       dir))))

(defun get-project-root-dir()
  "Queries the root directory"
  (locate-dominating-file
   default-directory
   (lambda (dir)
     (directory-files dir nil "\\.asd\\'"))))

(defun try-load-sly()
  (unless (sly-connected-p)
    (save-excursion
      (sly))))

(defun sly-load-root-asd-file()
  "loads root asd file using sly"
  (interactive)
  (let ((asd-file (get-root-asd-file)))
    (if asd-file
        (progn
          (sly-load-file asd-file)
          (message "[INFO] Loading \"%s\" file" asd-file))
      (message "[INFO] No root asd file found"))))

(add-hook 'lisp-mode-hook
          (lambda()
            (try-load-sly)
            (local-set-key (kbd "C-c l") #'sly-load-root-asd-file)
            (setf current-project-path (or (get-project-root-dir) default-directory))
            (when (sly-connected-p)
              (when (and last-project-path (not (string= last-project-path current-project-path)))
                (sly-cd current-project-path))
              (setf last-project-path current-project-path))))

(add-hook 'sly-connected-hook
          (lambda()
            (sly-cd (or (get-project-root-dir) default-directory))
            (sly-load-root-asd-file)))
