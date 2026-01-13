(use-package llvm-mode
  :load-path "~/.emacs.d/modes"
  :defer t
  :mode "\\.ll\\'")

(use-package zig-mode
  :load-path "~/.emacs.d/modes"
  :defer t
  :mode "\\.zig\\'")

(use-package rust-mode 
  :load-path "~/.emacs.d/modes/rust-mode-1.0.6"
  :defer t
  :mode "\\.rs\\'")

(use-package nim-mode
  :load-path "~/.emacs.d/modes/nim-mode-0.4.2"
  :defer t
  :mode (("\\.nim\\'" . nim-mode)
         ("\\.nims\\'" . nim-mode)
         ("\\.nimble\\'" . nim-mode)))

(use-package haskell-mode
  :defer t
  :load-path "~/.emacs.d/modes/haskell-mode-17.5"
  :mode "\\.hs\\'")

(use-package crystal-mode
  :load-path "~/.emacs.d/modes/"
  :defer t
  :mode "\\.cr\\'")

(use-package go-mode 
  :defer t
  :load-path "~/.emacs.d/modes/go-mode-1.6.0"
  :mode "\\.go\\'")

(use-package clojure-mode
  :defer t
  :load-path "~/.emacs.d/modes/clojure-mode-5.20.0"
  :mode "\\.clj\\'")

(use-package lua-mode
  :load-path "~/.emacs.d/modes"
  :mode "\\.lua\\'"
  :defer t)

(use-package janet-mode
  :defer t
  :load-path "~/.emacs.d/modes"
  :mode "\\.janet\\'")

(use-package vlang-mode
  :load-path "~/.emacs.d/modes"
  :mode "\\.v\\'"
  :defer t)

(use-package web-mode
  :defer t
  :load-path "~/.emacs.d/modes"
  :mode (("\\.tsx\\'" . web-mode)
         ("\\.jsx\\'" . web-mode)))

(use-package php-mode 
  :defer t
  :load-path "~/.emacs.d/modes/php-mode-1.26.1"
  :mode "\\.php\\'")

(use-package cmake-mode
  :load-path "~/.emacs.d/modes"
  :defer t
  :mode "\\CMakeLists.txt\\'")

(use-package restclient
  :init
  (require 'restclient))

(use-package rainbow-delimiters
  :init
  (require 'rainbow-delimiters)
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package elcord
  :load-path "~/.emacs.d/modes/elcord"
  :defer t
  :init
  (require 'elcord))
