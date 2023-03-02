;;;;-*- lexical-binding: t; -*-
;;;; -------------------------
;;;; Basic Emacs Customization
;;;; -------------------------


(setq-default column-number-mode t
              indent-tabs-mode nil
              tab-width 8)

(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t
      gc-cons-threshold 10000000
      default-directory "/mnt/sdb/home"
      browse-url-browser-function 'eww
      tab-stop-list (number-sequence 4 120 4))

(let ((dir "~/.emacs.d/backups/"))
  (unless (file-directory-p dir)
    (make-directory dir))
  (setq backup-directory-alist `(("." . ,dir))
        tramp-backup-directory-alist `((".*" . ,dir))))

(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-list
        try-expand-line
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))

(menu-bar-mode -1)

(tool-bar-mode -1)

(scroll-bar-mode -1)

(fset 'yes-or-no-p 'y-or-n-p)
