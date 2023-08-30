;;;; Customize
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(completion-show-help nil)
 '(completions-max-height 15)
 '(delete-selection-mode t)
 '(dired-listing-switches "-alh --group-directories-first")
 '(ediff-split-window-function 'split-window-horizontally)
 '(ediff-window-setup-function 'ediff-setup-windows-plain)
 '(electric-pair-mode t)
 '(frame-inhibit-implied-resize t)
 '(frame-resize-pixelwise t)
 '(global-reveal-mode t)
 '(inhibit-startup-screen t)
 '(initial-major-mode 'fundamental-mode)
 '(initial-scratch-message nil)
 '(kill-whole-line t)
 '(org-capture-templates
   '(("t" "Todo" entry
      (file+headline "agenda.org" "Tasks")
      "* TODO %?\12  %i\12  %a")
     ("j" "Journal" entry
      (file+olp+datetree "journal.org")
      "* %?\12Entered on %U\12  %i\12  %a")) t)
 '(org-use-speed-commands t)
 '(outline-minor-mode-cycle t)
 '(outline-minor-mode-prefix [134217839])
 '(package-quickstart t t)
 '(package-selected-packages '(yaml-mode markdown-mode) t)
 '(repeat-mode t)
 '(ring-bell-function 'ignore)
 '(save-place-mode t)
 '(savehist-mode t)
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(tab-always-indent 'complete)
 '(use-file-dialog nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;;; Keybindings
(global-set-key (kbd "<f5>") #'org-capture)
(global-set-key (kbd "C-z") #'repeat)
(global-set-key (kbd "C-c a") #'org-agenda-list)
(global-set-key (kbd "C-c o") #'outline-minor-mode)
(global-set-key (kbd "C-c i") #'imenu)
(global-set-key (kbd "C-c k") #'kill-current-buffer)

;;;; Dired
(with-eval-after-load 'dired
  (require 'dired-x))

;;;; Flymake
(with-eval-after-load 'flymake
  (let ((map flymake-mode-map))
    (define-key map (kbd "M-n") #'flymake-goto-next-error)
    (define-key map (kbd "M-p") #'flymake-goto-prev-error)
    (define-key map (kbd "C-c c e") #'flymake-show-buffer-diagnostics)))

;;;; Eglot
(with-eval-after-load 'eglot
  (let ((map eglot-mode-map))
    (define-key map (kbd "C-c c f") #'eglot-format)
    (define-key map (kbd "C-c c a") #'eglot-code-actions)
    (define-key map (kbd "C-c c s") #'eglot-shutdown)
    (define-key map (kbd "C-c c r") #'eglot-rename))
  
  (cl-defmethod eglot-execute-command
    (_server (_cmd (eql java.apply.workspaceEdit)) arguments)
    "Eclipse JDT breaks spec and replies with edits as arguments."
    (mapc #'eglot--apply-workspace-edit arguments)))


