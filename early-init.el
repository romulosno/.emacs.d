(defvar default-gc-cons-threshold gc-cons-threshold)
(setq gc-cons-threshold most-positive-fixnum)

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(modify-all-frames-parameters '((height . 35)
				(width . 100)))

(setq frame-resize-pixelwise t
      frame-inhibit-implied-resize t
      use-file-dialog nil
      inhibit-startup-screen t
      inhibit-startup-echo-area-message user-login-name)

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold default-gc-cons-threshold)) t)
