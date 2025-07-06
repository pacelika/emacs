(add-to-list 'load-path "~/.emacs.d/modes/elcord")
(autoload 'elcord-mode "~/.emacs.d/modes/elcord/elcord.el" nil t)

(require 'elcord)

(use-package elcord
  :defer t
  :init
  (elcord-mode))
