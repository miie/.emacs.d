;;; todo-list-mode.el -- Major mode for highlighting a numbered todo list.

;; Copyright (C) 2009 Billy Lamberta

;; Author: Billy Lamberta <billy@lamberta.org>
;; Created: Jan 2009
;; Keywords: todo
;; URL: http://www.lamberta.org/blog/todo-list-mode
;; $Revision: 0.01 $

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Description:

;; Major mode for highlighting a numbered todo list.

;; This is a simple mode that uses a number of regexp's to
;; determine the color of a particular line based on the assigned
;; priority number.

;; The format for a given line is:
;; number (0-4), [optional lower case letter], tab, task text
;; It will also recognize hash style comments to the end of the line.

;; Example:
;; 0  This is a header line that will always be on top.
;; 1  Run around the block.
;; 1  Wash behind my ears.
;; 2a Learn some more Lisp.
;; 2b Fly a kite.
;; 3  Say I'm sorry.
;; 4  Peace to all mankind.

;; Faces are defined in this file below. Feel free to add more or
;; change the colors to suit your own style.

;; Sort on the assigned priority number:
;; Select a region (C-x h for entire buffer), M-x sort-lines

;;; Code:

(setq todo-list-highlight-regexps '(
   ;;regexp keyword matches:
   ;;beg line|number|letter?|tab|any char|any chars|end line
   ("^\#[a-z]? .*$" 0 todo-list-comment-face t)
   ("^0[a-z]? .*$" 0 todo-list-zero-face t)
   ("^1[a-z]? .*$" 0 todo-list-one-face t)
   ("^2[a-z]? .*$" 0 todo-list-two-face t)
   ("^3[a-z]? .*$" 0 todo-list-three-face t)
   ("^4[a-z]? .*$" 0 todo-list-four-face t)
   ("^A[a-z]? .*$" 0 todo-list-annual-face t)
   ("^D[a-z]? .*$" 0 todo-list-dream-face t)
   ("^L[a-z]? .*$" 0 todo-list-life-face t)
   ("^X .*$"0	todo-list-complete-face t)
;;   ("#.*$" 0 font-lock-comment-face t)
   ("#[\-_A-Za-z0-9]+" 0 todo-list-hashtag-face t)
))

(define-derived-mode todo-list-mode fundamental-mode
  "todo-list-mode"
  "Major mode for syntax color highlighting of a numbered todo list."

  (setq font-lock-defaults '(todo-list-highlight-regexps))
)

;;
;; MS changes
;;

(defun ms-insert-new-line-at-bottom ()
  (interactive)
  (goto-char (point-max))
  (newline))

(defun ms-insert-new-todo (todo-txt)
  (interactive "sNew todo: ")
  (save-excursion
    (ms-insert-new-line-at-bottom)
    (insert todo-txt)
    (ms-mark-all-and-sort)))

(local-set-key "\C-ci" 'ms-insert-new-todo)

;;
;;define custom faces for todo-list mode
;;
(defface todo-list-comment-face'(
  (((class color) (background dark))	(:foreground "#00ff00" :bold t))
  (((class color) (background light))	(:foreground "#00ff00" :bold t))
  (t (:bold t :italic t)))
  "Todo-List mode face used for comments (#)."
  :group 'todo-list-mode-highlighting-faces)
(defvar todo-list-comment-face 'todo-list-comment-face
  "Todo-List mode face used for comments (#).")

(defface todo-list-zero-face'(
  (((class color) (background dark)) (:foreground "dark grey" :slant italic))
  (((class color) (background light)) (:foreground "black" :slant italic))
  (t (:bold t :italic t)))
  "Todo-List mode face used for level 0 task."
  :group 'todo-list-mode-highlighting-faces)
(defvar todo-list-zero-face 'todo-list-zero-face
  "Todo-List mode face used for level 0 task.")

(defface todo-list-one-face'(
  (((class color) (background dark))	(:foreground "Red"))
  (((class color) (background light))	(:foreground "Red"))
  (t (:bold t :italic t)))
  "Todo-List mode face used for level 1 task."
  :group 'todo-list-mode-highlighting-faces)
(defvar todo-list-one-face 'todo-list-one-face
  "Todo-List mode face used for level 1 task.")

(defface todo-list-two-face'(
  (((class color) (background dark))	(:foreground "IndianRed1"))
  (((class color) (background light))	(:foreground "Red3"))
  (t (:bold t :italic t)))
  "Todo-List mode face used for level 2 task."
  :group 'todo-list-mode-highlighting-faces)
(defvar todo-list-two-face 'todo-list-two-face
  "Todo-List mode face used for level 2 task.")

(defface todo-list-three-face'(
  (((class color) (background dark))	(:foreground "white"))
  (((class color) (background light))	(:foreground "white"))
  (t (:bold t :italic t)))
  "Todo-List mode face used for level 3 task."
  :group 'todo-list-mode-highlighting-faces)
(defvar todo-list-three-face 'todo-list-three-face
  "Todo-List mode face used for level 3 task.")

(defface todo-list-four-face'(
  (((class color) (background dark))	(:foreground "grey60"))
  (((class color) (background light))	(:foreground "grey60"))
  (t (:bold t :italic t)))
  "Todo-List mode face used for level 4 task."
  :group 'todo-list-mode-highlighting-faces)
(defvar todo-list-four-face 'todo-list-four-face
  "Todo-List mode face used for level 4 task.")

(defface todo-list-annual-face'(
  (((class color) (background dark))	(:foreground "#00ff00" :bold t))
  (((class color) (background light))	(:foreground "#00ff00" :bold t))
  (t (:bold t :italic t)))
  "Todo-List mode face used for annual level task."
  :group 'todo-list-mode-highlighting-faces)
(defvar todo-list-annual-face 'todo-list-annual-face
  "Todo-List mode face used for annual level task.")

(defface todo-list-dream-face'(
  (((class color) (background dark))	(:foreground "#00ff00" :italic t))
  (((class color) (background light))	(:foreground "#00ff00" :italic t))
  (t (:bold t :italic t)))
  "Todo-List mode face used for dream level task."
  :group 'todo-list-mode-highlighting-faces)
(defvar todo-list-dream-face 'todo-list-dream-face
  "Todo-List mode face used for dream level task.")

(defface todo-list-life-face'(
  (((class color) (background dark))	(:foreground "#00ff00"))
  (((class color) (background light))	(:foreground "#00ff00"))
  (t (:bold t :italic t)))
  "Todo-List mode face used for life task."
  :group 'todo-list-mode-highlighting-faces)
(defvar todo-list-life-face 'todo-list-life-face
  "Todo-List mode face used for life task.")

(defface todo-list-complete-face'(
  (((class color) (background dark))	(:foreground "gray22"))
  (((class color) (background light))	(:foreground "gray75"))
  (t (:bold t :italic t)))
  "Todo-List mode face used for completed task."
  :group 'todo-list-mode-highlighting-faces)
(defvar todo-list-complete-face 'todo-list-complete-face
  "Todo-List mode face used for completed task.")

(defface todo-list-hashtag-face'(
  (((class color) (background dark))	(:foreground "#4186be" :underline t))
  (((class color) (background light))	(:foreground "#4186be" :underline t))
  (t (:bold t :italic t :underline t)))
  "Todo-List mode face used by hashtags."
  :group 'todo-list-mode-highlighting-faces)
(defvar todo-list-hashtag-face 'todo-list-hashtag-face
  "Todo-List mode face used by hashtags.")


(provide 'todo-list-mode)