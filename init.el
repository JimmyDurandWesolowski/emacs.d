;;; init.el  --- Main initialization file for emacs customization.

;; Copyrigth (C) 2016  Jimmy Durand Wesolowski

;; Author: Jimmy Durand Wesolowski <jimmy.durand.wesolowski(at)gmail.com>

;; This file is *NOT* part of GNU Emacs.

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or (at
;; your option) any later version.

;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING. If not, write to the
;; Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.


;; Add the following to your ~/.emacs:
;; (when (file-exists-p "~/.emacs.d/init.el") (load "~/.emacs.d/init.el"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(desktop-save (quote ask))
 '(diff-switches "-u")
 '(garak-alert-methods (quote (:notify)))
 '(garak-alert-when (quote (:new :hidden :chat)))
 '(menu-bar-mode nil)
 '(org-agenda-restore-windows-after-quit t)
 '(org-agenda-window-setup (quote current-window))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))

(load "~/.emacs.d/customize.el")
(load "~/.emacs.d/bindings.el")
(load "~/.emacs.d/elpa-modes.el")
(load "~/.emacs.d/custom.el")
(when (file-exists-p "~/.emacs.d/specific.el") (load "~/.emacs.d/specific.el"))
