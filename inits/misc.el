;;;; -------------
;;;; Miscellaneous
;;;; -------------


(defun add-something-to-mode-hooks (mode-list something)
  "Helper function to add a callback to multiple hooks."
  (dolist (mode mode-list)
    (add-hook (intern (concat (symbol-name mode) "-mode-hook")) something)))


;;; --------------------------
;;; Add Clipboard to kill ring
;;; --------------------------


(defadvice kill-new (before kill-new-push-xselection-on-kill-ring activate)
  "Before putting new kill onto the kill-ring, add the clipboard/external selection to the kill ring"
  (let ((have-paste (and interprogram-paste-function
                         (funcall interprogram-paste-function))))
    (when have-paste (push have-paste kill-ring))))


;;; ------------------------------------------------------------------
;;; Sets { } as a delimiter pair in Lisp modes (fixes { } for paredit)
;;; ------------------------------------------------------------------


(modify-syntax-entry ?{ "(}" lisp-mode-syntax-table)
(modify-syntax-entry ?} "){" lisp-mode-syntax-table)
(modify-syntax-entry ?{ "(}" lisp-interaction-mode-syntax-table)
(modify-syntax-entry ?} "){" lisp-interaction-mode-syntax-table)
(modify-syntax-entry ?{ "(}" emacs-lisp-mode-syntax-table)
(modify-syntax-entry ?} "){" emacs-lisp-mode-syntax-table)
