(with-eval-after-load 
    (message (concat "Emacs took: " (emacs-init-time) " to load")))

(use-package undo-tree :defer 2 :commands undo-tree-visualize :defer 1)

(use-package expand-region
  :ensure t
  :bind ("M-m" . er/expand-region))

(use-package ivy
  :defer 0
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package ivy-rich
  :after ivy
  :init
  (ivy-rich-mode 1))

(use-package counsel
  :bind (("C-M-j" . 'counsel-switch-buffer)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history)
         ("M-x" . 'counsel-M-x)
         ("C-x C-f" . 'counsel-find-file))
  :custom
  (counsel-linux-app-format-function #'counsel-linux-app-format-function-name-only)
  :config
  (counsel-mode 1))

(use-package all-the-icons :defer 2 :if (display-graphic-p))

(use-package doom-modeline
  :defer 2
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package no-littering)
;; (setq auto-save-file-name-transforms '((".*" , (no-littering-expand-var-file-name "auto-save/") t)))

(defalias 'yes-or-no-p 'y-or-n-p)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1) 
(electric-pair-mode 1)
(global-display-line-numbers-mode 1)
(semantic-mode)
(recentf-mode 1)
(savehist-mode 1)
(save-place-mode 1)
(global-auto-revert-mode 1)

(setq history-length 25)
(setq use-dialog-box nil)
(setq global-auto-revert-non-file-buffers t)
(setq display-line-numbers-type 'relative)
(setq inhibit-startup-message t
      initial-scratch-message ""
      cursor-type 'bar)
 '(compilation-message-face 'default)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq indent-line-function 'insert-tab)
(setq c-syntactic-indentation t)
(setq c-basic-offset 4)
(setq truncate-lines t)
(setq inhibit-startup-message t)
(setq make-backup-files nil)

(use-package dashboard
  :ensure t
  :defer 5
  :init
  (progn
    (setq dashboard-startup-banner "~/.emacs.d/anime-banner.jpg")
    (setq dashboard-banner-logo-title "emacs chad'in")
    (setq dashboard-set-heading-icons t)
    (setq dashboard-items '((recents . 5)))
    :config (dashboard-setup-startup-hook)))

(use-package perspective
  :commands persp-switch-to-buffer
  :bind
  ("C-x C-b" . persp-list-buffers)         ; or use a nicer switcher, see below
  :custom
  (persp-mode-prefix-key (kbd "C-c M-p"))  ; pick your own prefix key here
  :init
  (persp-mode))

(use-package auto-complete
  :ensure t :defer 5 :init (progn (ac-config-default) (global-auto-complete-mode t)))

(use-package lsp-mode
  :ensure t
  :commands lsp-mode
  :hook(after-init . lsp-mode))

(defun setup_c_flags()
  (define-key c-mode-base-map (kbd "C-c C-\/") 'projectile-compile-project)
  (lsp-mode))

(use-package rustic
  :ensure
  :bind (:map rustic-mode-map
              ("M-j" . lsp-ui-imenu)
              ("M-?" . lsp-find-references)
              ("C-c C-\/" . projectile-compile-project)
              ("C-c C-." . projectile-run-project)
              ("C-c C-c l" . flycheck-list-errors)
              ("C-c C-c a" . lsp-execute-code-action)
              ("C-c C-c r" . lsp-rename)
              ("C-c C-c q" . lsp-workspace-restart)
              ("C-c C-c Q" . lsp-workspace-shutdown)
              ("C-c C-c s" . lsp-rust-analyzer-status))
  :config
  (setq rustic-format-on-save t)
  (add-hook 'rustic-mode-hook 'rk/rustic-mode-hook))

(defun rk/rustic-mode-hook ()
  (when buffer-file-name
    (setq-local buffer-save-without-query t))
  (add-hook 'before-save-hook 'lsp-format-buffer nil t))

(add-hook 'c++-mode-hook 'setup_c_flags)
(add-hook 'c-mode-hook 'setup_c_flags)
(add-hook 'python-mode 'lsp-mode)

(use-package multiple-cursors
  :commands mc/edit-lines
  :ensure t
  :bind(("C-S-c C-S-c" . 'mc/edit-lines)
        ("C->" . 'mc/mark-next-like-this)
        ("C-<" . 'mc/mark-previous-like-this)
        ("C-c C-<" . 'mc/mark-all-like-this)
        ("C-c C-c" . 'ace-jump-mode)
        ("C-x M-r" . 'replace-string)))

(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :bind (("C-x C-j" . dired-jump))
  :custom ((dired-listing-switches "-agho --group-directories-first")))

(use-package dired-single
  :commands (dired dired-jump))

(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))

(use-package dired-open
  :commands (dired dired-jump)
  :config
  ;; Doesn't work as expected!
  ;;(add-to-list 'dired-open-functions #'dired-open-xdg t)
  (setq dired-open-extensions '(("png" . "feh")
                                ("mkv" . "mpv"))))

(use-package projectile
  :ensure t
  :defer 
  :diminish projectile-mode
  :bind
  (("C-c p f" . helm-projectile-find-file)
   ("C-c p p" . helm-projectile-switch-project)
   ("C-c p s" . projectile-save-project-buffers))
  :config
  (projectile-mode +1))

(setq is_enabled 0)

(defun launch-terminal()
  "launch terminal"
  (interactive)
  (call-process-shell-command "alacritty" nil 0))

(defun take-screenshot()
  "take screenshot"
  (interactive)
  (call-process-shell-command "maim ~/Pictures/screenshots/screenshot:$(date +\"%H:%M:%S.png\")" nil 0))

(unless (= is_enabled 0)
  (require 'exwm)
  (require 'exwm-config)
  (exwm-config-example)
  (exwm-input-set-key (kbd "s-.") 'exwm-input-toggle-keyboard)
  (exwm-input-set-key (kbd "s-SPC") 'counsel-linux-app)
  (exwm-input-set-key (kbd "s-<return>") 'launch-terminal)
  (exwm-input-set-key (kbd "M-RET") 'take-screenshot))

(defun my-discord-load-rpc()
  (discord-emacs-run "384815451978334208"))

(require 'json)
(require 'bindat)
(require 'cl-lib)

(setq actions '(editing))

(defun get-random-action()
  (setf *random-state* (cl-make-random-state t))
  (nth (- 1 (random (cl-list-length actions))) actions))

(defgroup discord-emacs nil
  "Discord rich presence for Emacs."
  :prefix "discord-emacs-"
  :group 'external)

(defcustom discord-emacs-ipc-dir (format "/run/user/%i/" (user-uid))
  "Directory where discord IPC socket lives."
  :group 'discord-emacs
  :type 'string)

(defcustom discord-emacs-ipc-name "discord-ipc-0"
  "Discord IPC socket name."
  :group 'discord-emacs
  :type 'string)

(defcustom discord-emacs-blacklisted-buffer-names '("^\\s-*\\*")
  "Buffers matching any of these regexes will not be shown on the rich presence."
  :group 'discord-emacs
  :type '(regexp))

(defcustom discord-emacs-blacklisted-major-modes '("circe-channel-mode" "circe-server-mode")
  "Buffers with major modes matching any of these will be ignored."
  :group 'discord-emacs
  :type '(string))

(defvar discord-emacs--+handshake+ 0)
(defvar discord-emacs--+frame+ 1)
(defvar discord-emacs--+close+ 2)
(defvar discord-emacs--+ping+ 3)
(defvar discord-emacs--+pong+ 4)

(defvar discord-emacs--spec
  '((opcode u32r)
    (length u32r)
    (data str (length))))

(defvar discord-emacs--rich-presence-version 1)

(defvar discord-emacs--client-id nil)
(defvar discord-emacs--current-buffer nil)
(defvar discord-emacs--started nil)

(defun discord-emacs--get-ipc-url ()
  "Get the socket address to make the ipc connection on."
  (concat (file-name-as-directory discord-emacs-ipc-dir) discord-emacs-ipc-name))

(defun discord-emacs--make-ipc-connection ()
  "Make a ipc socket connection."
  (let ((p (make-network-process :name "discord-ipc-process"
                                 :remote (discord-emacs--get-ipc-url))))
    (set-process-query-on-exit-flag p nil)
    p))

(defun discord-emacs--pack-data (opcode data)
  "Pack OPCODE and DATA."
  (let ((encoded-json (json-encode data)))
    (bindat-pack discord-emacs--spec `((opcode . ,opcode)
                                       (length . ,(length encoded-json))
                                       (data . ,encoded-json)))))

(defun discord-emacs--ipc-handshake (client-id)
  "Perform an ipc handshake with the client id CLIENT-ID."
  `((v .  ,discord-emacs--rich-presence-version)
    (client_id . ,client-id)))

(defun discord-emacs--rich-presence (&rest fields)
  "Build a rich presence payload with the fields FIELDS."
  `((cmd . "SET_ACTIVITY")
    (args . ((pid . ,(emacs-pid))
             (activity . ,fields)))
    (nonce . ,(number-to-string (random)))))

(defun discord-emacs--send-json (opcode data)
  "Send a JSON payload over the ipc connection with the opcode OPCODE and data DATA."
  (let ((process (get-process "discord-ipc-process")))
    (if (and process
             (process-live-p process))
        (process-send-string process (discord-emacs--pack-data opcode data))
      (discord-emacs--ipc-connect discord-emacs--client-id))))

(defun discord-emacs--ipc-connect (client-id)
  "Make an ipc connection to discord with the client id CLIENT-ID."
  (discord-emacs--make-ipc-connection)
  (discord-emacs--send-json discord-emacs--+handshake+ (discord-emacs--ipc-handshake client-id))
  (setq discord-emacs--started t))

(defun discord-emacs--count-buffers ()
  "Count the number of buffers."
  (cl-count-if
   (lambda (b)
     (or (buffer-file-name b)
         (not (discord-emacs--test-buffer b))))
   (buffer-list)))

(defun discord-emacs--get-current-major-mode (buffer)
  "Get the current major mode of BUFFER."
  (when-let ((mode (assq 'major-mode (buffer-local-variables buffer))))
    (symbol-name (cdr mode))))

(defun discord-emacs--start-time ()
  "Get the start time of this Emacs instance."
  (let* ((uptime (string-to-number (emacs-uptime "%s")))
         (current-time (string-to-number (format-time-string "%s" (current-time)))))
    (- current-time uptime)))

(defun discord-emacs--projectile-current-project (s)
  "Prepend the current project to S if projectile is installed."
  (if (fboundp 'projectile-project-name)
      (format "Project: %s, %s" (projectile-project-name) s)
    s))

(defun discord-emacs--gather-data ()
  "Gather data for a rich presence payload."
  (discord-emacs--rich-presence
   :details (format "%s: <%s> %s" (get-random-action) (file-name-nondirectory (directory-file-name (file-name-directory (pwd)))) (buffer-name))
   :state (discord-emacs--projectile-current-project (format "Buffers open: %d" (discord-emacs--count-buffers)))
   :timestamps `(:start ,(discord-emacs--start-time))
   :assets `((large_image . ,(if buffer-file-name (file-name-extension buffer-file-name) "no-extension"))
             (large_text . ,(discord-emacs--get-current-major-mode (current-buffer)))
             (small_image . "emacs")
             (small_text . "emacs"))))

(defun discord-emacs--some-pred (predicates val)
  "Apply all PREDICATES to VAL, return the first non-nil value or nil."
  (cl-some (lambda (pred) (funcall pred val))
           predicates))

(defun discord-emacs--test-buffer (buffer)
  "Test if the BUFFER is one that we should build a rich presence for."
  (or
   (discord-emacs--some-pred
    (cl-mapcar (lambda (regex)
                 (lambda (s) (string-match regex s)))
               discord-emacs-blacklisted-buffer-names)
    (buffer-name buffer))
   (discord-emacs--some-pred
    (cl-mapcar (lambda (blacklisted-mode)
                 (lambda (s) (string= blacklisted-mode s)))
               discord-emacs-blacklisted-major-modes)
    (discord-emacs--get-current-major-mode buffer))))

(defun discord-emacs--ipc-send-update ()
  "Send an ipc update to discord."
  (unless (or (string= discord-emacs--current-buffer (buffer-name))
              (discord-emacs--test-buffer (current-buffer)))
    ;; dont send messages when we are in the same buffer or enter the minibuf
    (setq discord-emacs--current-buffer (buffer-name))
    (discord-emacs--send-json discord-emacs--+frame+ (discord-emacs--gather-data))))

(defun discord-emacs-run (client-id)
  "Run the rich presence with the client id CLIENT-ID."
  (unless discord-emacs--started
    (setq discord-emacs--client-id client-id)
    (add-hook 'post-command-hook #'discord-emacs--ipc-send-update)
    (add-hook 'kill-emacs-hook #'discord-emacs-stop)
    (ignore-errors ; if we fail here we'll just reconnect later
      (discord-emacs--ipc-connect client-id))))

(defun discord-emacs-stop ()
  "Stop the Emacs rich presence."
  (when-let ((process (get-process "discord-ipc-process")))
    (delete-process process)
    (setq discord-emacs--started nil)))

(provide 'discord-emacs)
