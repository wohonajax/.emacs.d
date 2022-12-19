;;;; ----------------------------
;;;; Common Lisp & SLIME Settings
;;;; ----------------------------


(setq inferior-lisp-program "C:/sbcl/sbcl"
      lisp-indent-function #'common-lisp-indent-function
      slime-company-completion 'fuzzy
      common-lisp-hyperspec-root "C:/sbcl/HyperSpec"
         slime-lisp-implementations
         '((sbcl ("sbcl" "--core" "C:/sbcl/slime.core")))
      slime-autodoc-use-multiline-p t)

(add-hook 'slime-mode-hook 'slime-highlight-edits-mode)

(global-set-key "\C-cs" #'slime-selector)
(global-set-key "\C-cf" #'slime-open-system)

(define-key lisp-mode-shared-map (kbd "C-c e") #'macrostep-expand)

(add-something-to-mode-hooks '(emacs-lisp lisp lisp-interaction scheme
			       slime-mode-hook slime)
			     #'rainbow-delimiters-mode)
