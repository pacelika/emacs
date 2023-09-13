(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(defvar segment_files (list "set_modes" "multi_cursor" "lsp"))

(load-file "~/.emacs.d/set_modes.el")
(load-file "~/.emacs.d/multi_cursor.el")
(load-file "~/.emacs.d/lsp.el")
;; (load-file "~/.emacs.d/discordrpc.el")

;; (my-discord-load-rpc)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(modus-vivendi))
 '(custom-safe-themes
   '("e13beeb34b932f309fb2c360a04a460821ca99fe58f69e65557d6c1b10ba18c7" "41c478598f93d62f46ec0ef9fbf351a02012e8651e2a0786e0f85e6ac598f599" default))
 '(package-selected-packages
   '(lsp-treemacs xelb use-package typescript-mode shrink-path rustic racer pfuture night-owl-theme names multiple-cursors lua-mode lsp-mode hydra gruber-darker-theme gdscript-mode flycheck elcord compat company-tabnine clippy cfrs avy autothemer auto-complete all-the-icons)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; (format t "%s" ((file-name-nondirectory (directory-file-name (file-name-directory (pwd)))) (buffer-name)))
