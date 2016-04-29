;; Install purescript-mode.
(use-package purescript-mode
  :commands purescript-mode
  :mode (("\\.purs$" . purescript-mode))
  :config
  (add-hook 'purescript-mode-hook 'turn-on-purescript-indentation))

(provide 'j-purescript)
