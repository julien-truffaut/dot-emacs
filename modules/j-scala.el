;; Install ensime.
(use-package ensime
  :commands ensime ensime-mode)

(add-hook 'scala-mode-hook 'ensime-mode)

(provide 'j-scala)
