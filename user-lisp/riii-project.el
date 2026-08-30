;;; riii-project.el --- Project and Git tools -*- lexical-binding: t; -*-

(require 'use-package)

(use-package project
  :ensure nil)

(use-package magit
  :ensure t
  :bind
  (("C-c g" . magit-status)))

(provide 'riii-project)
;;; riii-project.el ends here
