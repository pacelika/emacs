(require 'my-project)

(defun goto-project-root()
  (interactive)
  (let ((dir (find-project-root-dir)))
    (if dir
        (progn
          (find-file (expand-file-name dir)))
      (message "[INFO] No markers were found for the project"))))

(keymap-global-set "C-c j" #'goto-project-root)
