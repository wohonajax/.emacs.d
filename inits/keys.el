;;;;; -*- lexical-binding: t; -*-
;;;;; --------------------
;;;;; Keyboard Definitions
;;;;; --------------------


;;;; ---------
;;;; Functions
;;;; ---------

;;; autoindent newline on pressing enter
(global-set-key (kbd "RET") #'newline-and-indent)
;;; summon the scratch pad
(global-set-key (kbd "s-s") (lambda () (interactive)
                              (if (memq "*scratch*" (window-list))
                                  (switch-to-buffer "*scratch*"))))
;;; run SLY
(global-set-key (kbd "C-x H-s") #'sly)
;;; eval-buffer
(global-set-key (kbd "C-x M-e") #'eval-buffer)
;;; browse the HyperSpec
(global-set-key (kbd "C-x H-h")
                (lambda ()
                  (interactive)
                  (eww-open-file "~/HyperSpec/Front/X_Master.htm")))
;;; blink-to-char
(global-set-key (kbd "M-g M-c") #'blink-to-nth-char)
;;; kill this buffer
(global-set-key (kbd "C-x k") #'kill-this-buffer)

(global-set-key (kbd "C-M-c") #'save-buffers-kill-emacs)
;;; hippie-expand
(global-set-key (kbd "M-/") #'hippie-expand)



;;;; ------------------
;;;; Special Characters
;;;; ------------------



;;; much less than
(global-set-key (kbd "H-<") "≪")
;;; much greater than
(global-set-key (kbd "H->") "≫")
;;; left double angle quote
(global-set-key (kbd "C-<") "«")
;;; right double angle quote
(global-set-key (kbd "C->") "»")
;;; left angle quote
(global-set-key (kbd "s-`") "‹")
;;; right angle quote
(global-set-key (kbd "s-'") "›")
;;; left quotation mark
(global-set-key (kbd "H-`") "‘")
;;; right quotation mark
(global-set-key (kbd "H-'") "’")
;;; left double quote
(global-set-key (kbd "s-\"") "“")
;;; right double quote
(global-set-key (kbd "H-\"") "”")


;;;; -----------------
;;;; Key Redefinitions
;;;; -----------------

(define-key function-key-map [(capslock)] #'event-apply-hyper-modifier)

(when (eq system-type 'windows-nt)
  (setq w32-pass-lwindow-to-system nil
        w32-pass-rwindow-to-system nil
        w32-pass-apps-to-system nil
        w32-lwindow-modifier 'super
        w32-rwindow-modifier 'super
        w32-apps-modifier 'hyper))
