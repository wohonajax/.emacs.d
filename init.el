;;;; Hunter Chandler's .emacs file for configuration of GNU Emacs
;;;; Started 2013-12-15



;;; ---------
;;; Autoloads
;;; ---------

(add-to-list 'load-path "~/slime")
(require 'slime-autoloads)
(setq slime-contribs '(slime-fancy))
(add-to-list 'load-path "~/.emacs.d/site-lisp")
(add-to-list 'load-path "~/.emacs.d/site-lisp/js3")
(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)
(global-linum-mode 1)
(require 'paredit)
(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of Lisp code."
  t)
;(require 'quack)
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(require 'saveplace)
(setq-default save-place t)
(require 'legalese)
(require 'fic-ext-mode)
(defun add-something-to-mode-hooks (mode-list something)
  "helper function to add a callback to multiple hooks"
  (dolist (mode mode-list)
    (add-hook (intern (concat (symbol-name mode) "-mode-hook")) something)))
(add-something-to-mode-hooks '(c++ tcl lisp emacs-lisp python js text markdown latex) 'fic-ext-mode)
(autoload 'js3-mode "js3-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js3-mode))
(require 'nodejs-repl)
(require 'popup)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/site-lisp/ac-dict")
(ac-config-default)
(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))
(require 'lua-mode)

;;; -------------------
;;; Basic Customization
;;; -------------------

(setq-default column-number-mode t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)
(add-to-list 'default-frame-alist '(width . 82))
(setq default-directory "C:/home/")
(setq browse-url-browser-function 'eww)

;;; -------------------
;;; Common Lisp & SLIME
;;; -------------------

(setq inferior-lisp-program "C:/sbcl/sbcl"
      lisp-indent-function 'common-lisp-indent-function
      slime-complete-symbol-function 'slime-fuzzy-complete-symbol
      slime-startup-animation t
      common-lisp-hyperspec-root "C:/sbcl/HyperSpec")

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
 '(default ((t (:inherit nil :stipple nil :background "#090D0F" :foreground "SystemWindowText" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "outline" :family "Consolas"))))
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

;;; --------------------------
;;; Add Clipboard to kill ring
;;; --------------------------

(defadvice kill-new (before kill-new-push-xselection-on-kill-ring activate)
  "Before putting new kill onto the kill-ring, add the clipboard/external selection to the kill ring"
  (let ((have-paste (and interprogram-paste-function
                         (funcall interprogram-paste-function))))
    (when have-paste (push have-paste kill-ring))))

;;; -------------------
;;; ParEdit Adjustments
;;; -------------------

(add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
;; Stop SLIME's REPL from grabbing DEL,
;; which is annoying when backspacing over a '('
(defun override-slime-repl-bindings-with-paredit ()
  (define-key slime-repl-mode-map
      (read-kbd-macro paredit-backward-delete-key) nil))
(add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit)
(defun paredit-barf-all-the-way-backward ()
  (interactive)
  (paredit-split-sexp)
  (paredit-backward-down)
  (paredit-splice-sexp))
(defun paredit-barf-all-the-way-forward ()
  (interactive)
  (paredit-split-sexp)
  (paredit-forward-down)
  (paredit-splice-sexp)
  (if (eolp) (delete-horizontal-space)))
(defun paredit-slurp-all-the-way-backward ()
  (interactive)
  (catch 'done
    (while (not (bobp))
      (save-excursion
	(paredit-backward-up)
	(if (eq (char-before) ?\()
	    (throw 'done t)))
      (paredit-backward-slurp-sexp))))
(defun paredit-slurp-all-the-way-forward ()
  (interactive)
  (catch 'done
    (while (not (eobp))
      (save-excursion
	(paredit-forward-up)
	(if (eq (char-after) ?\))
	    (throw 'done t)))
      (paredit-forward-slurp-sexp))))
(defun paredit-forward-inject ()
  (interactive)
  (save-excursion
    (paredit-forward-down)
    (paredit-backward-slurp-sexp)))
(defun paredit-backward-inject ()
  (interactive)
  (save-excursion
    (paredit-backward-down)
    (paredit-forward-slurp-sexp)))
(defun paredit-inject-in-front ()
  (interactive)
  (catch 'done
    (while (not (bobp))
      (if (or (eq (char-after) ?\()
	      (eq (char-after (1+ (point))) ?\())
	  (throw 'done t))
      (paredit-forward-inject))))
(defun paredit-inject-in-end ()
  (interactive)
  (catch 'done
    (while (not (eobp))
      (if (or (eq (char-before) ?\))
	      (eq (char-before (1- (point))) ?\)))
	  (throw 'done t))
      (paredit-backward-inject))))
(nconc paredit-commands
       '("Extreme Barfage, Slurpage, Injection"
	 (("C-M-)")
	  paredit-slurp-all-the-way-forward
	  ("(foo (bar |baz) quux zot)"
	   "(foo (bar |baz quux zot))")
	  ("(a b ((c| d)) e f)"
	   "(a b ((c| d)) e f)"))
	 (("C-M-}" "M-F")
	  paredit-barf-all-the-way-forward
	  ("(foo (bar |baz quux) zot)"
	   "(foo (bar|) baz quux zot)"))
	 (("C-M-]")
	  paredit-inject-in-end
	  ("(foo (bar baz) quux| zot)"
	   "(foo (bar baz quux|) zot)"))
	 (("C-M-(")
	  paredit-slurp-all-the-way-backward
	  ("(foo bar (baz| quux) zot)"
	   "((foo bar baz| quux) zot)")
	  ("(a b ((c| d)) e f)"
	   "(a b ((c| d)) e f)"))
	 (("C-M-{" "M-B")
	  paredit-barf-all-the-way-backward
	  ("(foo (bar baz |quux) zot)"
	   "(foo bar baz (|quux) zot)"))
	 (("C-M-[")
	  paredit-inject-in-front
	  ("(foo |bar (baz quux) zot)"
	   "(foo |(bar baz quux) zot)"))
	 (("M-[")
	  paredit-forward-inject
	  ("(foo| bar (baz quux) zot)"
	   "(foo| (bar baz quux) zot)"))
	 (("M-]")
	  paredit-backward-inject
	  ("(foo (bar baz) quux |zot)"
	   "(foo (bar baz quux) |zot)"))))
(paredit-define-keys)
(paredit-annotate-mode-with-examples)
(paredit-annotate-functions-with-examples)

;;; ------------------------------------------------------------------
;;; Sets { } as a delimiter pair in Lisp modes (fixes { } for paredit)
;;; ------------------------------------------------------------------

(modify-syntax-entry ?{ "(}" lisp-mode-syntax-table)
(modify-syntax-entry ?} "){" lisp-mode-syntax-table)
(modify-syntax-entry ?{ "(}" lisp-interaction-mode-syntax-table)
(modify-syntax-entry ?} "){" lisp-interaction-mode-syntax-table)
(modify-syntax-entry ?{ "(}" emacs-lisp-mode-syntax-table)
(modify-syntax-entry ?} "){" emacs-lisp-mode-syntax-table)

;;; -----------------
;;; Key Redefinitions
;;; -----------------

;;; make PC keyboard's Win key or other to type Super or Hyper, for emacs running on Windows.
(setq w32-pass-lwindow-to-system nil)
(setq w32-lwindow-modifier 'super) ; Left Windows key

(setq w32-pass-rwindow-to-system nil)
(setq w32-rwindow-modifier 'super) ; Right Windows key

(setq w32-pass-apps-to-system nil)
(setq w32-apps-modifier 'hyper) ; Menu/App key

(setq w32-enable-caps-lock nil) ; caps lock set to hyper
(define-key function-key-map [(capslock)] 'event-apply-hyper-modifier)

;;; ------------------
;;; Keyboard Shortcuts
;;; ------------------

;; find file from home directory (C:/home/)
(global-set-key (kbd "C-x C-f")  (lambda ()
				   (interactive)
				   (cd "~/")
				   (call-interactively 'find-file)))
;; autoindent newline on pressing enter
(global-set-key (kbd "RET") 'newline-and-indent)
;; summon the scratch pad
(global-set-key (kbd "s-s") (lambda () (interactive)
			      (switch-to-buffer "*scratch*")))
;; run SLIME
(global-set-key (kbd "C-x H-s") 'slime)
;; eval-buffer
(global-set-key (kbd "C-x e") 'eval-buffer)
;; browse the HyperSpec
(global-set-key (kbd "C-x H-h")
		(lambda () (interactive)
			(eww-open-file
			 "C:/sbcl/HyperSpec/Front/X_Master.htm")))
;; start a Lua shell
(global-set-key (kbd "C-x H-l") 'lua-start-process)

;;;; Greek alphabet

;; lambda key
(global-set-key (kbd "H-l") "λ")
;; uppercase lambda
(global-set-key (kbd "H-L") "Λ")
;; alpha key
(global-set-key (kbd "H-a") "α")
;; uppercase alpha
(global-set-key (kbd "H-A") "Α")
;; beta key
(global-set-key (kbd "H-b") "β")
;; uppercase beta
(global-set-key (kbd "H-B") "Β")
;; gamma key
(global-set-key (kbd "H-g") "γ")
;; uppercase gamma
(global-set-key (kbd "H-G") "Γ")
;; delta key
(global-set-key (kbd "H-d") "δ")
;; uppercase delta
(global-set-key (kbd "H-D") "Δ")
;; epsilon key
(global-set-key (kbd "H-e") "ε")
;; uppercase epsilon
(global-set-key (kbd "H-E") "Ε")
;; zeta key
(global-set-key (kbd "H-z") "ζ")
;; uppercase zeta
(global-set-key (kbd "H-Z") "Ζ")
;; eta key
(global-set-key (kbd "H-h") "η")
;; uppercase eta
(global-set-key (kbd "H-H") "Η")
;; theta key
(global-set-key (kbd "H-q") "θ")
;; uppercase theta
(global-set-key (kbd "H-Q") "Θ")
;; iota key
(global-set-key (kbd "H-i") "ι")
;; uppercase iota
(global-set-key (kbd "H-I") "Ι")
;; kappa key
(global-set-key (kbd "H-k") "κ")
;; uppercase kappa
(global-set-key (kbd "H-K") "Κ")
;; mu key
(global-set-key (kbd "H-m") "μ")
;; uppercase mu
(global-set-key (kbd "H-M") "Μ")
;; nu key
(global-set-key (kbd "H-n") "ν")
;; uppercase nu
(global-set-key (kbd "H-N") "Ν")
;; xi key
(global-set-key (kbd "H-x") "ξ")
;; uppercase xi
(global-set-key (kbd "H-X") "Ξ")
;; omicron key
(global-set-key (kbd "H-o") "ο")
;; uppercase omicron
(global-set-key (kbd "H-O") "Ο")
;; pi key
(global-set-key (kbd "H-p") "π")
;; uppercase pi
(global-set-key (kbd "H-P") "Π")
;; rho key
(global-set-key (kbd "H-r") "ρ")
;; uppercase rho
(global-set-key (kbd "H-R") "Ρ")
;; sigma key
(global-set-key (kbd "H-s") "σ")
;; uppercase sigma
(global-set-key (kbd "H-S") "Σ")
;; tau key
(global-set-key (kbd "H-t") "τ")
;; uppercase tau
(global-set-key (kbd "H-T") "Τ")
;; upsilon key
(global-set-key (kbd "H-u") "υ")
;; uppercase upsilon
(global-set-key (kbd "H-U") "Υ")
;; phi key
(global-set-key (kbd "H-f") "φ")
;; uppercase phi
(global-set-key (kbd "H-F") "Φ")
;; chi key
(global-set-key (kbd "H-c") "χ")
;; uppercase chi
(global-set-key (kbd "H-C") "Χ")
;; psi key
(global-set-key (kbd "H-y") "ψ")
;; uppercase psi
(global-set-key (kbd "H-Y") "Ψ")
;; omega key
(global-set-key (kbd "H-w") "ω")
;; uppercase omega
(global-set-key (kbd "H-W") "Ω")
;; much less than
(global-set-key (kbd "H-<") "≪")
;; much greater than
(global-set-key (kbd "H->") "≫")
;; left double angle quote
(global-set-key (kbd "C-<") "«")
;; right double angle quote
(global-set-key (kbd "C->") "»")
;; left angle quote
(global-set-key (kbd "s-`") "‹")
;; right angle quote
(global-set-key (kbd "s-'") "›")
;; left quotation mark
(global-set-key (kbd "H-`") "‘")
;; right quotation mark
(global-set-key (kbd "H-'") "’")
;; left double quote
(global-set-key (kbd "s-\"") "“")
;; right double quote
(global-set-key (kbd "H-\"") "”")
