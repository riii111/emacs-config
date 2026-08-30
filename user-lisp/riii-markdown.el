;;; riii-markdown.el --- Markdown viewing with mdfried -*- lexical-binding: t; -*-

(defun riii-markdown-view ()
  "View the current file with mdfried in a Kitty overlay."
  (interactive)
  (unless buffer-file-name
    (user-error "This buffer is not visiting a file"))
  (when (file-remote-p buffer-file-name)
    (user-error "mdfried cannot view remote files"))
  (let ((kitten (executable-find "kitten"))
        (mdfried (executable-find "mdfried")))
    (unless kitten
      (user-error "kitten is not available on PATH"))
    (unless mdfried
      (user-error "mdfried is not available on PATH"))
    (unless (getenv "KITTY_LISTEN_ON")
      (user-error "Kitty remote control is not available in this Emacs process"))
    (save-buffer)
    (let ((status
           (call-process
            kitten nil nil nil
            "@" "launch" "--self" "--no-response" "--type=overlay"
            (concat "--cwd=" (file-name-directory buffer-file-name))
            mdfried (expand-file-name buffer-file-name))))
      (unless (eq status 0)
        (user-error "Failed to launch mdfried (exit %s)" status)))))

(global-set-key (kbd "C-c m") #'riii-markdown-view)

(provide 'riii-markdown)
;;; riii-markdown.el ends here
