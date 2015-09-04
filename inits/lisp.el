;;;; ----------------------------
;;;; Common Lisp & SLIME Settings
;;;; ----------------------------


(setq inferior-lisp-program "C:/sbcl/sbcl"
      lisp-indent-function 'common-lisp-indent-function
      slime-complete-symbol-function 'slime-fuzzy-complete-symbol
      slime-startup-animation t
      common-lisp-hyperspec-root "C:/sbcl/HyperSpec")
