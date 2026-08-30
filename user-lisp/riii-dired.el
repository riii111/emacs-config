;;; riii-dired.el --- Directory editing -*- lexical-binding: t; -*-

(require 'use-package)

(use-package dired
  :ensure nil
  :custom
  (dired-dwim-target t)
  :hook
  (dired-mode . auto-revert-mode))

(use-package wdired
  :ensure nil)

(provide 'riii-dired)
;;; riii-dired.el ends here
