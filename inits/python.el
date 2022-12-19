(elpy-enable)

(require 'py-autopep8)

(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules)))

(add-hook 'elpy-mode-hook #'py-autopep8-enable-on-save)
(add-hook 'elpy-mode-hook #'flycheck-mode)
