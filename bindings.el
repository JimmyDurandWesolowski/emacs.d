;;; bindings.el  --- Custom key binding for Emacs.

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

;;; KEYBOARD SHORTCUTS ;;;
(defvar binding-minor-mode-map (make-keymap) "binding-minor-mode keymap.")
(define-key binding-minor-mode-map (kbd "C-x <up>") 'windmove-up)
(define-key binding-minor-mode-map (kbd "C-x <down>") 'windmove-down)
(define-key binding-minor-mode-map (kbd "C-x <left>") 'windmove-left)
(define-key binding-minor-mode-map (kbd "C-x <right>") 'windmove-right)

(define-key binding-minor-mode-map (kbd "C-x C-<up>") 'windmove-up)
(define-key binding-minor-mode-map (kbd "C-x C-<down>") 'windmove-down)
(define-key binding-minor-mode-map (kbd "C-x C-<left>") 'windmove-left)
(define-key binding-minor-mode-map (kbd "C-x C-<right>") 'windmove-right)

(define-key binding-minor-mode-map (kbd "<s-up>") 'windmove-up)
(define-key binding-minor-mode-map (kbd "<s-down>") 'windmove-down)
(define-key binding-minor-mode-map (kbd "<s-left>") 'windmove-left)
(define-key binding-minor-mode-map (kbd "<s-right>") 'windmove-right)

(define-key binding-minor-mode-map (kbd "s-f") 'find-file-other-frame)
(define-key binding-minor-mode-map (kbd "s-b") 'switch-to-buffer-other-frame)
(define-key binding-minor-mode-map (kbd "s-x") 'delete-frame)

(define-key binding-minor-mode-map (kbd "C-c C-g") `goto-line)

(define-key binding-minor-mode-map (kbd "<C-f1>") `find-grep-dired)
(define-key binding-minor-mode-map (kbd "<C-f2>") `find-dired)
(define-key binding-minor-mode-map (kbd "<C-f9>") `recompile)

(define-key binding-minor-mode-map (kbd "C-c C-c") 'comment-or-uncomment-region)

(define-key binding-minor-mode-map (kbd "DEL") 'backward-delete-char)

(define-key binding-minor-mode-map (kbd "<C-kp-8>") 'shrink-window)
(define-key binding-minor-mode-map (kbd "<C-kp-4>") 'shrink-window-horizontally)
(define-key binding-minor-mode-map (kbd "<C-kp-6>") 'enlarge-window-horizontally)
(define-key binding-minor-mode-map (kbd "<C-kp-2>") 'enlarge-window)

(define-key binding-minor-mode-map (kbd "M-<mouse-4>") 'text-scale-increase)
(define-key binding-minor-mode-map (kbd "M-<mouse-5>") 'text-scale-decrease)

(define-key binding-minor-mode-map (kbd "C-c c") 'clipboard-kill-ring-save)

;; ff-find-other-file allows to switch between a header and its implementation
(define-key binding-minor-mode-map (kbd "C-c q") 'ff-find-other-file)

;; Regex builder to interactively create regex
(define-key binding-minor-mode-map (kbd "C-c r") 're-builder)

(define-key binding-minor-mode-map (kbd "C-c <left>") 'back-button-local-forward)
(define-key binding-minor-mode-map (kbd "C-c <right>") 'back-button-local-backward)
(define-key binding-minor-mode-map (kbd "C-c <C-left>") 'back-button-global-forward)
(define-key binding-minor-mode-map (kbd "C-c <C-right>") 'back-button-global-backward)

;; Bookmarks management
(define-key binding-minor-mode-map (kbd "C-c C-SPC") 'bookmark-set)
(define-key binding-minor-mode-map (kbd "C-c j") 'bookmark-jump)

;; Visual bookmarks management
(define-key binding-minor-mode-map (kbd "C-c l") 'bm-show)
(define-key binding-minor-mode-map (kbd "C-c SPC") 'bm-toggle)
(define-key binding-minor-mode-map (kbd "C-p") 'bm-next)
(define-key binding-minor-mode-map (kbd "C-o") 'bm-previous)

(define-key binding-minor-mode-map (kbd "C-r") 'isearch-backward)
(define-key binding-minor-mode-map (kbd "C-s") 'isearch-forward)
(define-key binding-minor-mode-map (kbd "C-S-r") 'isearch-backward-regexp)
(define-key binding-minor-mode-map (kbd "C-S-s") 'isearch-forward-regexp)

(define-key binding-minor-mode-map (kbd "C-c b") 'buffer-menu)

(define-key binding-minor-mode-map (kbd "C-c s s") 'cscope-find-this-symbol)
(define-key binding-minor-mode-map (kbd "C-c s d") 'cscope-find-global-definition)
(define-key binding-minor-mode-map (kbd "C-c s t") 'cscope-find-this-text-string)
(define-key binding-minor-mode-map (kbd "C-c s c") 'cscope-find-functions-calling-this-function)
(define-key binding-minor-mode-map (kbd "C-c s C") 'cscope-find-called-functions)
(define-key binding-minor-mode-map (kbd "C-c s i") 'cscope-find-files-including-file)
(define-key binding-minor-mode-map (kbd "C-c s /") 'cscope-set-initial-directory)
(define-key binding-minor-mode-map (kbd "C-c s u") 'cscope-pop-mark)
(define-key binding-minor-mode-map (kbd "C-c s p") 'cscope-prev-symbol)
(define-key binding-minor-mode-map (kbd "C-c s n") 'cscope-next-symbol)

(define-key binding-minor-mode-map (kbd "C-c t") 'egg-file-toggle-blame-mode)


(define-minor-mode binding-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " binding" 'binding-minor-mode-map)

(binding-minor-mode 1)
