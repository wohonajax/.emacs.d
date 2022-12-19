(setq send-mail-function 'smtpmail-send-it
      message-send-mail-function 'smtpmail-send-it)

(require 'gnus)
(setq gnus-select-method
      '(nnimap "gmail"
        (nnimap-address "imap.gmail.com")
        (nnimap-server-port 993)
        (nnimap-stream ssl)))

(setq gnus-ignored-newsgroups
      "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")
