;;;; -------------------------
;;;; Basic Emacs Customization
;;;; -------------------------


(setq-default column-number-mode t
              indent-tabs-mode nil
              tab-width 8)

(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t
      default-directory "F:/home/"
      browse-url-browser-function 'eww
      tab-stop-list (number-sequence 4 120 4)
      server-auth-dir "C:/emacs/server")

(menu-bar-mode -1)

(tool-bar-mode -1)

(scroll-bar-mode -1)

(setf (symbol-function 'yes-or-no-p)
      (symbol-function 'y-or-n-p))
