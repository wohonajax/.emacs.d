;;;; -*- lexical-binding: t; -*-
;;;; ----------------------
;;;; Org-Mode Customization
;;;; ----------------------

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
