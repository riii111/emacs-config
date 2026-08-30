;;; riii-completion.el --- Completion and search -*- lexical-binding: t; -*-

(require 'use-package)

(use-package vertico
  :ensure t
  :commands vertico-mode
  :init
  (vertico-mode 1))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-pcm-leading-wildcard t))

(use-package consult
  :ensure t
  :bind
  (([remap switch-to-buffer] . consult-buffer)
   ("M-s l" . consult-line)
   ("M-s r" . consult-ripgrep)
   ("M-g i" . consult-imenu)))

(use-package embark
  :ensure t
  :bind
  (("C-." . embark-act)
   ("C-;" . embark-dwim)))

(use-package embark-consult
  :ensure t
  :after (embark consult)
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package corfu
  :ensure t
  :commands global-corfu-mode
  :custom
  (corfu-cycle t)
  :init
  ;; Manual completion avoids evaluating completion code merely by typing.
  (global-corfu-mode 1))

(provide 'riii-completion)
;;; riii-completion.el ends here
