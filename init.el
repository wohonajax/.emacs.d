;;;; ------------------------------
;;;; Hunter Chandler's init.el File
;;;; for Configuration of GNU Emacs
;;;;       Started 2013-12-15
;;;; ------------------------------



(require 'package)

(mapc (lambda (x)
        (add-to-list 'package-archives x t))
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("elpy" . "https://jorgenschaefer.github.io/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

(defun add-something-to-mode-hooks (mode-list something)
  "Helper function to add a callback to multiple hooks."
  (dolist (mode mode-list)
    (add-hook (intern (concat (symbol-name mode) "-mode-hook")) something)))
(byte-compile-fdefinition 'add-something-to-mode-hooks nil)

(defun byte-compile-maybe-init (filename)
  (if (string-prefix-p "~/.emacs.d/inits/" filename)
      (concat (subseq filename 0 15) "elcs/"
              (subseq filename 17) "c")
      (if (string-prefix-p "f:/home/.emacs.d/inits/")
          (concat (subseq filename 0 21) "elcs/"
                  (subseq filename 23) "c")
          (concat filename "c"))))
(byte-compile-fdefinition 'byte-compile-maybe-init nil)

(mapc (lambda (file) (load (concat "~/.emacs.d/initelcs/" file)))
      (cl-remove-if (lambda (x)
                      (or (string= x ".") (string= x "..")))
                    (directory-files "~/.emacs.d/initelcs/")))
(mapc (lambda (file)
        (unless (file-exists-p (concat "~/.emacs.d/initelcs" file "c"))
          (load (concat "~/.emacs.d/inits/" file))))
      (cl-remove-if (lambda (x)
                      (or (string= x ".") (string= x "..")))
                    (directory-files "~/.emacs.d/inits/")))




;;; ------------------------
;;; Aesthetic Customizations
;;; ------------------------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(byte-compile-dest-file-function 'byte-compile-maybe-init)
 '(company-idle-delay 0.5)
 '(custom-enabled-themes '(sanityinc-solarized-light sanityinc-solarized-dark))
 '(custom-safe-themes
   '("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default))
 '(erc-modules
   '(autojoin button completion dcc fill irccontrols list match menu move-to-prompt netsplit networks noncommands readonly ring stamp track xdcc))
 '(erc-nick "wohonajax")
 '(erc-nick-uniquifier "_")
 '(erc-user-full-name nil)
 '(face-font-family-alternatives
   '(("Consolas" "Monospace" "fixed")
     ("Consolas" "CMU Typewriter Text" "fixed")
     ("Sans Serif" "helv" "helvetica" "arial" "fixed")
     ("helv" "helvetica" "arial" "fixed")))
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
   '(wanderlust rainbow-delimiters slime paredit dropbox flycheck ein py-autopep8 elpy))
 '(quack-default-program "racket")
 '(resize-mini-windows t)
 '(smtpmail-default-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 587)
 '(smtpmail-stream-type 'ssl)
 '(user-full-name "Hunter Chandler")
 '(user-mail-address "wohonajax@gmail.com")
 '(warning-suppress-log-types '((server) (server)))
 '(warning-suppress-types '((server))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#002b36" :foreground "#839496" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "outline" :family "Consolas"))))
 '(dired-symlink ((t (:inherit font-lock-keyword-face :foreground "#B894D1"))))
 '(erc-my-nick-face ((t (:foreground "#B894D1" :weight bold))) t)
 '(erc-notice-face ((t (:foreground "#4F579D" :weight bold))) t)
 '(erc-pal-face ((t (:foreground "medium slate blue" :weight bold))) t)
 '(erc-prompt-face ((t (:foreground "#B894D1" :weight bold))) t)
 '(erc-timestamp-face ((t (:foreground "#65656F" :weight bold))) t)
 '(error ((t (:foreground "#FFFF4F" :weight bold))))
 '(font-lock-comment-face ((t (:foreground "#D66E64"))))
 '(font-lock-fic-author-face ((t (:background "black" :foreground "orangered" :underline t))))
 '(font-lock-fic-face ((t (:background "black" :foreground "peru" :weight bold))))
 '(font-lock-keyword-face ((t (:foreground "#905090"))))
 '(font-lock-string-face ((t (:foreground "#96C83B"))))
 '(font-lock-variable-name-face ((t (:foreground "#53BDB1" :weight bold))))
 '(font-lock-warning-face ((t (:inherit error))))
 '(highlight-numbers-number ((t (:foreground "#3090B5"))))
 '(link ((t (:foreground "cornflower blue" :underline t))))
 '(link-visited ((t (:inherit link :foreground "navy"))))
 '(show-paren-match ((t (:background "black" :foreground "#9feac5" :inverse-video t)))))
