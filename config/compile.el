(require 'compile)

(setq compilation-scroll-output t)
(defvar last-compile-command nil)

(defun get-common-project-compile-command(root)
  "get the project common compile command"
  (cond
   ((file-exists-p (expand-file-name "Cargo.toml" root)) "cargo run")
   ((directory-files root nil "\\.nimble\\'") "nimble run")
   ((directory-files root nil "\\.ninja\\'") "ninja")
   ((directory-files root nil "\\.asd\\'") "sbcl ")
   ((file-exists-p (expand-file-name "package.json" root)) "npm run dev")
   ((file-exists-p (expand-file-name "project.json" root)) "")
   ((file-exists-p (expand-file-name "go.mod" root)) "go run ")
   ((file-exists-p (expand-file-name "build.zig" root)) "zig build run")
   ((file-exists-p (expand-file-name "premake5.lua" root)) "premake5 gmake")
   ((file-exists-p (expand-file-name "Makefile" root))
    (if (eq system-type 'windows-nt) "mingw32-make" "make"))
   ((file-exists-p (expand-file-name "CMakeLists.txt" root)) "cmake -S .")
   (t nil)))

(defun find-project-root()
  "Find the root of the project by searching for .git, Makefile, or similar markers."
  (or (locate-dominating-file default-directory ".git")
      (locate-dominating-file default-directory "Makefile")
      (locate-dominating-file default-directory "CMakeLists.txt")
      (locate-dominating-file default-directory "package.json")
      (locate-dominating-file default-directory "project.json")
      (locate-dominating-file default-directory "premake5.lua")
      (locate-dominating-file default-directory "Cargo.toml")
      (locate-dominating-file default-directory "go.mod")
      (locate-dominating-file
       default-directory
       (lambda (dir) (directory-files dir nil "\\.nimble\\'")))
      (locate-dominating-file
       default-directory
       (lambda (dir) (directory-files dir nil "\\.asd\\'")))
      (locate-dominating-file
       default-directory
       (lambda (dir) (directory-files dir nil "\\.ninja\\'")))
      (locate-dominating-file default-directory "build.zig")))

(defun compile-root-wo-prompt()
  "Run `compile` without command prompt."
  (interactive)
  (let ((default-directory (or (find-project-root) default-directory)))
    (cond 
     ((null last-compile-command) (compile-root-w-prompt))
    (t (compile last-compile-command)))))

(defun compile-root-w-prompt()
  "Prompt for a compile command and run it from the project root."
  (interactive)
  (let* ((root (or (find-project-root) default-directory))
         (default-command (or last-compile-command (get-common-project-compile-command root)))
         (command (read-shell-command "Compile command: " default-command)))
    (setq last-compile-command command)
    (let ((default-directory root))
      (compile command))))

(global-set-key (kbd "C-c C-/") 'compile-root-w-prompt)
(global-set-key (kbd "C-c C-.") 'compile-root-wo-prompt)
