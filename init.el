(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))

;; No more warnings :v
(setq byte-compile-warnings '(cl-functions))

;; SLIME LISP
(setq inferior-lisp-program "sbcl")

;; Dashboard
(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner 'official)
  (setq dashboard-banner-logo-title "L coder :)"))
(setq inhibit-startup-screen t)

;; modeline
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :config
  (setq doom-modeline-support-imenu t)
  (setq doom-modeline-height 25)
  (setq doom-modeline-icon t)
  (setq doom-modeline-lsp-icon t))

;; Themes 
(use-package modus-themes
  :ensure t
  :config
  (modus-themes-load-theme 'modus-operandi)
  (define-key global-map (kbd "<f5>") #'modus-themes-toggle))

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

;; close symbols
(electric-pair-mode 1) 

;; ui things
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; font
(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font-14:weight=Regular")

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
(setq display-line-numbers-type 'relative) 
(global-display-line-numbers-mode)

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

(use-package eglot
  :custom
  (eldoc-echo-area-use-multiline-p 3)
  (eldoc-echo-area-display-truncation-message nil))

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
