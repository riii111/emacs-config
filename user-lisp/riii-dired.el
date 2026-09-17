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

(defun riii-copy-file-path ()
  "Copy the absolute path at point to the kill ring and macOS pasteboard.
In Dired this is the entry at point.  Otherwise it is the visited file."
  (interactive)
  (let ((path
         (cond
          ((derived-mode-p 'dired-mode)
           (dired-get-filename nil t))
          (buffer-file-name
           (expand-file-name buffer-file-name)))))
    (unless path
      (user-error "No file path here"))
    (kill-new path)
    ;; Terminal Emacs does not own the macOS pasteboard.
    (when (eq system-type 'darwin)
      (let ((pbcopy (executable-find "pbcopy")))
        (when pbcopy
          (with-temp-buffer
            (insert path)
            (call-process-region (point-min) (point-max) pbcopy)))))
    (message "Copied %s" path)))

(global-set-key (kbd "C-c w") #'riii-copy-file-path)

(provide 'riii-dired)
;;; riii-dired.el ends here
