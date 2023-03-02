;;;; -*- lexical-binding: t; -*-
;;;; -------------------
;;;; ParEdit Adjustments
;;;; -------------------


(add-hook 'slime-repl-mode-hook (lambda () (paredit-mode 1)))
(add-something-to-mode-hooks '(emacs-lisp ielm lisp lisp-interaction scheme)
                             #'enable-paredit-mode)
;; Stop SLIME's REPL from grabbing DEL,
;; which is annoying when backspacing over a '('
(defun override-slime-repl-bindings-with-paredit ()
  (define-key slime-repl-mode-map
    (read-kbd-macro paredit-backward-delete-key) nil))
(add-hook 'slime-repl-mode-hook #'override-slime-repl-bindings-with-paredit)

(defun paredit-barf-all-the-way-backward ()
  (interactive)
  (paredit-split-sexp)
  (paredit-backward-down)
  (paredit-splice-sexp))

(defun paredit-barf-all-the-way-forward ()
  (interactive)
  (paredit-split-sexp)
  (paredit-forward-down)
  (paredit-splice-sexp)
  (when (eolp) (delete-horizontal-space)))

(defun paredit-slurp-all-the-way-backward ()
  (interactive)
  (catch 'done
    (while (not (bobp))
      (save-excursion
        (paredit-backward-up)
        (when (eq (char-before) ?\()
          (throw 'done t)))
      (paredit-backward-slurp-sexp))))

(defun paredit-slurp-all-the-way-forward ()
  (interactive)
  (catch 'done
    (while (not (eobp))
      (save-excursion
        (paredit-forward-up)
        (when (eq (char-after) ?\))
          (throw 'done t)))
      (paredit-forward-slurp-sexp))))

(defun paredit-forward-inject ()
  (interactive)
  (save-excursion
    (paredit-forward-down)
    (paredit-backward-slurp-sexp)))

(defun paredit-backward-inject ()
  (interactive)
  (save-excursion
    (paredit-backward-down)
    (paredit-forward-slurp-sexp)))

(defun paredit-inject-in-front ()
  (interactive)
  (catch 'done
    (while (not (bobp))
      (when (or (eq (char-after) ?\()
                (eq (char-after (1+ (point))) ?\())
        (throw 'done t))
      (paredit-forward-inject))))

(defun paredit-inject-in-end ()
  (interactive)
  (catch 'done
    (while (not (eobp))
      (when (or (eq (char-before) ?\))
                (eq (char-before (1- (point))) ?\)))
        (throw 'done t))
      (paredit-backward-inject))))

;; (eval-after-load 'paredit
;;   (progn
;;     (nconc paredit-commands
;; 	   '("Extreme Barfage, Slurpage, Injection"
;;              (("C-M-)")
;; 	      paredit-slurp-all-the-way-forward
;; 	      ("(foo (bar |baz) quux zot)"
;; 	       "(foo (bar |baz quux zot))")
;; 	      ("(a b ((c| d)) e f)"
;; 	       "(a b ((c| d)) e f)"))
;;              (("C-M-}" "M-F")
;; 	      paredit-barf-all-the-way-forward
;; 	      ("(foo (bar |baz quux) zot)"
;; 	       "(foo (bar|) baz quux zot)"))
;;              (("C-M-]")
;; 	      paredit-inject-in-end
;; 	      ("(foo (bar baz) quux| zot)"
;; 	       "(foo (bar baz quux|) zot)"))
;;              (("C-M-(")
;; 	      paredit-slurp-all-the-way-backward
;; 	      ("(foo bar (baz| quux) zot)"
;; 	       "((foo bar baz| quux) zot)")
;; 	      ("(a b ((c| d)) e f)"
;; 	       "(a b ((c| d)) e f)"))
;;              (("C-M-{" "M-B")
;; 	      paredit-barf-all-the-way-backward
;; 	      ("(foo (bar baz |quux) zot)"
;; 	       "(foo bar baz (|quux) zot)"))
;;              (("C-M-[")
;; 	      paredit-inject-in-front
;; 	      ("(foo |bar (baz quux) zot)"
;; 	       "(foo |(bar baz quux) zot)"))
;;              (("M-[")
;; 	      paredit-forward-inject
;; 	      ("(foo| bar (baz quux) zot)"
;; 	       "(foo| (bar baz quux) zot)"))
;;              (("M-]")
;; 	      paredit-backward-inject
;; 	      ("(foo (bar baz) quux |zot)"
;; 	       "(foo (bar baz quux) |zot)"))))
;;     (paredit-define-keys)
;;     (paredit-annotate-mode-with-examples)
;;     (paredit-annotate-functions-with-examples)))
