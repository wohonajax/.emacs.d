;;;; -----------------------
;;;; Various Package Loading
;;;; -----------------------


(add-to-list 'load-path "~/.emacs.d/site-lisp/cc-mode")

(require 'macrostep)
(require 'company)
(add-hook 'after-init-hook #'global-company-mode)
(add-hook 'after-init-hook #'global-hl-line-mode)
(add-hook 'after-init-hook #'global-display-line-numbers-mode)

(require 'slime-autoloads)

(let ((lst '(slime-fancy slime-banner slime-xref-browser slime-asdf
             slime-highlight-edits slime-company slime-quicklisp)))
  (setq slime-contribs lst)
  (slime-setup lst))
(add-to-list 'company-backends 'slime-company)

(require 'paredit)
(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of Lisp code."
  t)

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t
      ido-everywhere t)

(require 'saveplace)
(setq-default save-place)

;(require 'auto-complete-config)
;(add-to-list 'ac-dictionary-directories "~/.emacs.d/site-lisp/ac-dict")
;(ac-config-default)

;(require 'ac-slime)
;(add-something-to-mode-hooks '(slime slime-repl) 'set-up-slime-ac)
;(eval-after-load "auto-complete" '(add-to-list 'ac-modes 'slime-repl-mode))

(require 'highlight-numbers)
(highlight-numbers-mode)
(add-something-to-mode-hooks '(text slime lisp emacs-lisp c)
                             #'highlight-numbers-mode)

(require 'highlight-defined)
(add-hook 'emacs-lisp-mode-hook #'highlight-defined-mode)

(setq warning-minimum-level :emergency)
(require 'server)
(unless (server-running-p)
  (server-start))
(setq warning-minimum-level :warning)

(require 'dash)
(require 'magit)
(require 'cc-mode)
(require 'rainbow-delimiters)
