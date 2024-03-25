(deftheme escuro
  "Tema escuro.")

(custom-theme-set-faces
 'escuro
 '(default ((t (:background "#11242b" :foreground "#edebe4"))))
 '(fringe ((t (:background "#112026"))))
 '(mode-line ((t (:background "#3d3628" :box (:line-width (1 . 1) :color "#261a03")))))
 '(region ((t (:extend t :background "#253136"))))
 '(tab-bar ((t (:inherit nil :background "#3d3628" :foreground "white" :box (:line-width (1 . 1) :color "#261a03")))))
 '(tab-bar-tab ((t (:inherit tab-bar :box (:line-width (1 . 1) :color "#261a03")))))
 '(tab-bar-tab-inactive ((t (:inherit tab-bar-tab :background "#3d3628" :foreground "gray70")))))

(provide 'escuro-theme)
