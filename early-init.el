;;; early-init.el --- Early startup settings -*- lexical-binding: t; -*-

(require 'package)

;; Apply the package trust policy before package activation begins.
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/"))
      package-check-signature t
      package-review-policy t)

;; Emacs 31 prepares this directory before loading init.el.
(setq user-lisp-directory
      (expand-file-name "user-lisp/" user-emacs-directory))

;;; early-init.el ends here
