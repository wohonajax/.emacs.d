;;;; -*- lexical-binding: t; -*-
;;;; -------------------
;;;; Various Mode Setups
;;;; -------------------


(show-paren-mode t)
(setq show-paren-style 'parenthesis
      blink-matching-paren t)
(add-something-to-mode-hooks '(text prog)
                             'show-paren-mode)

(setq-default save-place)

(add-hook 'text-mode-hook 'flyspell-mode)

(setq warning-minimum-level :emergency)
(require 'server)
(unless (server-running-p)
  (server-start))
(setq warning-minimum-level :warning)
