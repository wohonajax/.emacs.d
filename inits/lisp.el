;;;; -*- lexical-binding: t; -*-
;;;; --------------------------
;;;; Common Lisp & SLY Settings
;;;; --------------------------


(setq inferior-lisp-program "/usr/local/bin/sbcl"
      lisp-indent-function #'common-lisp-indent-function
      common-lisp-hyperspec-root "~/sbcl/HyperSpec")

(define-key lisp-mode-shared-map (kbd "C-c e") #'macrostep-expand)

(add-something-to-mode-hooks '(emacs-lisp lisp lisp-interaction scheme
			       sly-mode-hook)
			     #'rainbow-delimiters-mode)
