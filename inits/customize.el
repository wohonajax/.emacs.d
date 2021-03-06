;;;; -------------------------
;;;; Basic Emacs Customization
;;;; -------------------------


(setq-default column-number-mode t)

(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t
      default-directory "F:/home/"
      browse-url-browser-function 'eww)

(menu-bar-mode -1)

(tool-bar-mode -1)

(scroll-bar-mode -1)

(global-linum-mode 1)

(setf (symbol-function 'yes-or-no-p)
      (symbol-function 'y-or-n-p))
