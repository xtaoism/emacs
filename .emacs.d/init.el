;;; init.el --- Spacemacs Initialization File
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; Without this comment emacs25 adds (package-initialize) here
;; (package-initialize)

;; Increase gc-cons-threshold, depending on your system you may set it back to a
;; lower value in your dotfile (function `dotspacemacs/user-config')
(setq gc-cons-threshold 100000000)

;;; litao
(setq c-basic-offset 4); c c++ 缩进4个空格
(setq c-default-style "linux"); 防止{} 出现问题

;; 行号
(global-linum-mode t)

;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode 1)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)



;;hight-symbol
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'highlight-symbol)
(global-set-key [(control f3)] 'highlight-symbol)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-query-replace)

;;idle-highlight-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'idle-highlight-mode)
;(autoload 'idle-highlight-mode "idle-highlight" "highlight the word the point is on" t)
;(add-hook 'find-file-hook 'idle-highlight-mode)
;(add-hook 'emacs-lisp-mode-hook 'idle-highlight-mode) 
;(add-hook 'python-mode-hook 'idle-highlight-mode) 
;(add-hook 'js-mode-hook 'idle-highlight-mode)
;(add-hook 'prog-mode-hook 'idle-highlight-mode) ; all programing language
(add-hook 'prog-mode-hook (lambda () (idle-highlight-mode t)))



(defconst spacemacs-version         "0.200.13" "Spacemacs version.")
(defconst spacemacs-emacs-min-version   "24.4" "Minimal version of Emacs.")

(if (not (version<= spacemacs-emacs-min-version emacs-version))
    (error (concat "Your version of Emacs (%s) is too old. "
                   "Spacemacs requires Emacs version %s or above.")
           emacs-version spacemacs-emacs-min-version)
  (load-file (concat (file-name-directory load-file-name)
                     "core/core-load-paths.el"))
  (require 'core-spacemacs)
  (spacemacs/init)
  (configuration-layer/sync)
  (spacemacs-buffer/display-startup-note)
  (spacemacs/setup-startup-hook)
  (require 'server)
  (unless (server-running-p) (server-start)))
