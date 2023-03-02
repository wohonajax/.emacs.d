;; -*- lexical-binding: t; -*-

(defun add-something-to-mode-hooks (mode-list something)
  "Helper function to add a callback to multiple hooks."
  (dolist (mode mode-list)
    (add-hook (intern (concat (symbol-name mode) "-mode-hook")) something)))
