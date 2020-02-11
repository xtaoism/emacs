
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;set home path
(setq home-path "D:/Program Files/emacs-24.4-bin-i686-pc-mingw32/")

;(setq pythonversion "27")
;(setq program-path "D:/Program Files/emacs-24.4-bin-i686-pc-mingw32/bin")
;(setenv "PATH" (concat (concat program-path"python"pythonversion";") (getenv "PATH")))
(setq default-directory "E:/")

;;(add-to-list 'load-path (concat home-path"share/emacs/site-lisp/color-theme-6.6.0/themes"))
(require 'color-theme)
(color-theme-initialize)
;;(color-theme-bharadwaj-slate)
;;(color-theme-gnome2)
;;(color-theme-bippblopp)
(load-theme 'manoj-dark)

;;显示列号
(column-number-mode t)
(line-number-mode t)

;;支持 emacs 和外部程序的粘贴
(setq x-select-enable-clipboard t)

;;关闭启动画面
(setq inhibit-startup-message t)

;;代码折叠功能:系统自带功能
(load-library "hideshow")    ;;开启代码折叠功能
(add-hook 'c-mode-hook 'hs-minor-mode)    ;;C文件折叠功能
(add-hook 'c++-mode-hook 'hs-minor-mode)    ;;C++文件折叠功能
(add-hook 'go-mode-hook 'hs-minor-mode)    ;;GO文件折叠功能
(add-hook 'python-mode-hook 'hs-minor-mode)    ;;Python文件折叠功能
(add-hook 'javascript-mode-hook 'hs-minor-mode)    ;;Javascript文件折叠功能
;;(global-set-key (kbd "C--") 'hs-hide-block)    ;;折叠代码 (键绑定)
;;(global-set-key (kbd "C-=") 'hs-show-block)    ;;打开折叠 (键绑定)
;;(global-set-key (kbd "C-<") 'hs-hide-all)    ;;折叠全部代码 (键绑定)
;;(global-set-key (kbd "C->") 'hs-show-all)    ;;展开全部折叠 (键绑定)

;;;;ejb 快捷键
(global-set-key (kbd "C-<left>") 'windmove-left)   ;左边窗口
(global-set-key (kbd "C-<right>") 'windmove-right) ;右边窗口
(global-set-key (kbd "C-<up>") 'windmove-up)       ;上边窗口
(global-set-key (kbd "C-<down>") 'windmove-down)   ;下边窗口

;; yasnippet
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(add-to-list 'load-path (concat home-path"share/emacs/site-lisp/yasnippet-master"))
;;(setq yas-snippet-dirs (concat home-path"share/emacs/site-lisp/yasnippet-master/snippets/"))
(require 'yasnippet)
(yas-global-mode 1)
(setq ac-source-yasnippet nil) ;; add it because error running timer ac-update-greedy void-function yas/current-snippet-table when using autocomplete

;;auto-complete必须在cscope前面，否则会出问题
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(add-to-list 'load-path (concat home-path"share/emacs/site-lisp/auto-complete-1.3.1/"))
(require 'auto-complete-config)
;;(add-to-list 'load-path (concat home-path"share/emacs/site-lisp/auto-complete-1.3.1/ac-dict"))
(ac-config-default)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(add-to-list 'load-path (concat home-path"share/emacs/site-lisp"))
(require 'xcscope) ;;加载xcscope 

;;(global-set-key [C-\;] 'ecb-goto-window-edit-last) ;;切换到编辑窗口
;;(global-set-key [C-\'] 'ecb-goto-window-methods) ;;切换到函数窗口
;;(global-set-key [C-.] 'cscope-find-global-definition) ;;搜索定义
;;(global-set-key [C-,] 'cscope-pop-mark) ;; 跳出转向
;;(global-set-key (kbd "<f8>") 'ska-point-to-register)
;;(global-set-key (kbd "<f9>") 'ska-jump-to-register)


(defun mycmd1()
  (interactive)
  (let ((proc (start-process "cmd" nil "find.exe" "/C" "start" "find.exe")))
    (set-process-query-on-exit-flag proc nil))
)
(defun mycmd()
  (interactive)
  (dir "d:")
 ;; (find ". -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' -o -name '*.cxx' -o -name '*.hxx'> cscope.files" )
  (shell))
(defun mycmd2()
 (interactive)
 (shell-command "find.exe . -name \"*.h\" -o -name \"*.c\" -o -name \"*.cpp\" -o -name \"*.java\" -o -name \"*.cs\" -o -name \"*.cxx\" -o -name \"*.hxx\"> cscope.files") 
)

;(define-key global-map [(control f7)]  'mycmd)
(define-key global-map [(control f3)]  'cscope-set-initial-directory)
(define-key global-map [(control f4)]  'cscope-unset-initial-directory)
(define-key global-map [(control f5)]  'cscope-find-this-symbol)
(define-key global-map [(control f6)]  'cscope-find-global-definition)
(define-key global-map [(control <)]  'cscope-find-global-definition-no-prompting)
(define-key global-map [(control >)]  'cscope-pop-mark)
(define-key global-map [(control f9)]  'cscope-next-symbol)
(define-key global-map [(control f10)] 'cscope-next-file)
(define-key global-map [(control f11)] 'cscope-prev-symbol)
(define-key global-map [(control f12)] 'cscope-prev-file)
(define-key global-map [(meta f9)]     'cscope-display-buffer)
(define-key global-map [(meta f10)]    'cscope-display-buffer-toggle)


;;高亮当前行  
(require 'hl-line)  
(global-hl-line-mode t) 
(set-face-background 'hl-line "#3e4446") ;; Set any color as the background face of the current line
(set-face-foreground 'highlight nil) ;; To keep syntax highlighting in the current line
;; for hight line mode
(or (facep 'my-hl-line-face) (make-face 'my-hl-line-face))
(setq hl-line-face 'my-hl-line-face)
(face-spec-set 'my-hl-line-face '((t (
                                      :background "DodgerBlue3"
                                                  ;;:bold
                                                  ;;:weight nil
                                      :inverse-video nil
                                      ))))
(defun wcy-color-theme-adjust-hl-mode-face()
  "interactive"
  (let* ((color  (x-color-values (face-attribute 'default :background))))
    (if (null color)
        (error "not support.")
      (let ((my-color (mapcar
                       (lambda (x)
                         (let ((y (/ #XFFFF 4))
                               (delta #X18FF))
                           (cond
                            ((< x (* y 1))
                             (+ x delta))
                            ((< x (* y 2))
                             (+ x delta))
                            ((< x (* y 3))
                             (- x delta))
                            (t
                             (- x delta)))))
                       color)))
        (message "%S %S" color my-color)
        (set-face-attribute
         'my-hl-line-face nil
         :background
         (concat "#"
                 (mapconcat
                  (lambda (c) (format "%04X" c))
                  my-color
                  "")))))))
(wcy-color-theme-adjust-hl-mode-face)

;; 编辑选项
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; google-style
(setq newline-and-indent 4) ;; must before google-c-style
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
;; 设置tab宽度为2, must follow google-c-style, or tab-width==2  
(setq-default indent-tabs-mode  nil)  
(setq tab-width 2 c-basic-offset 2)
;; 自动缩进的宽度设置为4  
;;(setq c-basic-offset 4)  

;; 显示选项
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;在buffer左侧显示行号  
(dolist (hook (list  
               'c-mode-hook  
               'c++-mode-hook
               'emacs-lisp-mode-hook  
               'lisp-interaction-mode-hook  
               'lisp-mode-hook  
               'emms-playlist-mode-hook  
               'java-mode-hook  
               'asm-mode-hook  
               'haskell-mode-hook  
               'rcirc-mode-hook  
               'emms-lyrics-mode-hook  
               'erc-mode-hook  
               'sh-mode-hook  
               'makefile-gmake-mode-hook  
               ))  
(add-hook hook (lambda () (linum-mode 1))))  

(setq frame-title-format "%b") ;; 在标题栏显示buffer的名字(默认不显示)  
(which-function-mode) ;; 在模式栏中显示当前光标所在函数  

;;滚动页面时比较舒服，不要整页的滚动  
(setq scroll-step 1  
      scroll-margin 3  
      scroll-conservatively 10000)  
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
 '(default ((t (:family "Monaco" :foundry "outline" :slant normal :weight normal :height 96 :width normal)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 自定义注释
(defun qiang-comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command. If no region is selected and current line is not blank and we are not at the end of the line, then comment current line. Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))
(global-set-key (kbd "C-;") 'qiang-comment-dwim-line) 

;; 自定义折叠
(defun my-toggle-selective-display()
  "set-selective-display to current column or toggle
selective-display --lgfang"
  (interactive)
  (let ((arg (progn (back-to-indentation) (current-column))))
    (set-selective-display (if (eq arg selective-display) nil arg))))
(define-key global-map (kbd "C-'") 'my-toggle-selective-display)

;; 快速鼠标移动
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'ace-jump-mode)
(autoload
  'ace-jump-mode
  "ace-jump-mode" t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))

(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; goto-last-change
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'goto-last-change)
(global-set-key "\C-x\C-\\" 'goto-last-change)


;; hideif.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'hideif)
(setq hide-ifdef-initially t)
(add-hook 'c-mode-common-hook
          (lambda ()
            (setq hide-ifdef-shadow t)
            (setq hide-ifdef-mode t)
            (hide-ifdefs)
            ))
;; 无效代码变为灰色
(setq hide-ifdef-shadow t)
;; 无效代码被折叠隐藏变为...
;; (setq hide-ifdef-shadow nil)       
          
;;set transparent effect
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key [(C-f11)] 'loop-alpha)
(setq alpha-list '((45 35) (55 45) (75 65) (85 75) (95 85) (100 100)))
(defun loop-alpha ()
  (interactive)
  (let ((h (car alpha-list))) ;; head value will set to
    ((lambda (a ab)
       (set-frame-parameter (selected-frame) 'alpha (list a ab))
       (add-to-list 'default-frame-alist (cons 'alpha (list a ab)))
       ) (car h) (car (cdr h)))
    (setq alpha-list (cdr (append alpha-list (list h))))
    )
)

;;set replace, case sensitive
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defadvice replace-string (around turn-off-case-fold-search)
 (let ((case-fold-search nil))
 ad-do-it))
(ad-activate 'replace-string)

;(global-set-key (kbd "meta-r") 
; (lambda () 
;  (interactive) 
;  (let ((case-fold-search nil)) 
;  (call-interactively 'replace-string))))

;;windows switch
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'switch-window)
(global-set-key (kbd "C-x o") 'switch-window)

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

;;helm-ag
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path (concat home-path"share/emacs/site-lisp/helm-ag/emacs-async-master"))
(add-to-list 'load-path (concat home-path"share/emacs/site-lisp/helm-ag/helm-master"))
(require 'helm-ag)


;; auto-save
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
(add-to-list 'load-path (concat home-path"share/emacs/site-lisp/extensions/lazyer"))	  
(require 'auto-save)            ;; 加载自动保存模块
(auto-save-enable)              ;; 开启自动保存功能
(setq auto-save-slient t)       ;; 自动保存的时候静悄悄的， 不要打扰我

;; tabbar
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
(add-to-list 'load-path (concat home-path"share/emacs/site-lisp/extensions/tabbar-1.3"))
(require 'tabbar)	
(tabbar-mode t)
(global-set-key [(control shift tab)] 'tabbar-backward)
(global-set-key [(control tab)] 'tabbar-forward)
(setq tabbar-buffer-groups-function
    (lambda (b) (list "All Buffers")))
(setq tabbar-buffer-list-function
    (lambda ()
        (remove-if
          (lambda(buffer)
             (find (aref (buffer-name buffer) 0) " *"))
          (buffer-list))))

;; restore the files status when emacs was closed last time
;; it must be located in the end of the file(.emacs)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load "desktop") 
(desktop-load-default)
(desktop-read)
;;save the files status when emacs is closed
(add-hook 'kill-emacs-hook
          '(lambda()(desktop-save "~/")))
		  
(set-default-font "InconsolataGo")
		  
		  






