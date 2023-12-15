;;;;  -*- lexical-binding: t; -*-
;;;; ------------------------------
;;;; Hunter Chandler's init.el File
;;;; for Configuration of GNU Emacs
;;;;       Started 2013-12-15
;;;; ------------------------------



(require 'package)

(mapc (lambda (item) (add-to-list 'package-archives item t))
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ;("melpa-stable" . "https://stable.melpa.org/packages/")
        ("melpa" . "https://melpa.org/packages/")
        ("elpy" . "https://jorgenschaefer.github.io/packages/")))

(package-initialize)

(let ((em-dir (expand-file-name user-emacs-directory)))
  (add-to-list 'load-path (concat em-dir "elpa"))
  (setq custom-file (concat em-dir "custom.el")))

(load custom-file)

(use-package vertico
  :custom
  (vertico-count 13)
  (vertico-resize t)
  (vertico-cycle nil)
  :config
  (vertico-mode))

(use-package marginalia
  :bind
  (("M-A" . marginalia-cycle))
  :config
  (marginalia-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless))
  (completion-category-defaults nil)
  (completion-category-overrides
   '((file (styles basic-remote orderless))))
  (orderless-matching-styles
   '(orderless-literal
     orderless-prefixes
     orderless-initialism
     orderless-regexp)))

(use-package consult
  :ensure t
  :bind (("C-x M-:" . consult-complex-command)
         ("C-x b" . consult-buffer)
         ("C-x 4 b" . consult-buffer-other-window)
         ("C-x 5 b" . consult-buffer-other-frame)
         ("C-x t b" . consult-buffer-other-tab)
         ("C-x r b" . consult-bookmark)
         ("C-x p b" . consult-project-buffer)
         :map isearch-mode-map
         ("M-e" . consult-isearch-history)
         ("M-s e" . consult-isearch-history)
         ("M-s l" . consult-line)
         ("M-s L" . consult-line-multi)
         :map minibuffer-local-map
         ("M-s" . consult-history)
         ("M-r" . consult--man-history))
  :hook (completion-list-mode . consult-preview-at-point-mode)
  :init
  (setq register-preview-delay 0.1
        register-preview-function #'consult-register-format)

  ;; Optionally tweak the register preview window.
  ;; This adds thin lines, sorting and hides the mode line of the window.
  (advice-add #'register-preview :override #'consult-register-window)

  ;; Use Consult to select xref locations with preview
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)

  (setq consult-project-function #'consult--default-project-function))

(use-package embark
  :ensure t
  :bind
  (("C-." . embark-act)
   ("C-;" . embark-dwim)
   ("C-h B" . embark-bindings))
  :init
  (setq prefix-help-command #'embark-prefix-help-command)
  :config
  (add-to-list 'display-buffer-alist
	       '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
		 nil
		 (window-parameters (mode-line-format . none)))))

(use-package embark-consult
  :ensure t
  :after (embark consult)
  :demand t
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package corfu
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-auto-prefix 2)
  (corfu-quit-at-boundary 'separator)
  :bind (:map corfu-map
         ("C-n" . corfu-next)
         ("C-p" . corfu-previous)
         ("C-g" . corfu-quit))
  :init
  (global-corfu-mode)
  (corfu-history-mode))

(use-package sly
  :ensure t
  :init
  (setq inferior-lisp-program "/usr/local/bin/sbcl")
  (setq lisp-indent-function #'common-lisp-indent-function)
  (define-key lisp-mode-shared-map (kbd "C-c e") #'macrostep-expand)
  :config
  (setq-default sly-symbol-completion-mode nil))

(use-package rainbow-delimiters
  :ensure t
  :init
  (rainbow-delimiters-mode t)
  :hook (text-mode prog-mode))

(use-package highlight-numbers
  :ensure t
  :hook (text-mode prog-mode sly-mrepl-mode))

(use-package fic-mode
  :ensure t
  :commands (fic-mode)
  :hook prog-mode
  :init (setq fic-highlighted-words
              '("FIXME" "FIXME:" "TODO" "TODO:"
                "HACK" "HACK:" "NOTE" "NOTE:"
                "BUG" "BUG:" "REFACTOR" "REFACTOR:")))

(use-package highlight-defined
  :ensure t
  :hook emacs-lisp-mode)

(use-package zenburn-theme
  :ensure t
  :demand
  :config (load-theme 'zenburn))

(use-package magit
  :ensure t
  :bind
  ("C-x g" . magit-status)
  ("C-x M-g" . magit-dispatch))

(use-package paredit
  :ensure t
  :init
  (add-hook 'clojure-mode-hook #'enable-paredit-mode)
  (add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
  (add-hook 'ielm-mode-hook #'enable-paredit-mode)
  (add-hook 'lisp-mode-hook #'enable-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
  (add-hook 'scheme-mode-hook #'enable-paredit-mode)

  :config
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
    (when (eolp) (delete-horizontal-space)))

  (defun paredit-slurp-all-the-way-backward ()
    (interactive)
    (catch 'done
      (while (not (bobp))
	(save-excursion
          (paredit-backward-up)
          (when (eq (char-before) ?\()
            (throw 'done t)))
	(paredit-backward-slurp-sexp))))

  (defun paredit-slurp-all-the-way-forward ()
    (interactive)
    (catch 'done
      (while (not (eobp))
	(save-excursion
          (paredit-forward-up)
          (when (eq (char-after) ?\))
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
	(when (or (eq (char-after) ?\()
                  (eq (char-after (1+ (point))) ?\())
          (throw 'done t))
	(paredit-forward-inject))))

  (defun paredit-inject-in-end ()
    (interactive)
    (catch 'done
      (while (not (eobp))
	(when (or (eq (char-before) ?\))
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
  (paredit-annotate-functions-with-examples))

(mapc (lambda (file) (load (concat "~/.emacs.d/inits/" file)))
      (seq-remove (lambda (x) (or (string= x ".") (string= x "..")))
		  (directory-files "~/.emacs.d/inits/")))

(use-package js2-mode
  :ensure t
  :commands js2-mode
  :mode (("\\.js$" . js2-mode)
         ("\\.es6$" . js2-mode)
         ("\\.ejs$" . js2-mode))
  :init
  (setq js-indent-level 2))

(use-package elpy
  :ensure t
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable)
  :config
  (setq elpy-rpc-python-command "python3"))

(use-package org
  :ensure t
  :bind (("C-c l" . org-store-link)
         ("C-c a" . org-agenda))
  :init (setq org-log-done t))

(use-package project
  :ensure t)

(use-package neotree
  :ensure t
  :init
  (defun neotree-project-dir ()
    "Open NeoTree using the git root."
    (interactive)
    (let ((project-dir (ffip-project-root))
          (file-name (buffer-file-name)))
      (neotree-toggle)
      (if project-dir
          (when (neo-global--window-exists-p)
            (neotree-dir project-dir)
            (neotree-find file-name))
        (message "Could not find git project root."))))
  (setq neo-smart-open t)
  (global-set-key [f8] 'neotree-project-dir))

(use-package sublimity
  :ensure t
  :config
  (require 'sublimity-map))
