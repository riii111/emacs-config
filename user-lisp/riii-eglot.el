;;; riii-eglot.el --- Language server integration -*- lexical-binding: t; -*-

(require 'use-package)

(defconst riii-typescript-eglot-modes
  '((js-mode :language-id "javascript")
    (js-ts-mode :language-id "javascript")
    (tsx-ts-mode :language-id "typescriptreact")
    (typescript-ts-mode :language-id "typescript")
    (typescript-mode :language-id "typescript"))
  "Eglot modes served by the TypeScript language server.")

(use-package eglot
  :ensure nil
  :custom
  (eglot-autoshutdown t)
  :hook
  ((rust-ts-mode . eglot-ensure)
   (typescript-ts-mode . eglot-ensure)
   (tsx-ts-mode . eglot-ensure))
  :bind
  (:map eglot-mode-map
        ("C-c l a" . eglot-code-actions)
        ("C-c l f" . eglot-format-buffer)
        ("C-c l r" . eglot-rename)
        ("C-c l q" . eglot-shutdown))
  :config
  ;; Reuse Neovim's Mason installation when the server is not on PATH.
  (unless (executable-find "typescript-language-server")
    (let ((mason-server
           (expand-file-name
            ".local/share/nvim/mason/bin/typescript-language-server"
            "~")))
      (when (file-executable-p mason-server)
        (setf (alist-get riii-typescript-eglot-modes
                         eglot-server-programs nil nil #'equal)
              (list mason-server "--stdio"))))))

(provide 'riii-eglot)
;;; riii-eglot.el ends here
