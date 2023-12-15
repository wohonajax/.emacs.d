;; -*- lexical-binding: t; -*-

(setq send-mail-function 'smtpmail-send-it
      message-send-mail-function 'smtpmail-send-it
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      smtpmail-stream-type 'starttls)

(defun auto-fill-mode-off ()
  (auto-fill-mode 0))
(add-hook 'message-mode-hook 'auto-fill-mode-off)

;;; gnus

(setq gnus-select-method '(nnimap "gmail"
                           (nnimap-address "imap.gmail.com")
                           (nnimap-server-port "imaps")
                           (nnimap-inbox "INBOX")
                           (nnimap-stream ssl))
      gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")

;; (add-to-list 'gnus-secondary-select-methods
;;              '(nnimap "gmail"
;;                (nnimap-address "imap.gmail.com")
;;                (nnimap-server-port "imaps")
;;                (nnimap-stream ssl)
;;                (nnmail-expiry-target "nnimap+gmail:[Gmail]/Trash")
;;                (nnmail-expiry-wait immediate)))

;;; mu4e

(add-to-list 'load-path "/usr/share/emacs/site-lisp/elpa-src/mu4e-1.8.14/")
(require 'mu4e)

(setq mu4e-maildir "~/mail/"
      mu4e-drafts-folder "/drafts"
      mu4e-sent-folder "/sent"
      mu4e-trash-folder "/trash"
      mu4e-attachment-dir "~/Downloads")

(setq mu4e-maildir-shortcuts
      '(("/Inbox" . ?i)
        ("/[Gmail]/All Mail/" . ?a)))

(setq mu4e-get-mail-command "mbsync -a"
      mu4e-compose-reply-ignore-address '("no-?reply" "wohonajax@gmail.com")
      mu4e-html2text-command "w3m -T text/html"
      mu4e-update-interval 300
      mu4e-headers-auto-update t
      mu4e-view-show-images t
      mu4e-compose-signature-auto-include nil
      mu4e-use-fancy-chars t
      mu4e-change-filenames-when-moving t
      message-kill-buffer-on-exit t
      mu4e-compose-dont-reply-to-self t)

(setq mu4e-user-mail-address-list
      '("wohonajax@gmail.com" "wohonajax1@gmail.com"))

(defvar my-mu4e-account-alist
  '(("Gmail"
     (mu4e-sent-folder "/[Gmail]/Sent Mail")
     (user-mail-address "wohonajax@gmail.com")
     (smtpmail-smtp-user "wohonajax")
     (smtpmail-local-domain "gmail.com")
     (smtpmail-default-smtp-server "smtp.gmail.com")
     (smtpmail-smtp-server "smtp.gmail.com")
     (smtpmail-smtp-service 587))))

(add-hook 'mu4e-compose-mode-hook 'auto-fill-mode-off)
(add-hook 'mu4e-compose-mode-hook 'flyspell-mode)
