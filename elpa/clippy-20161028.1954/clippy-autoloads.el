;;; clippy-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "clippy" "clippy.el" (0 0 0 0))
;;; Generated autoloads from clippy.el

(autoload 'clippy-say "clippy" "\
Display pop-up box with Clippy saying TEXT.
The box disappears after the next input event.

If optional argument FILL is non-nil, the text is filled to 72
columns.

\(fn TEXT &optional FILL)" nil nil)

(autoload 'clippy-describe-function "clippy" "\
Display the full documentation of FUNCTION (a symbol) in tooltip.

\(fn FUNCTION)" t nil)

(autoload 'clippy-describe-variable "clippy" "\
Display the full documentation of VARIABLE (a symbol) in tooltip.

\(fn VARIABLE)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "clippy" '("clippy-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; clippy-autoloads.el ends here
