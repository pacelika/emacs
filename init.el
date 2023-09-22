(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(spacemacs-dark))
 '(custom-safe-themes
   '("e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2" "8b6506330d63e7bc5fb940e7c177a010842ecdda6e1d1941ac5a81b13191020e" "4fda8201465755b403a33e385cf0f75eeec31ca8893199266a6aeccb4adedfa4" "8810c1d0f2717380d68d6b500d79becee8344f33dbe8d1201df52294beea3f6a" "b54376ec363568656d54578d28b95382854f62b74c32077821fdfd604268616a" "f5f80dd6588e59cfc3ce2f11568ff8296717a938edd448a947f9823a4e282b66" "8b148cf8154d34917dfc794b5d0fe65f21e9155977a36a5985f89c09a9669aa0" "eab123a5ed21463c780e17fc44f9ffc3e501655b966729a2d5a2072832abd3ac" "014cb63097fc7dbda3edf53eb09802237961cbb4c9e9abd705f23b86511b0a69" "02f57ef0a20b7f61adce51445b68b2a7e832648ce2e7efb19d217b6454c1b644" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "dccf4a8f1aaf5f24d2ab63af1aa75fd9d535c83377f8e26380162e888be0c6a9" "7fd8b914e340283c189980cd1883dbdef67080ad1a3a9cc3df864ca53bdc89cf" "e13beeb34b932f309fb2c360a04a460821ca99fe58f69e65557d6c1b10ba18c7" "41c478598f93d62f46ec0ef9fbf351a02012e8651e2a0786e0f85e6ac598f599" default))
 '(package-selected-packages
   '(projectile all-the-icons-dired undo-tree expand-region ivy-rich no-littering dashboard counsel swiper doom-themes exwm all-the-icons spacemacs-theme nerd-icons doom-modeline timu-macos-theme lsp-treemacs xelb use-package typescript-mode shrink-path rustic racer pfuture night-owl-theme names multiple-cursors lua-mode lsp-mode hydra gruber-darker-theme gdscript-mode flycheck compat company-tabnine clippy cfrs avy autothemer auto-complete)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun goto-config-file()
  (interactive)
  (find-file (expand-file-name "~/.emacs.d/Emacs.org")))

(keymap-global-set "C-x C-\\" 'goto-config-file)
(org-babel-load-file (expand-file-name "~/.emacs.d/Emacs.org"))
;; (message (emacs-init-time))
