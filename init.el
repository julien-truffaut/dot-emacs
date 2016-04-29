;; Initialise the package system first of all.
(package-initialize)

;; Skip the default splash screen.
(setq inhibit-startup-message t)

;; Figure out the current hostname.
(setq hostname (replace-regexp-in-string "\\(^[[:space:]\n]*\\|[[:space:]\n]*$\\)" "" (with-output-to-string (call-process "hostname" nil standard-output))))

;; Figure out the path to our .emacs.d by getting the path part of the
;; current file (`init.el`).
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) (file-chase-links load-file-name))))

;; load all .el files from modules dir
(add-to-list 'load-path (concat dotfiles-dir "modules"))



(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(setq exec-path (append exec-path '("/usr/local/bin")))

(setq backup-directory-alist `(("." . "~/.saves")))

(load-theme 'material t)
(add-to-list 'default-frame-alist '(height . 50))
(add-to-list 'default-frame-alist '(width . 160))
(setq initial-frame-alist '((left . 100) (top . 80)))


(require 'j-package)
(require 'j-haskell)
(require 'j-purescript)
