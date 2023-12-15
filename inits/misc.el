;;;; -*- lexical-binding: t; -*-
;;;; -------------
;;;; Miscellaneous
;;;; -------------



(defun font-lock-restart ()
  (interactive)
  (setq font-lock-mode-major-mode nil)
  (font-lock-ensure))

(add-to-list 'command-switch-alist
             '("(make-frame-visible)" . (lambda (s))))


;;; --------------------------
;;; Add Clipboard to kill ring
;;; --------------------------


(defadvice kill-new (before kill-new-push-xselection-on-kill-ring activate)
  "Before putting new kill onto the kill-ring, add the clipboard/external
selection to the kill ring."
  (let ((have-paste (and interprogram-paste-function
                         (funcall interprogram-paste-function))))
    (when have-paste (push have-paste kill-ring))))


;;; ------------------------------------------------------------------
;;; Sets { } as a delimiter pair in Lisp modes (fixes { } for paredit)
;;; ------------------------------------------------------------------


(modify-syntax-entry ?\[ "(]" lisp-mode-syntax-table)
(modify-syntax-entry ?\] ")[" lisp-mode-syntax-table)
(modify-syntax-entry ?\[ "(]" lisp-interaction-mode-syntax-table)
(modify-syntax-entry ?\] ")[" lisp-interaction-mode-syntax-table)
(modify-syntax-entry ?\[ "(]" emacs-lisp-mode-syntax-table)
(modify-syntax-entry ?\] ")[" emacs-lisp-mode-syntax-table)
(modify-syntax-entry ?\{ "(}" lisp-mode-syntax-table)
(modify-syntax-entry ?\} "){" lisp-mode-syntax-table)
(modify-syntax-entry ?\{ "(}" lisp-interaction-mode-syntax-table)
(modify-syntax-entry ?\} "){" lisp-interaction-mode-syntax-table)
(modify-syntax-entry ?\{ "(}" emacs-lisp-mode-syntax-table)
(modify-syntax-entry ?\} "){" emacs-lisp-mode-syntax-table)


;;; -------------------------
;;; Go to specified character
;;; -------------------------


(defun blink-to-char (arg char)
  "Move point past ARGth occurrence of CHAR."
  (interactive (list (prefix-numeric-value current-prefix-arg)
                     (read-char "Blink to char: " t)))
  (search-forward (char-to-string char) nil nil arg))

(defun blink-to-nth-char (arg char)
  "Move point past ARGth occurrence in the buffer of CHAR."
  (interactive (list (prefix-numeric-value current-prefix-arg)
                     (read-char "Blink to char: " t)))
  (save-excursion (beginning-of-buffer)
    (search-forward (char-to-string char) nil nil arg)))


;;; ----------------------
;;; File buffer operations
;;; ----------------------


(defmacro with-temp-file-buffer (file &rest body)
  "Executes BODY in a temporary buffer for FILE."
  `(with-temp-buffer
       (find-file ,file)
     ,@body
     (kill-this-buffer)))

(defun file-length (file)
  "Returns the length of FILE in chars. In other words, the (POINT-MAX) of
FILE."
  (let ((result 0))
    (with-temp-file-buffer file
      (setq result (point-max)))
    result))

(defun file-lines (file)
  "Returns the number of lines in FILE."
  (let ((result 0))
    (with-temp-file-buffer file
      (setq result
            (count-lines (point-min)
                         (point-max))))
    result))

(defun current-line-blank-p ()
  "Returns T if the current link is blank (containing only whitespace), and NIL
if not."
  (save-excursion
   (beginning-of-line)
   (and (skip-syntax-forward " ") (eolp))))

(defun count-blank-lines ()
  "Counts the number of blank lines in the current buffer."
  (let ((total 0))
    (save-excursion
     (goto-char (point-min))
     (cl-loop until (eobp) do
              (when (current-line-blank-p)
                (setq total (1+ total)))
              (forward-line 1)))
    total))

(defun file-blank-lines (file)
  "Returns the number of blank lines in FILE."
  (let ((result 0))
    (with-temp-file-buffer file
      (setq result (count-blank-lines)))
    result))


;;; --------------------------
;;; Insert license information
;;; --------------------------


(defun insert-license-header (license)
  "Inserts the header appropriate for LICENSE."
  (interactive (list (read-string "License name: " nil nil "MIT")))
  (cond (((string-equal license "X11")
          (setq license "MIT"))
         ((string-equal license "BSD")
          (setq license "BSD-3"))
         ((string-equal license "LGPL")
          (setq license "LGPLv3"))
         (t (upcase-word license))))
  (let ((filename (concat "~/licenses/" license))
        (beg (point-min))
        (end (file-length filename))
        (lines (file-lines filename))
        (blank-lines (file-blank-lines filename))
        (comment-chars 3)))
    (save-excursion
      (goto-char beg)
     (insert-file-contents filename t)
     (comment-region beg end comment-chars)))
