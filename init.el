(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))

(setq byte-compile-warnings '(cl-functions))

;; Dashboard
(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner 'official)
  (setq dashboard-banner-logo-title "L coder :)"))
  (setq inhibit-startup-screen t)


;; Themes 
(use-package modus-themes
  :ensure t
  :config
  (modus-themes-load-theme 'modus-operandi))
;; (define-key global-map (kbd "<f5>") #'modus-themes-toggle))

;; Auctex LaTex
(use-package auctex
  :ensure t
  :commands LaTeX-mode
  :hook (LaTeX-mode . (lambda ()
			(push (list 'output-pdf "Zathura")
			      TeX-view-program-selection))))
;; completion
(use-package company
  :ensure t
  :defer t
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(electric-pair-mode 1) 

;; ui things
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; font
(set-face-attribute 'default nil :font "JetBrains Mono-14:weight=Regular")

;; Backups
(setq backup-directory-alist '(("." . "~/.emacs_saves")))

;; Smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; ido
(use-package ido-vertical-mode
  :config
  (setq ido-enable-flex-matching t)
  (setq ido-everywhere t)
  (setq ido-vertical-define-keys 'C-n-and-C-p-only)      
  :init
  (ido-mode 1)
  (ido-vertical-mode 1))

;; Relative numbers
(setq display-line-numbers 'relative)

;; vim ci and co
(use-package expand-region
  :bind ("C-=" . er/expand-region))

(use-package change-inner
  :bind ("M-i" . change-inner)
  ("M-o" . change-outer))

(use-package org-bullets
  :ensure t
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

;; WEB MODE
(setq treesit-language-source-alist
   '((bash "https://github.com/tree-sitter/tree-sitter-bash")
     (cmake "https://github.com/uyha/tree-sitter-cmake")
     (css "https://github.com/tree-sitter/tree-sitter-css")
     (elisp "https://github.com/Wilfred/tree-sitter-elisp")
     (go "https://github.com/tree-sitter/tree-sitter-go")
     (html "https://github.com/tree-sitter/tree-sitter-html")
     (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
     (json "https://github.com/tree-sitter/tree-sitter-json")
     (make "https://github.com/alemuller/tree-sitter-make")
     (markdown "https://github.com/ikatyang/tree-sitter-markdown")
     (python "https://github.com/tree-sitter/tree-sitter-python")
     (toml "https://github.com/tree-sitter/tree-sitter-toml")
     (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
     (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
     (yaml "https://github.com/ikatyang/tree-sitter-yaml")))

(use-package eglot
  :custom
  (eldoc-echo-area-use-multiline-p 3)
  (eldoc-echo-area-display-truncation-message nil)
  )

(defun split-and-follow-horizontally ()
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)

(defun split-and-follow-vertically ()
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)

