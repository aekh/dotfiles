(setq package-enable-at-startup nil) (package-initialize)
(setq inhibit-startup-message t)
(add-to-list 'exec-path "~/.cabal/bin")
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 2)
(setq-default tab-width 4)
(setq-default indicate-empty-lines t)
(let ((my-cabal-path (expand-file-name "~/.cabal/bin")))
  (setenv "PATH" (concat my-cabal-path ":" (getenv "PATH")))
  (add-to-list 'exec-path my-cabal-path))

(autoload 'ghc-init "ghc" nil t)	;
;(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(setq haskell-process-type 'cabal-repl)

;;(add-hook 'LaTeX-mode-hook '(flyspell-mode t))
(add-hook 'latex-mode-hook
  (lambda ()
    (flyspell-buffer)
    (flyspell-mode)))

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(add-to-list 'company-backends 'company-ghc)

;(setq TeX-auto-save t)
;(setq TeX-parse-self t)
;(setq-default TeX-master nil)
;(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'latex-mode 'flyspell-mode)
;(add-hook 'LaTeX-mode-hook 'flyspell-mode)
;(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
;(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
;(setq reftex-plug-into-AUCTeX t)

(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)

;;(require 'minizinc-mode)
;;(add-to-list 'auto-mode-alist '("\\.mzn\\'" . minizinc-mode)) THIS IS SHIT

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(company-ghc-autoscan t)
 '(company-ghc-show-info t)
 '(custom-enabled-themes (quote (solarized-light)))
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "0c49a9e22e333f260126e4a48539a7ad6e8209ddda13c0310c8811094295b3a3" "05c3bc4eb1219953a4f182e10de1f7466d28987f48d647c01f1f0037ff35ab9a" default)))
 '(display-time-24hr-format t)
 '(display-time-mode t)
 '(global-flycheck-mode t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-add-package t)
 '(haskell-process-suggest-hoogle-imports t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-tags-on-save t)
 '(icomplete-mode t)
 '(ido-mode t nil (ido))
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (company-ghc flycheck flycheck-haskell flymake-haskell-multi haskell-mode solarized-theme evil company)))
 '(scroll-bar-mode nil)
 '(setq solarized-use-more-italic)
 '(show-paren-mode t)
 '(solarized-high-contrast-mode-line t)
 '(solarized-use-more-italic t)
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ghc-face-error ((t nil)))
 '(ghc-face-warn ((t nil))))

;(setq frame-title-format
;      (list (format "%s %%s: %%j " (system-name))
;	    '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(unless package-archive-contents (package-refresh-contents))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(set-face-attribute 'default nil :height 112)
;sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
(eval-after-load 'haskell-mode
  '(define-key haskell-mode-map [f8] 'haskell-navigate-imports))

(eval-after-load 'haskell-mode '(progn
  (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
  (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
  (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
  (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
  (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)))
(eval-after-load 'haskell-cabal '(progn
  (define-key haskell-cabal-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
  (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
  (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)))
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-haskell-setup))

(let ((my-cabal-path (expand-file-name "~/.cabal/bin")))
  (setenv "PATH" (concat my-cabal-path ":" (getenv "PATH")))
  (add-to-list 'exec-path my-cabal-path))

;(add-hook 'c++-mode-hook
;          (lambda () (setq flycheck-clang-include-path
;                           (list (expand-file-name "/usr/include/c++/4.8/")))))

;(setq ghc-debug t)

(defun find-user-init-file ()
  "Edit the `user-init-file', in another window."
  (interactive)
  (find-file-other-window user-init-file))

(global-set-key (kbd "C-c i") 'find-user-init-file)
(global-set-key (kbd "C-ö") 'previous-multiframe-window)
(global-set-key (kbd "C-ä") 'next-multiframe-window)

(add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++11")))
(add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-language-standard "c++11")))

(add-hook 'python-mode-hook
      (lambda ()
        (setq indent-tabs-mode nil)
        (setq tab-width 4)
        (setq python-indent 4)))

(add-to-list 'load-path "~/.emacs.d/lisp/")
;;(load "minizinc")

;; Evil Mode
(require 'evil)
(evil-mode 1)

;; last row
(remove-hook 'haskell-mode-hook (lambda nil (ghc-init) (flymake-mode)))
