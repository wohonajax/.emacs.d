;;;; -----------------------
;;;; Various Package Loading
;;;; -----------------------


(add-to-list 'load-path "~/slime")
(add-to-list 'load-path "~/.emacs.d/site-lisp")

(require 'slime-autoloads)
(setq slime-contribs '(slime-fancy slime-banner))

(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)

(require 'paredit)
(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of Lisp code."
  t)
(load-init 'paredit)

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

(require 'saveplace)
(setq-default save-place t)

(require 'legalese)

(require 'fic-ext-mode)
(add-something-to-mode-hooks '(c++ tcl lisp emacs-lisp python js text markdown latex) 'fic-ext-mode)

(require 'popup)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/site-lisp/ac-dict")
(ac-config-default)
(require 'ac-slime)
(add-something-to-mode-hooks '(slime slime-repl) 'set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))

(require 'highlight-numbers)
(highlight-numbers-mode)
(add-something-to-mode-hooks '(text slime lisp emacs-lisp) 'highlight-numbers-mode)

(require 'highlight-defined)
(add-hook 'emacs-lisp-mode-hook 'highlight-defined-mode)
