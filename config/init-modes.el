(use-package llvm-mode
  :load-path "~/.emacs.d/modes"
  :defer t
  :mode "\\.ll\\'")

(use-package zig-mode
  :load-path "~/.emacs.d/modes"
  :defer t
  :mode "\\.zig\\'")

(use-package c3-mode
  :load-path "~/.emacs.d/modes"
  :defer t
  :mode "\\.c3\\'")

(use-package rust-mode 
  :load-path "~/.emacs.d/modes/rust-mode"
  :defer t
  :mode "\\.rs\\'")

(use-package nim-mode
  :load-path "~/.emacs.d/modes/nim-mode"
  :defer t
  :mode (("\\.nim\\'" . nim-mode)
         ("\\.nims\\'" . nim-mode)
         ("\\.nimble\\'" . nim-mode)))

(use-package haskell-mode
  :defer t
  :load-path "~/.emacs.d/modes/haskell-mode"
  :mode "\\.hs\\'")

(use-package crystal-mode
  :load-path "~/.emacs.d/modes/"
  :defer t
  :mode "\\.cr\\'")

(use-package go-mode 
  :defer t
  :load-path "~/.emacs.d/modes/go-mode"
  :mode "\\.go\\'")

(use-package dart-mode
  :defer t
  :load-path "~/.emacs.d/modes"
  :mode "\\.dart\\'")

(use-package janet-mode
  :load-path "~/.emacs.d/modes"
  :mode "\\.janet\\'"
  :defer t)

(use-package lua-mode
  :load-path "~/.emacs.d/modes"
  :mode "\\.lua\\'"
  :defer t)

(use-package web-mode
  :defer t
  :load-path "~/.emacs.d/modes"
  :mode (("\\.tsx\\'" . web-mode)
         ("\\.jsx\\'" . web-mode)))

(use-package php-mode 
  :defer t
  :load-path "~/.emacs.d/modes/php-mode"
  :mode "\\.php\\'")

(use-package cmake-mode
  :load-path "~/.emacs.d/modes"
  :defer t
  :mode "\\CMakeLists.txt\\'")

(use-package slint-mode
  :load-path "~/.emacs.d/modes"
  :defer t
  :mode "\\.slint\\'")

(require 'restclient)
