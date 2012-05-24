;; load-path
(add-to-list 'load-path "~/.emacs.d/color-theme/")
(add-to-list 'load-path "~/.emacs.d/emacs-colors-solarized/")
(add-to-list 'load-path "~/.emacs.d/sunrise-commander/")
;;(add-to-list 'load-path "~/.emacs.d/auto-complete-extension/")
(add-to-list 'load-path "~/.emacs.d/auto-complete/")
;;(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/ac-dictx")


;; load color-theme
(require 'color-theme)
(color-theme-initialize)
(require 'color-theme-solarized)
(color-theme-solarized-dark)
;;(color-theme-subtle-hacker)

;; Hide menubar
(menu-bar-showhide-tool-bar-menu-customize-disable)

;; Add the original Emacs Lisp Package Archive
;;(add-to-list 'package-archives
;;             '("elpa" . "http://tromey.com/elpa/"))
;; Add the user-contributed repository
;;(add-to-list 'package-archives
;;             '("marmalade" . "http://marmalade-repo.org/packages/"))

;; load sunrise-commander
;;(require 'sunrise-commander)
;;(add-to-list 'auto-mode-alist '("\\.srvm\\'" . sr-virtual-mode))

;; load auto-complete
(require 'auto-complete-config)
(ac-config-default)
;; add haskell-mode for auto-complete to load automatically
(add-to-list 'ac-modes 'haskell-mode)

;; load auto-complete-extension
;;(require 'auto-complete-extension)

;; Set cmd and alt as unboud (works as expected on Mac)
(setq mac-option-key-is-meta nil)
(setq mac-option-modifier nil)

;; ispell
(setq-default ispell-program-name "/opt/local/bin/ispell")
;; (autoload 'ispell-word "/opt/local/bin/ispell"
;;          "Check the spelling of word in buffer." t)
;;       (global-set-key "\e$" 'ispell-word)
;;       (autoload 'ispell-region "/opt/local/bin/ispell"
;;          "Check the spelling of region." t)
;;       (autoload 'ispell-buffer "/opt/local/bin/ispell"
;;          "Check the spelling of buffer." t)
;;       (autoload 'ispell-complete-word "/opt/local/bin/ispell"
;;          "Look up current word in dictionary and try to complete it." t)
;;       (autoload 'ispell-change-dictionary "/opt/local/bin/ispell"
;;          "Change ispell dictionary." t)
;;       (autoload 'ispell-message "/opt/local/bin/ispell"
;;          "Check spelling of mail message or news post.")
;;       (autoload 'ispell-minor-mode "/opt/local/bin/ispell"
;;          "Toggle mode to automatically spell check words as they are typed in.")

;; -- Haskell mode --

(load "~/.emacs.d/haskell-mode/haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

;; -- End Haskell mode --

;; -- ghc-mod --

(add-to-list 'load-path "~/Library/Haskell/bin/")
(add-to-list 'load-path "~/.emacs.d/ghc-mod/")

(autoload 'ghc-init "/Library/Frameworks/GHC.framework/Versions/7.0.4-x86_64/usr/bin/ghc" nil t)
(add-hook 'haskell-mode-hook 
          (lambda () 
          (ghc-init) 
          (flymake-mode)))

;; -- End ghc-mod --

;; --- C settings ---

;;(require 'c-mode)

;; set style
;;(setq c-default-style "k&r"
;;      c-basic-offset 4)

;; automatic indent on return
;;(add-hook 'c-mode-common-hook 
;;          (lambda () 
;;            (define-key c-mode-base-map [ret] 'newline-and-indent)))

;; electric pairs
;;(add-hook 'c-mode-common-hook
;;          (lambda ()
;;            (define-key c-mode-map "(" 'electric-pair)
;;            (define-key c-mode-map "\"" 'electric-pair)))

;; --- end C settings ---

;;; Electric Pairs
(add-hook 'python-mode-hook
     (lambda ()
      (define-key python-mode-map "\"" 'electric-pair)
      (define-key python-mode-map "\'" 'electric-pair)
      (define-key python-mode-map "(" 'electric-pair)
      (define-key python-mode-map "[" 'electric-pair)
      (define-key python-mode-map "{" 'electric-pair)))
(defun electric-pair ()
  "Insert character pair without sournding spaces"
  (interactive)
  (let (parens-require-spaces)
    (insert-pair)))

;;; bind RET to py-newline-and-indent
(add-hook 'python-mode-hook '(lambda () 
     (define-key python-mode-map "\C-m" 'newline-and-indent)))
 ;;;ac-dictionary-directories
;;; Set indentation as per PEP 8
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default py-indent-offset 4)

;; Org mode
;;(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;;(global-set-key "\C-cl" 'org-store-link)
;;(global-set-key "\C-cc" 'org-capture)
;;(global-set-key "\C-ca" 'org-agenda)
;;(global-set-key "\C-cb" 'org-iswitchb)

;; todo-list-mode
(add-to-list 'load-path "~/.emacs.d/todo-list-mode/")
(autoload 'todo-list-mode "todo-list-mode")

;; todo - open todo list
(defun open-todo-list ()
  (interactive)
  (find-file "~/.emacs.d/todo-list-mode/mstodo")
  (todo-list-mode))

(global-set-key "\C-ct" 'open-todo-list)

;; todo - mark all and sort
(defun ms-mark-all-and-sort ()
  (interactive)
  (sort-lines nil (point-min) (point-max)))

(global-set-key [C-f12] 'ms-mark-all-and-sort)
;; end todo-list-mode

;; viper-mode
;;(defun ms-toggle-viper-mode ()
;;  (interactive)
;;  (toggle-viper-mode)
;;  (message "viper-mode toggled"))

;;(global-set-key [C-f10] 'ms-toggle-viper-mode)

;; projectile
(add-to-list 'load-path "~/.emacs.d/projectile/")
(require 'projectile)
(projectile-global-mode)

;;(cutom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;;(ns-auto-hide-menu-bar nil))
;;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;;)

;; MS - my custom key bindings
;;----------------------------

;; Window bindings
;; C-w h -> Split window horizontally
;;(global-set-key "\C-cwh" 'split-window-horizontally)
;; C-w v -> Split window vertically
;;(global-set-key "\C-cwv" 'split-window-vertically)
;; C-w o -> Other window
;;(defun ms-other-window ()
;;  "Moves focus to other window"
;;  (other-window 1))
;;(global-set-key "\C-cwv" 'ms-other-window)

(defun ms-window (char-choosen)
  "Description goes here"
  (interactive "cWindow cmds: split (v)er, split (h)oriz, (c)lose win, choose (o)ther: ")
  ;;(message "char-choosen: %s" char-choosen)
  (if (equal char-choosen 118) ;; 118 = v
      (split-window-vertically))
    ;;(message "%s did not match" char-choosen))
  (if (equal char-choosen 104) ;; 104 = h
      (split-window-horizontally))
  (if (equal char-choosen 99) ;; 99 = c
      (delete-window (selected-window)))
  (if (equal char-choosen 111) ;; 111 = o
      (other-window 1)))

(global-set-key "\C-cw" 'ms-window)

(defun ms-file (char-choosen)
  "Description goes here"
  (interactive "cFile cmds: (o)pen file, (l)oad file, load .(e)macs, (s)ave file: ")
  (message "char-choosen: %s" char-choosen)
  (if (equal char-choosen 111) ;; 111 = o
      (find-file ""))
  (if (equal char-choosen 108) ;; 108 = l
      (load-file))
  (if (equal char-choosen 115) ;; 115 = s
      (save-buffer))
  (if (equal char-choosen 101) ;; 101 = e
      (load-file "~/.emacs")))

(global-set-key "\C-cf" 'ms-file)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
