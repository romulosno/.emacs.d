;;; early-init.el ---                                -*- lexical-binding: t; -*-

;; Copyright (C) 2023  Romulo Oliveira

;; Author: Romulo Oliveira <romulo@fedora>
;; Keywords: 

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:

(setq gc-cons-threshold most-positive-fixnum)
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold 800000)))

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(modify-all-frames-parameters '((height . 35)
				(width . 100)))

(setq frame-inhibit-implied-resize t
      frame-resize-pixelwise t)

(provide 'early-init)
;;; early-init.el ends here
