;;;;  -*- lexical-binding: t; -*-
;;;; ------------------------------
;;;; Hunter Chandler's init.el File
;;;; for Configuration of GNU Emacs
;;;;       Started 2013-12-15
;;;; ------------------------------



(require 'package)

(mapc (lambda (item) (add-to-list 'package-archives item t))
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")
        ("melpa" . "https://melpa.org/packages/")
        ("elpy" . "https://jorgenschaefer.github.io/packages/")))

(let ((em-dir (expand-file-name user-emacs-directory)))
  (add-to-list 'load-path (concat em-dir "elpa"))
  (setq custom-file (concat em-dir "custom.el")))

(load custom-file)

(package-initialize)

(mapc (lambda (file) (load (concat "~/.emacs.d/initelcs/" file)))
      (seq-remove (lambda (x) (or (string= x ".") (string= x "..")))
                  (directory-files "~/.emacs.d/initelcs/")))

(mapc (lambda (file) (load (concat "~/.emacs.d/inits/" file)))
      (seq-remove (lambda (x)
                    (or (string= x ".") (string= x "..")
			(file-exists-p (concat "~/.emacs.d/initelcs/" x "c"))))
                  (directory-files "~/.emacs.d/inits/")))

;(enable-theme 'selenized-dark)
(load-theme 'doom-tokyo-night t)
