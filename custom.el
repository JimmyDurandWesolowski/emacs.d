;;; custom.el  --- Custom quick and dirty emacs scripts.

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

;;; Cutom definitions

;; (defun notify-compilation-result(buffer msg)
;; "Notify that the compilation is finished,
;; close the *compilation* buffer if the compilation is successful,
;; and set the focus back to Emacs frame"
;; (if (string-match "^finished" msg)
;; (progn
;; (delete-windows-on buffer)
;; ;(tooltip-show "\n Compilation Successful :-) \n "))
;; )
;; ;(tooltip-show "\n Compilation Failed :-( \n "))
;; )
;; (setq current-frame (car (car (cdr (current-frame-configuration)))))
;; (select-frame-set-input-focus current-frame)
;; )
;; (add-to-list 'compilation-finish-functions
;; 'notify-compilation-result)


;;; TODO: ADD A EASIER GREP FUNCTION
;;; TODO: ADD A 80-COLUMNS COMMENT LINE  ;;;;;;;;; COMMENT ;;;;;;;;;

(defun dice-common (faces)
  "'Roll' a 'faces' dice."
  (+ (random faces) 1))

(defun dice-print (faces)
  (message (format "Dice%d: %d" faces (dice-common faces))))

(defun dice6()
  "'Roll' a 6-faces dice."
  (interactive)
  (dice-print 6))

(defun dice10()
  "'Roll' a 10-faces dice."
  (interactive)
  (dice-print 10))

(defun dice20()
  "'Roll' a 20-faces dice."
  (interactive)
  (dice-print 20))

(defun dice2x6()
  "'Roll' two 6-faces dices."
  (interactive)
  (message (format "Dice%d: %d - %d" 6 (dice-common 6) (dice-common 6))))

(defun test(&rest dices)
  (interactive)
  (let (msg)
    (setq msg (format "dices%s" (apply 'concat dices)))
    (message msg)))
(test "6" "6" "10" "20")



;;; Support for Kconfig file
(defvar kconfig-mode-font-lock-keywords

  '(("^[\t, ]*\\_<if\\_>" . font-lock-keyword-face)
    ("^[\t, ]*\\_<endif\\_>" . font-lock-keyword-face)
    ("^[\t, ]*\\_<endmenu\\_>" . font-lock-keyword-face)
    ("^[\t, ]*\\_<menu\\_>" . font-lock-keyword-face)
    ("^[\t, ]*\\_<choice\\_>" . font-lock-keyword-face)
    ("^[\t, ]*\\_<endchoice\\_>" . font-lock-keyword-face)

    ("^[\t, ]*\\_<config\\_>" . font-lock-function-name-face)
    ("^[\t, ]*\\_<menuconfig\\_>" . font-lock-function-name-face)
    ("^[\t, ]*\\_<comment\\_>" . font-lock-function-name-face)
    ("^[\t, ]*\\_<prompt\\_>" . font-lock-function-name-face)

    ("^[\t, ]*\\_<range\\_>" . font-lock-reference-face)
    ("^[\t, ]*\\_<depends on\\_>" . font-lock-reference-face)
    ("^[\t, ]*\\_<select\\_>" . font-lock-reference-face)
    ("^[\t, ]*\\_<help\\_>" . font-lock-reference-face)
    ("^[\t, ]*\\_<---help---\\_>" . font-lock-reference-face)
    ("^[\t, ]*\\_<default\\_>" . font-lock-reference-face)
    ("\\_<if\\_>" . font-lock-reference-face)

    ("^[\t, ]*\\_<source\\_>" . font-lock-preprocessor-face)

    ("^[\t, ]*\\_<bool\\_>" . font-lock-type-face)
    ("^[\t, ]*\\_<def_bool\\_>" . font-lock-type-face)
    ("^[\t, ]*\\_<int\\_>" . font-lock-type-face)
    ("^[\t, ]*\\_<hex\\_>" . font-lock-type-face)
    ("^[\t, ]*\\_<dir\\_>" . font-lock-type-face)
    ("^[\t, ]*\\_<mac\\_>" . font-lock-type-face)
    ("^[\t, ]*\\_<ip\\_>" . font-lock-type-face)
    ("^[\t, ]*\\_<boolean\\_>" . font-lock-type-face)
    ("^[\t, ]*\\_<tristate\\_>" . font-lock-type-face)
    ("^[\t, ]*\\_<string\\_>" . font-lock-type-face)

    ("\#.*" . font-lock-comment-face)
    ("\".*\"" . font-lock-string-face)
    ))

(define-derived-mode kconfig-mode text-mode

  "kconfig"
  (set (make-local-variable 'font-lock-defaults)
       '(kconfig-mode-font-lock-keywords t)))

(defun ask-before-closing ()
  "Ask whether or not to close, and then close if y was pressed"
  (interactive)
  (if (y-or-n-p (format "Are you sure you want to exit Emacs? "))
      (if (< emacs-major-version 22)
          (save-buffers-kill-terminal)
        (save-buffers-kill-emacs))
    (message "Canceled exit")))


;;; Flex and Bison mode
(autoload 'flex-mode "flex-mode")
(setq auto-mode-alist (cons '("\\.l$" . flex-mode) auto-mode-alist))

(autoload 'bison-mode "bison-mode.el")
(setq auto-mode-alist (cons '("\\.y$" . bison-mode) auto-mode-alist))

;; Consider the underscore as a punctuation
(require 'ld-script)
(modify-syntax-entry ?_ "." ld-script-mode-syntax-table)




(add-to-list 'load-path "~/.emacs.d/custom-site-lisp")
(require 'visible-mark)
(visible-mark-mode t)

(require 'doxymacs)
(defun my-doxymacs-font-lock-hook ()
  (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
      (doxymacs-font-lock)))
(add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)
(add-hook 'c-mode-common-hook'doxymacs-mode)


;; Magit
(when (file-exists-p "/usr/share/emacs/site-lisp/magit")
  (add-to-list 'load-path "/usr/share/emacs/site-lisp/magit"))


;; Elim/Garak (pidgin)
;; For DBus notifications, /usr/libexec/notification-daemon must be running
(add-to-list 'load-path "~/.emacs.d/elim-lisp/elisp")
(autoload 'garak "garak" nil t)
(setq elim-executable "~/.emacs.d/elim-lisp/elim-client")

(defun my-org-date ()
  "Insert current date yyyy-mm-dd."
  (interactive)
  (insert (format-time-string "<%Y-%m-%d>")))
