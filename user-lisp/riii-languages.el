;;; riii-languages.el --- Language-specific settings -*- lexical-binding: t; -*-

(require 'treesit)
(require 'use-package)

;; Pin the grammars to the revisions tested by the Emacs 31.1 modes.
(setq treesit-language-source-alist
      '((rust
         "https://github.com/tree-sitter/tree-sitter-rust"
         :commit "18b0515fca567f5a10aee9978c6d2640e878671a")
        (typescript
         "https://github.com/tree-sitter/tree-sitter-typescript"
         :commit "8e13e1db35b941fc57f2bd2dd4628180448c17d5"
         :source-dir "typescript/src")
        (tsx
         "https://github.com/tree-sitter/tree-sitter-typescript"
         :commit "8e13e1db35b941fc57f2bd2dd4628180448c17d5"
         :source-dir "tsx/src")
        (markdown
         "https://github.com/tree-sitter-grammars/tree-sitter-markdown"
         :commit "413285231ce8fa8b11e7074bbe265b48aa7277f9"
         :source-dir "tree-sitter-markdown/src")
        (markdown-inline
         "https://github.com/tree-sitter-grammars/tree-sitter-markdown"
         :commit "413285231ce8fa8b11e7074bbe265b48aa7277f9"
         :source-dir "tree-sitter-markdown-inline/src")))

(defun riii-treesit-install-grammars ()
  "Install the Rust, TypeScript, TSX, and Markdown grammars used by this configuration."
  (interactive)
  (unless (treesit-available-p)
    (user-error "This Emacs was built without tree-sitter support"))
  (dolist (language '(rust typescript tsx markdown markdown-inline))
    (unless (treesit-language-available-p language)
      (treesit-install-language-grammar language))))

(use-package kotlin-mode
  :ensure t
  :mode
  (("\\.kt\\'" . kotlin-mode)
   ("\\.kts\\'" . kotlin-mode)))

(defun riii-kotlin-eglot ()
  "Start the experimental JetBrains Kotlin language server in this buffer."
  (interactive)
  (unless (derived-mode-p 'kotlin-mode)
    (user-error "This command is only available in kotlin-mode"))
  (require 'eglot)
  ;; Keep the experimental server opt-in and local to this buffer.
  (setq-local eglot-server-programs
              (cons '(kotlin-mode . ("kotlin-lsp"))
                    eglot-server-programs))
  (call-interactively #'eglot))

(provide 'riii-languages)
;;; riii-languages.el ends here
