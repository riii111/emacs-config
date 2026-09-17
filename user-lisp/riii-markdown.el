;;; riii-markdown.el --- In-buffer Markdown rendering -*- lexical-binding: t; -*-

(require 'use-package)

(use-package markdown-ts-mode
  :ensure nil
  :mode ("\\.md\\'" . markdown-ts-mode)
  :custom
  (markdown-ts-hide-markup t)
  (markdown-ts-fontify-code-blocks-natively t))

(provide 'riii-markdown)
;;; riii-markdown.el ends here
