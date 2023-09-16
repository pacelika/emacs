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
 '(custom-enabled-themes '(doom-1337))
 '(custom-safe-themes
   '("014cb63097fc7dbda3edf53eb09802237961cbb4c9e9abd705f23b86511b0a69" "02f57ef0a20b7f61adce51445b68b2a7e832648ce2e7efb19d217b6454c1b644" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "dccf4a8f1aaf5f24d2ab63af1aa75fd9d535c83377f8e26380162e888be0c6a9" "7fd8b914e340283c189980cd1883dbdef67080ad1a3a9cc3df864ca53bdc89cf" "e13beeb34b932f309fb2c360a04a460821ca99fe58f69e65557d6c1b10ba18c7" "41c478598f93d62f46ec0ef9fbf351a02012e8651e2a0786e0f85e6ac598f599" default))
 '(package-selected-packages
   '(counsel swiper doom-themes exwm all-the-icons spacemacs-theme nerd-icons doom-modeline timu-macos-theme lsp-treemacs xelb use-package typescript-mode shrink-path rustic racer pfuture night-owl-theme names multiple-cursors lua-mode lsp-mode hydra gruber-darker-theme gdscript-mode flycheck elcord compat company-tabnine clippy cfrs avy autothemer auto-complete)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'exwm)
(require 'exwm-config)
(exwm-config-example)
