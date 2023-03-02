;;;; -*- lexical-binding: t; -*-
;;;; ---------------------
;;;; Windows Customization
;;;; ---------------------

(when (eq system-type 'windows-nt)
  (mapc (lambda (x) (add-to-list 'exec-path x))
        '("c:/Program Files (x86)/Git/bin"
          "c:/Program Files (x86)/Git/mingw32/bin"))
  (setenv "PATH" (concat "C:/Program Files (x86)/Git/bin;"
                         "C:/Program Files (x86)/Git/mingw32/bin;"
                         (getenv "PATH"))))
