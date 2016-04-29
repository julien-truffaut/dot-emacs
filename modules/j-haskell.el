(use-package haskell-mode
  :commands haskell-mode
  :config
  ;; Setup haskell-mode hooks
  (custom-set-variables
   '(haskell-mode-hook
     '(turn-on-haskell-indentation
       turn-on-haskell-doc)))
  ;; Setup haskell-interactive-mode keybindings. Get started by using C-c C-z from
  ;; a buffer visiting a file in your Haskell project.
  ;; Switch to the current REPL buffer, starting a session if needed.
  (bind-keys :map haskell-mode-map
             ("C-c C-z" . haskell-interactive-switch))
  ;; Switch between REPL sessions.
  (bind-keys :map haskell-mode-map
             ("C-c b" . haskell-session-change))
  ;; Load the current buffer into the REPL.
  (bind-keys :map haskell-mode-map
             ("C-c C-l" . haskell-process-load-file))
  ;; Infer the type of the thing at point.
  (bind-keys :map haskell-mode-map
             ("C-c C-t" . haskell-process-do-type))
  ;; Display info (in the REPL) about the thing at point.
  (bind-keys :map haskell-mode-map
             ("C-c C-i" . haskell-process-do-info))
  ;; Insert the inferred type of the function at point into the code.
  (bind-keys :map haskell-mode-map
             ("C-c C-s" . (lambda () (interactive) (haskell-process-do-type t))))
  ;; Run `cabal test' in a compile buffer.
  (bind-keys :map haskell-mode-map
             ("C-c C-," . j-haskell/run-test-suite)))


;; A function for launching a compile buffer with `cabal test'.
(defun j-haskell/run-test-suite ()
  (interactive)
  (require 'compile)
  (projectile-with-default-dir (projectile-project-root)
    (compile "cabal test")))

;; Flycheck addons
(use-package flycheck-haskell
  :config
  (with-eval-after-load "flycheck"
    (with-eval-after-load "haskell"
      (add-hook 'flycheck-mode-hook #'flycheck-haskell-setup))))

(provide 'j-haskell)
