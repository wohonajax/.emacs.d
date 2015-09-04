;;;; ------------------------------
;;;; Hunter Chandler's init.el File
;;;; for Configuration of GNU Emacs
;;;;       Started 2013-12-15
;;;; ------------------------------


(defun load-init (file)
  "Loads the specified init file."
  (load (concat "~/.emacs.d/inits/"
		(downcase (symbol-name file))
		".el")))

(defun load-inits (file-list)
  "Loads the specified init files."
  (mapc #'load-init file-list))

(load-inits '(misc customize modes lisp keys))


;;; ------------------------
;;; Aesthetic customizations
;;; ------------------------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes nil)
 '(erc-modules
   (quote
    (autojoin button completion dcc fill irccontrols list match menu move-to-prompt netsplit networks noncommands readonly ring stamp track xdcc)))
 '(erc-nick "wohonajax")
 '(erc-nick-uniquifier "_")
 '(erc-user-full-name nil)
 '(face-font-family-alternatives
   (quote
    (("Consolas" "Monospace" "fixed")
     ("Consolas" "CMU Typewriter Text" "fixed")
     ("Sans Serif" "helv" "helvetica" "arial" "fixed")
     ("helv" "helvetica" "arial" "fixed"))))
 '(js3-auto-indent-p t)
 '(js3-curly-indent-offset 2)
 '(js3-enter-indents-newline t)
 '(js3-expr-indent-offset 2)
 '(js3-indent-on-enter-key t)
 '(js3-lazy-commas t)
 '(js3-lazy-dots t)
 '(js3-lazy-operators t)
 '(js3-paren-indent-offset 2)
 '(js3-square-indent-offset 2)
 '(quack-default-program "racket"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#090D0F" :foreground "#CACACA" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "outline" :family "Consolas"))))
 '(dired-symlink ((t (:inherit font-lock-keyword-face :foreground "#B894D1"))))
 '(erc-my-nick-face ((t (:foreground "#B894D1" :weight bold))) t)
 '(erc-notice-face ((t (:foreground "#4F579D" :weight bold))) t)
 '(erc-pal-face ((t (:foreground "medium slate blue" :weight bold))) t)
 '(erc-prompt-face ((t (:foreground "#B894D1" :weight bold))) t)
 '(erc-timestamp-face ((t (:foreground "#65656F" :weight bold))) t)
 '(font-lock-comment-face ((t (:foreground "#D63E34"))))
 '(font-lock-keyword-face ((t (:foreground "#B894D1"))))
 '(font-lock-string-face ((t (:foreground "#96C83B"))))
 '(font-lock-variable-name-face ((t (:foreground "#53BDB1" :weight bold))))
 '(highlight-numbers-number ((t (:foreground "#3090B5"))))
 '(link ((t (:foreground "#5FC0E9" :underline t))))
 '(link-visited ((t (:inherit link :foreground "#D98FCA"))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#AA88FF"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#FFAA88"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#FFAAFF"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#AAFFFF"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#FFFFAA"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#FFAAAA"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#AAAAFF"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#AAFFAA"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "#777777"))))
 '(rainbow-delimiters-unmatched-face ((t (:foreground "#DD2222")))))
