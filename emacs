;;
;; VARIABLES
;;
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
(setq read-buffer-completion-ignore-case t)
(setq visible-cursor 'nil)

;; 
;; BACKUPS
;;
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.emacs.tildes"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t       ; use versioned backups
   auto-save-list-file-prefix "~/.emacs.auto-save-list/.saves-")

;;
;;
;;
(add-to-list 'load-path "~/emacs.d/packages/emacs-tiny-tools/lisp/tiny")
(add-to-list 'load-path "~/emacs.d/packages/emacs-tiny-tools/lisp/other")
(add-to-list 'load-path "~/emacs.d/misc")
;;(require 'tinybuffer)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(color-theme-history-max-length 30)
 '(safe-local-variable-values (quote ((sh-indent-comment . t)))))

  ;; (custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  ;;  '(font-lock-comment-face ((((class color) (min-colors 8) (background light)) (:foreground "black")))))

;;
;; Color Theme
;;
(add-to-list 'load-path "~/.emacs.d/packages/color-theme-6.6.0")
(require 'color-theme)
;;(eval-after-load "color-theme"
;;  '(progn
;;     (color-theme-initialize)
;;     (color-theme-hober)))

;;
;; Do Re Mi
;;
(add-to-list 'load-path "~/.emacs.d/packages/doremi")

;;
;; Ring
;;
(add-to-list 'load-path "~/.emacs.d/packages/ring")

;;
;; json-mode
;;
(add-to-list 'load-path "~/.emacs.d/misc")
(require 'json-mode)
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
