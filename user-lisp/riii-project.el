;;; riii-project.el --- Project and Git tools -*- lexical-binding: t; -*-

(require 'use-package)

(defun riii-project-find-file ()
  "Visit a file in the current project, including gitignored files."
  (interactive)
  (project-find-file t))

(use-package project
  :ensure nil
  :bind
  (:map project-prefix-map
        ("f" . riii-project-find-file)))

(use-package magit
  :ensure t
  :bind
  (("C-c g" . magit-status)))

(provide 'riii-project)
;;; riii-project.el ends here
