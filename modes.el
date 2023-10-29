;;;; -*- lexical-binding: t; -*-
;;;; -------------------
;;;; Various Mode Setups
;;;; -------------------


(add-to-list 'load-path "~/.emacs.d/site-lisp/cc-mode")

(require 'company)

(global-company-mode t)
(global-display-line-numbers-mode t)

(rainbow-delimiters-mode t)
(add-something-to-mode-hooks '(text slime lisp emacs-lisp c)
                             #'rainbow-delimiters-mode)

(show-paren-mode t)
(setq show-paren-style 'expression
      blink-matching-paren t)
(add-something-to-mode-hooks '(text slime lisp emacs-lisp c)
                             #'show-paren-mode)

(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of Lisp code."
  t)

(require 'ido)
(ido-mode t)
(ido-everywhere t)
(ido-ubiquitous-mode t)
(setq ido-enable-flex-matching t
      ido-everywhere t)

(require 'amx)
(amx-mode t)

(setq-default save-place)

(highlight-numbers-mode t)
(add-something-to-mode-hooks '(text slime lisp emacs-lisp c)
                             #'highlight-numbers-mode)

(add-hook 'emacs-lisp-mode-hook #'highlight-defined-mode)
(add-hook 'text-mode-hook #'flyspell-mode)

(add-something-to-mode-hooks '(lisp python c)
                             #'projectile-mode)

(setq warning-minimum-level :emergency)
(require 'server)
(unless (server-running-p)
  (server-start))
(setq warning-minimum-level :warning)
