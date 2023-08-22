(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(completion-show-help nil)
 '(completion-styles '(basic partial-completion emacs22 flex))
 '(completions-max-height 15)
 '(dired-listing-switches "-alh --group-directories-first")
 '(ediff-split-window-function 'split-window-horizontally)
 '(ediff-window-setup-function 'ediff-setup-windows-plain)
 '(kill-whole-line t)
 '(modus-themes-mode-line '(accented borderless))
 '(org-capture-templates
   '(("n" "Nota" entry
      (file+headline "~/org/notes.org" "Notas")
      "* %?\12%i\12%a" :kill-buffer t)
     ("t" "Task" entry
      (file+headline "~/org/notes.org" "Tasks")
      "* TODO %?\12  %i\12  %a" :kill-buffer t)) t)
 '(org-use-speed-commands t)
 '(outline-minor-mode-cycle t)
 '(outline-minor-mode-prefix "\357")
 '(package-quickstart t)
 '(package-selected-packages '(yaml-mode markdown-mode gruvbox-theme))
 '(ring-bell-function 'ignore)
 '(send-mail-function 'smtpmail-send-it)
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 25)
 '(tab-always-indent 'complete)
 '(tab-bar-select-tab-modifiers '(meta)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
