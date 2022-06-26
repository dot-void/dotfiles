;; Remove welcome message
(setq inhibit-startup-message t)
;; Remove menus
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; line-numbers
(global-linum-mode t)

;; highlight actual line
(global-hl-line-mode)

;; Font size
(set-face-attribute 'default nil :height 150)

;; cancel auto-save and backups
(setq auto-save-default nil)
(setq make-backup-files nil)

;; flex buffer
(defalias 'list-buffers 'ibuffer-other-window) ;; ibuffer default C-x C-b
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;; modes
(ido-mode 1)
(cua-mode 1)

;; org
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; --------- melpa stuff

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; ----------- neotree

(use-package neotree
	     :ensure t
	     :config
	     (progn
	       (setq neo-theme (if (display-graphic-p) 'icons 'arrows))
	       )
	     :bind (("C-\\". 'neotree-toggle));; atom-key
	     )

;; ----------- dashboard
(use-package dashboard
  :ensure t
  :init
  (progn
    (setq dashboard-items '((recents . 5)
			    (projects . 10)))
    (setq dashboard-banner-logo-title "Olar bb!")
    (setq dashboard-startup-banner 'logo)
    (setq dashboard-set-file-icons t)
    (setq dashboard-heading-icons t)
    (setq dashboard-set-init-info nil)
    )
  :config
  (dashboard-setup-startup-hook))
(setq dashboard-org-agenda-categories '("Task"))

;; ----------- auto-complete

; snipets from autocomplete
(use-package yasnippet
  :ensure t)
(yas-global-mode 1)

; company: autocomplete library
(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1)
  (global-company-mode t))

;; ----------- package try
(use-package try
  :ensure t)

;; ----------- spaceline
(use-package spaceline
  :ensure t)

(use-package spaceline-config
  :config
  (spaceline-emacs-theme))

;; ----------- which-key
(use-package which-key
  :ensure t
  :config (which-key-mode))

;; -----------
(use-package all-the-icons
  :ensure t)

(use-package ace-window
  :ensure t
  :bind (("C-x o" . ace-window)))

(use-package rebecca-theme
  :ensure t
  :config (load-theme #'rebecca t))

(use-package counsel
  :ensure t)

;; ---------- vterm-package
(use-package vterm
  :ensure t)

(use-package vterm-toggle
  :ensure t)

;; ----------- go mode

(add-to-list 'load-path "~/go-mode.el")
(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

;; ----------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (ace-window dashboard use-package neotree))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
