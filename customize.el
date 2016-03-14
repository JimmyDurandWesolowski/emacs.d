;;; cusomize.el  --- Default Emacs customization.

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

;;;; BUILTIN VARIABLE CUSTOMIZATION
;;; DEBUG ACTIVATION IF NECESSARY
;; (setq debug-on-error t)

;;; COLORS AND FONT ;;;
(set-background-color "black")
(set-foreground-color "white")
(set-default-font "-misc-fixed-*-r-normal-*-10-*-*-*-*-*-*-*")
(set-face-attribute 'default nil :height 98)
(set-frame-font "-misc-fixed-*-r-normal-*-10-*-*-*-*-*-*-*" t)
(setq default-frame-alist
      (append default-frame-alist
	      '((foreground-color . "White")
		(background-color . "Black")
		)))

;; GDB should split the windows to show various info
(setq-default gdb-many-windows t)

;; Menu buffer default column sorting
(setq Buffer-menu-sort-column 5)

;; Ask before closing
;; (when window-system
;;   (global-set-key (kbd "C-x C-c") 'ask-before-closing))
;; (global-set-key (kbd "C-x C-c") 'kill-emacs)

;; Do not show the menubar, the toolbar, and the scroll bar
(custom-set-variables
 '(menu-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(scroll-bar-mode nil))

;; Do not display the startup screen at launch
(set-default `inhibit-startup-screen t)

;; Display in fullscreen at start
'(toggle-fullscreen t)

;; Display the column number in the status bar
(column-number-mode t)
;; Display the time in the status bar
(display-time-mode t)

;; Disable tooltips (emacs help with the mouse)
(tooltip-mode 0)

;; Rotating the kill ring changes the window system selection
'(yank-pop-change-selection t)
;; Use the X primary clipboard for pasting
(setq x-select-enable-clipboard nil)
(setq x-select-enable-primary t)

;; Do not ignore case for tags and completion
(set-default `tags-case-fold-search nil)
(set-default `dabbrev-case-fold-search nil)
;; Do it for search
(set-default `case-fold-search t)

;; Use the desktop save mode to restore buffers
(desktop-save-mode 1)
;; Retore the first 5 buffers, then restore the other when possible
'(desktop-restore-eager 5)
;; Add a variable to know if we load a desktop file
;; (defun my-desktop-save()
;;   (if (eq (desktop-owner) (emacs-pid))
;;       (desktop-save ask)
;;     (desktop-save nil)))
;; (add-hook 'desktop-save 'my-desktop-save)

;; Show trailing whitespaces
(setq-default show-trailing-whitespace t)

;; Ensure backspace delete the cursor previous character
(setq c-backspace-function 'backward-delete-char)

;; Allows to type just "y" instead of "yes".
(fset 'yes-or-no-p 'y-or-n-p)

;;; ISPELL BEHAVIOR ;;;
(setq-default ispell-program-name "aspell")


;;; C MODE BEHAVIOR ;;;
;; Set C default style to linux
(setq c-default-style "linux")
;; Put in a "carriage-return" automatically after left curly braces,
;; right curly braces, and semi-colons
;; (setq c-auto-newline 1)
;; "Ctrl-k" kills an entire line if the cursor is at the beginning of line
(setq kill-whole-line t)


;; Change asm comments
(add-hook 'asm-mode-hook (lambda () (setq comment-start "/*"
					  comment-end   "*/")))


(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")))

;;(require 'misc)
;; ;; Consider the underscore as a word part
;;(modify-syntax-entry ?_ "w" c-mode-syntax-table)
;; ;; Consider the underscore as a symbol consistuent character (default)
;;(modify-syntax-entry ?_ "_" c-mode-syntax-table)
