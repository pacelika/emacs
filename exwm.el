(require 'exwm)
(require 'exwm-config)
(exwm-config-example)

(defun launch-terminal()
  "launch terminal"
  (interactive)
  (call-process-shell-command "alacritty" nil 0))

(defun take-screenshot()
  "take screenshot"
  (interactive)
  (call-process-shell-command "maim ~/Pictures/screenshots/screenshot:$(date +\"%H:%M:%S\")" nil 0))

(exwm-input-set-key (kbd "s-.") 'exwm-input-toggle-keyboard)
(exwm-input-set-key (kbd "s-SPC") 'counsel-linux-app)
(exwm-input-set-key (kbd "s-<return>") 'launch-terminal)
(exwm-input-set-key (kbd "M-RET") 'take-screenshot)
