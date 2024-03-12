(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))

;; No more warnings :v
(setq byte-compile-warnings '(cl-functions))

;; LISP
;; (load (expand-file-name "~/.quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")

;; Dashboard
(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner 'official)
  (setq dashboard-banner-logo-title "L coder :)"))
(setq inhibit-startup-screen t)
(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))
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
  :config
  (modus-themes-load-theme 'modus-operandi)
  (define-key global-map (kbd "<f5>") #'modus-themes-toggle))

;; Auctex LaTex
(use-package auctex
  :commands LaTeX-mode
  :hook (LaTeX-mode . (lambda ()
			(push (list 'output-pdf "Zathura")
			      TeX-view-program-selection))))
;; completion
(use-package company
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-tooltip-align-annotations t))

(use-package company-box
  :hook (company-mode . company-box-mode))

;; close symbols
(electric-pair-mode 1) 

;; ui things
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq scroll-step 1)

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

(use-package org-bullets
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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-safe-remote-resources
   '("\\`https://fniessen\\.github\\.io/org-html-themes/org/theme-readtheorg\\.setup\\'"))
 '(package-selected-packages
   '(company-box org-bullets org-superstar auctex ido-vertical-mode smex company modus-themes dashboard doom-modeline)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
