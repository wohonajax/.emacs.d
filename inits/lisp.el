;;;; -*- lexical-binding: t; -*-
;;;; ----------------------------
;;;; Common Lisp & SLIME Settings
;;;; ----------------------------


(setq inferior-lisp-program "/usr/local/bin/sbcl"
      lisp-indent-function #'common-lisp-indent-function
      common-lisp-hyperspec-root "~/sbcl/HyperSpec"
      slime-lisp-implementations
      '((sbcl ("sbcl" "--core" "/usr/local/lib/sbcl/sbcl.core")))
      slime-autodoc-use-multiline-p t)

(require 'slime-autoloads)
(slime-setup '(slime-fancy))

(add-hook 'slime-mode-hook 'slime-highlight-edits-mode)

(global-set-key "\C-cs" #'slime-selector)
(global-set-key "\C-cf" #'slime-open-system)

(define-key lisp-mode-shared-map (kbd "C-c e") #'macrostep-expand)

(add-something-to-mode-hooks '(emacs-lisp lisp lisp-interaction scheme
			       slime-mode-hook)
			     #'rainbow-delimiters-mode)
