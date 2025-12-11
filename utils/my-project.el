(defun find-project-root-dir()
  "Find the root of the project by searching for .git, Makefile, or similar markers."
  (or (locate-dominating-file default-directory ".git")
      (locate-dominating-file default-directory "Makefile")
      (locate-dominating-file default-directory "build.c")
      (locate-dominating-file default-directory "CMakeLists.txt")
      (locate-dominating-file default-directory "package.json")
      (locate-dominating-file default-directory "project.json")
      (locate-dominating-file default-directory "project.janet")
      (locate-dominating-file default-directory "project.clj")
      (locate-dominating-file default-directory "deps.edn")
      (locate-dominating-file default-directory "premake5.lua")
      (locate-dominating-file default-directory "Cargo.toml")
      (locate-dominating-file default-directory "go.mod")
      (locate-dominating-file default-directory "v.mod")
      (locate-dominating-file default-directory "pom.xml")
      (locate-dominating-file default-directory "build.gradle")
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

(provide 'my-project)
