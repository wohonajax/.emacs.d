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

(add-to-list 'load-path "~/.emacs.d/elpa")

(load "~/.emacs.d/custom.el")

(package-initialize)

(mapc (lambda (file) (load (concat "~/.emacs.d/initelcs/" file)))
      (seq-remove (lambda (x) (or (string= x ".") (string= x "..")))
                  (directory-files "~/.emacs.d/initelcs/")))

(mapc (lambda (file) (load (concat "~/.emacs.d/inits/" file)))
      (seq-remove (lambda (x)
                    (or (string= x ".") (string= x "..")
			(file-exists-p (concat "~/.emacs.d/initelcs/" x "c"))))
                  (directory-files "~/.emacs.d/inits/")))

(setq custom-file
      (concat (expand-file-name user-emacs-directory)
              "custom.el"))

(enable-theme 'selenized-dark)
