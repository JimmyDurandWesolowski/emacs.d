;;; elpa-modes.el  --- ELPA package customization.

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

(package-initialize)

(require 'back-button)
(back-button-mode 1)

(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'cl-lib)
(require 'bm)
(setq bm-cycle-all-buffers 1)
(set-face-background 'bm-face "DarkOliveGreen")
(set-face-foreground 'bm-face nil)
(add-hook 'kill-emacs-hook '(lambda nil
			      (bm-buffer-save-all)
			      (bm-repository-save)))


(require 'browse-kill-ring)
(global-set-key (kbd "C-c k") 'browse-kill-ring)

(when (require 'edit-server nil t)
  (setq edit-server-new-frame nil)
  (edit-server-start))

(require 'egg)
(set-face-foreground 'egg-diff-add "chartreuse")

(require 'xcscope)
(require 'emms-setup)
(require 'emms-player-mplayer)
(emms-standard)
(emms-default-players)
; (emms-devel)

(define-emms-simple-player mplayer-mp3 '(file url)
  "\\.[mM][pP][23]$" "mplayer")

(define-emms-simple-player mplayer-ogg '(file)
  (regexp-opt '(".ogg" ".OGG" ".FLAC" ".flac" )) "mplayer")

(define-emms-simple-player mplayer-video '(file url)
  (regexp-opt '(".ogg" ".mp3" ".wav" ".mpg" ".mpeg" ".wmv"
                ".wma" ".mov" ".avi" ".divx" ".ogm" ".asf"
                ".mkv" "http://")) "mplayer")

(setq emms-player-list '(emms-player-mplayer-mp3
                         emms-player-mplayer-ogg
                         emms-player-mplayer-playlist
                         emms-player-mplayer-video
                         emms-player-mplayer-list
                         ))
(setq emms-player-list '(emms-player-mpg321
                         emms-player-ogg123
                         emms-player-mplayer))

;; debug players
(emms-player-for '(*track* (type . file)
                          (name . "myfile.pls")))

(global-set-key (kbd "C--") 'emms-volume-lower)
(global-set-key (kbd "C-=") 'emms-volume-raise)
(global-set-key (kbd "C-c e <up>") 'emms-start)
(global-set-key (kbd "C-c e <down>") 'emms-stop)
(global-set-key (kbd "C-c e <left>") 'emms-previous)
(global-set-key (kbd "C-c e <right>") 'emms-next)
(global-set-key (kbd "C-c e SPC") 'emms-pause)

(require 'emms-mode-line)
(emms-mode-line 1)
(require 'emms-playing-time)
(emms-playing-time 1)
(emms-playing-time-enable-display)

;; (defun emms-playing-time-display ()
;;   "Display playing time on the mode line."
;;   (setq emms-playing-time (round (1+ emms-playing-time)))
;;   (setq emms-playing-time-string "")
;;   (when emms-playing-time-display-p
;;     (let* ((min (/ emms-playing-time 60))
;;            (sec (% emms-playing-time 60))
;;            (total-playing-time
;;             (or (emms-track-get
;;                  (emms-playlist-current-selected-track)
;;                  'info-playing-time)
;;                 0))
;;            (total-min-only (/ total-playing-time 60))
;;            (total-sec-only (% total-playing-time 60)))
;;       (case emms-playing-time-style
;;         ((bar)                          ; `bar' style
;;          (if (zerop total-playing-time)
;;              (setq emms-playing-time-string "[==>........]")
;;            (let ((progress "[")
;;                  ;; percent based on 10
;;                  (percent (/ (* emms-playing-time 10) total-playing-time)))
;;              (dotimes (i percent)
;;                (setq progress (concat progress "=")))
;;              (setq progress (concat progress ">"))
;;              (dotimes (i (- 10 percent))
;;                (setq progress (concat progress " ")))
;;              (setq progress (concat progress "]"))
;;              (setq emms-playing-time-string progress))))
;;         (t                              ; `time' style
;;          (setq emms-playing-time-string
;;                (emms-replace-regexp-in-string
;;                 " " "0"
;;                 (if (or emms-playing-time-display-short-p
;;                         ;; unable to get total playing-time
;;                         (eq total-playing-time 0))
;;                     (format "%2d:%2d" min sec)
;;                   (format "%2d:%2d/%2s:%2s"
;;                           min sec total-min-only total-sec-only))))))
;;       (setq emms-playing-time-string
;;             (format emms-playing-time-display-format
;;                     emms-playing-time-string))))
;;   (force-mode-line-update))



;; gimme		     2
;; The XMMS2 interface we all love! Check out http://gimmeplayer.org for more info.



;; google-weather     20110930
;; Fetch Google Weather forecasts. [source: git]



;; iedit		     20121208
;; Edit multiple regions in the same way simultaneously. [source: github]



;; list-utils	     20121205
;; List-manipulation utility functions [source: github]



;; multi-term	     20130108
;; Managing multiple terminal buffers in Emacs. [source: wiki]



;; nav-flash	     20121205
;; Briefly highlight the current line [source: github]



;; notify	     2010.8.
;; notification front-end



;; pcache	     20120408
;; persistent caching for Emacs [source: github]



;; persistent-soft    20121205
;; Persistent storage, returning nil on failure [source: github]



;; smartrep	     20120905
;; Support sequential operation which omitted prefix keys. [source: github]



;; todochiku	     20120202
;; A mode for interfacing with Growl, Snarl, and the like. [source: wiki]



;; ucs-utils	     20121205
;; Utilities for Unicode characters [source: github]



;; undo-tree	     20121124
;; Treat undo history as a tree [source: git]



;; visible-color-code 0.0
;; color code strings in current buffer, this elisp show you one as real color.
;; (add-to-list 'load-path "~/.emacs.d/elpa/visible-color-code-0.0.1")
;; (require 'visible-color-code)



;; weather	     2012.3.2
;; Get weather reports via worldweatheronline.com



;; workgroups	     20110724
;; workgroups for windows (for Emacs) [source: github]
;; (add-to-list 'load-path "~/.emacs.d/elpa/workgroups-20110724.1825")
;; (require 'workgroups)
;; (setq wg-prefix-key (kbd "C-c w"))
;; (workgroups-mode 1)

;; TODO entry automatically changed to DONE when all children are done
;; http://orgmode.org/manual/Breaking-down-tasks.html#Breaking-down-tasks
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

(setq org-todo-keywords '((sequence "TODO" "PENDING" "|" "DONE" "CANCELED")))
(setq org-todo-keyword-faces
      '(("TODO" . org-warning)
	("PENDING" . (:foreground "yellow" :weight bold))
	("CANCELED" . (:foreground "DarkGrey" :weight bold))))

;; Uniquify, to name identical buffers with an unique name
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Cscope
;; (require 'xcscope)
;; (setq cscope-do-not-update-database t)

;; Org mode
(require 'org-install)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-files (list "~/org/ssdk2.org"
			     "~/org/personal.org"))
(setq calendar-week-start-day 1)

;;; WINNER MODE ;;;
; (winner-mode 1)
