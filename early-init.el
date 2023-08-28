(setq gc-cons-threshold most-positive-fixnum)
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold 800000)))

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(modify-all-frames-parameters '((height . 35)
				(width . 100)
				(background-color . "black")
				(foreground-color . "white")))
