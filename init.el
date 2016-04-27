(require 'package)
(require 'req-package)

; Add MELPA repository
(add-to-list 'package-archives
  '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)

;; Haskell
(req-package haskell-mode
  :config (progn
    (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-file)
    (add-hook 'haskell-mode-hook 'haskell-doc-mode)
    (add-hook 'haskell-mode-hook 'haskell-indentation-mode)
    (add-hook 'haskell-mode-hook 'interactive-haskell-mode)
    (add-hook 'haskell-mode-hook 'haskell-decl-scan-mode)
    (add-hook 'haskell-mode-hook (lambda ()
				   (electric-indent-local-mode -1)))
    (setq haskell-process-type 'stack-ghci)
    (setq haskell-process-path-ghci "stack")
    (setq haskell-process-args-ghci '("ghci"))

    (setq haskell-process-suggest-remove-import-lines t)
    (setq haskell-process-auto-import-loaded-modules t)
    (setq haskell-process-log nil)
    (setq haskell-stylish-on-save t)))
