;; -*- lexical-binding: t; -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(byte-compile-dest-file-function 'byte-compile-maybe-init)
 '(company-idle-delay 0.5)
 '(custom-enabled-themes nil)
 '(custom-file "~/.emacs.d/custom.el")
 '(custom-safe-themes '(default))
 '(default-frame-alist '((font . "Consolas-10") (width . 84)))
 '(erc-modules
   '(autojoin button completion dcc fill irccontrols list match menu move-to-prompt netsplit networks noncommands readonly ring stamp track xdcc))
 '(erc-nick "wohonajax")
 '(erc-nick-uniquifier "1")
 '(erc-user-full-name nil)
 '(face-font-family-alternatives
   '(("Consolas" "Hack" "Monospace" "fixed")
     ("Consolas" "Hack" "CMU Typewriter Text" "fixed")
     ("Open Sans" "helv" "helvetica" "arial" "fixed")
     ("Open Sans" "helv" "helvetica" "arial" "fixed")))
 '(ispell-dictionary nil)
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
 '(package-selected-packages
   '(sly-macrostep amx ido-completing-read+ helm slime offlineimap paredit sly wanderlust rainbow-delimiters dropbox flycheck ein py-autopep8 elpy))
 '(quack-default-program "racket")
 '(read-mail-command 'mu4e)
 '(resize-mini-windows t)
 '(smtpmail-default-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 587)
 '(user-full-name "Hunter Chandler")
 '(user-mail-address "wohonajax@gmail.com")
 '(warning-suppress-log-types '((server) (server)))
 '(warning-suppress-types '((server))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#103c48" :foreground "#adbcbc" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :foundry "Microsoft" :family "Consolas"))))
 '(dired-symlink ((t (:inherit nil :foreground "#B894D1"))))
 '(erc-my-nick-face ((t (:foreground "#B894D1" :weight bold))))
 '(erc-notice-face ((t (:foreground "#4F579D" :weight bold))))
 '(erc-pal-face ((t (:foreground "medium slate blue" :weight bold))))
 '(erc-prompt-face ((t (:foreground "#B894D1" :weight bold))))
 '(erc-timestamp-face ((t (:foreground "#65656F" :weight bold))))
 '(error ((t (:foreground "#FFFF4F" :weight bold))))
 '(font-lock-comment-face ((t nil)))
 '(font-lock-fic-author-face ((t (:background "black" :foreground "orangered" :underline t))))
 '(font-lock-fic-face ((t (:background "black" :foreground "peru" :weight bold))))
 '(font-lock-keyword-face ((t nil)))
 '(font-lock-string-face ((t nil)))
 '(font-lock-variable-name-face ((t nil)))
 '(font-lock-warning-face ((t nil)))
 '(highlight-numbers-number ((t (:foreground "#72898f" :weight normal))))
 '(link ((t (:foreground "cornflower blue" :underline t))))
 '(link-visited ((t (:inherit link :foreground "navy"))))
 '(show-paren-match ((t nil)))
 '(show-paren-match-expression ((t nil))))
