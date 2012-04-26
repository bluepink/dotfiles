
;; 

;; load-path 

;; __________________________________________________________________



;; load-path を追加する関数を定義
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

;; elispとconfディレクトリをサブディレクトリごとload-pathに追加
(add-to-load-path "elisp" "conf" "public_repos" )







;; 

;; package.elの設定

;; ____________________________________________________________________

(when (require 'package nil t)
  ;; パッケージリポジトリにMarmaladeと開発者運営のELPAを追加
  (add-to-list 'package-archives
               '("marmalade" . "http://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/"))
  ;; インスツールしたパッケージにロードパスを通して読み込む
  (package-initialize))







;; 

;; miscellaneous

;; _____________________________________________________________________



;; ターミナル以外ではツールバー、スクロールバーを非表示
(when window-system
  (tool-bar-mode 0)
  (set-scroll-bar-mode nil)
  (menu-bar-mode 0))
  







;; (tool-bar-mode -1) ;;tool barを隠す

;; (menu-bar-mode -1);;メニューバーを消す

;(add-to-list 'default-frame-alist '(cursor-type . 'hbar)) ;; カーソル下線

;; (set-scroll-bar-mode nil) ;; スクロールバー無し



(setq visible-bell t) ;Beep off

(setq inhibit-startup-message t)              ; title off

(setq ring-bell-function 'ignore)   ; flash off

(setq frame-title-format (format "%%f" (system-name)))   ; path title

;; ファイルサイズを表示

(size-indication-mode t) 


;; metaキーの変更

(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))




;;カーソルの点滅

(blink-cursor-mode t)


;;カーソルbの位置

(column-number-mode t)


;;カーソルの形

(set-default 'cursor-type '(hbar . 3)) 


;;; モードラインに時間を表示する

(display-time-mode 1)


;;スクロールを１行ずつ

(setq scroll-step 1)


;; Tab文字にスペースを使用

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;;  行番を表示

(global-linum-mode)                     
(setq linum-format "%4d")




;; 行間
;; (setq-default line-spacing 4)


;; マウス・スクロールを滑らかにする（Mac Emacs 専用）
(setq mac-mouse-wheel-smooth-scroll t)

;; ウィンドウ（フレーム）のサイズ設定する
(setq default-frame-alist
      '((width . 88) (height . 49)))

;;(setq-default indent-tabs-mode nil) ;タブを使用せずにスペースを利用する


;; Transprency

(add-to-list 'default-frame-alist '(alpha . (89 70)))

;; オートセーブファイルを作らない
(setq auto-save-default nil)




;; yesは邪魔臭いからy
(defalias 'yes-or-no-p 'y-or-n-p)


;;; Mac でファイルを開いたときに、新たなフレームを作らない
(setq ns-pop-up-frames nil)


;; ctrをosに渡さない

;; (mac-add-ignore-shortcut '(control))








;; 対応する括弧を光らせる

(setq show-paren-delay 0)
(show-paren-mode 1)
;; ;; parenのスタイル: expressionは括弧内も強調表示
;; (setq show-paren-style 'expression)
;; ;; フェイスを変更する
;; (set-face-background 'show-paren-match-face nil)
;; (set-face-underline-p 'show-paren-match-face "yellow")









;;; 改行やタブを可視化する whitespace-mode
(setq whitespace-display-mappings
      '((space-mark ?\x3000 [?\□]) ; zenkaku space
        (newline-mark 10 [8629 10]) ; newlne
        (tab-mark 9 [187 9] [92 9]) ; tab » 187
        )
      whitespace-style
      '(spaces
        ;; tabs
        trailing
        newline
        space-mark
        tab-mark
        newline-mark))
;; whitespace-modeで全角スペース文字を可視化　
(setq whitespace-space-regexp "\\(\x3000+\\)")
;; whitespace-mode をオン
(global-whitespace-mode t)
;; F5 で whitespace-mode をトグル
(define-key global-map (kbd "<f5>") 'global-whitespace-mode)













;;

;; Tabber-ruler

;; _________________________________________________________________




(setq tabbar-ruler-global-tabbar 't) ; If you want tabbar
;; (setq tabbar-ruler-global-ruler 't) ; if you want a global ruler
;; (setq tabbar-ruler-popup-menu 't)   ; If you want a popup menu.
;; (setq tabbar-ruler-popup-toolbar 't) ; If you want a popup toolbar

(require 'tabbar-ruler)






;;

;; sr-speedbar

;; __________________________________________________________________________

(require 'sr-speedbar)
(setq sr-speedbar-right-side nil)









;;

;; sticky.el    shift１回押し

;; __________________________________________________________

;; (require 'sticky)
;; (use-sticky-key ";" sticky-alist:en)












;; 日本語環境


(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)












;; 

;; 環境変数を設定

;; ___________________________________________________________________

(add-to-list 'exec-path "/Users/Tomo/bin")
(add-to-list 'exec-path "/usr/local/bin")


















;; 
;; 文字コードの設定 (MacOSX)
;; ____________________________________________________________________

(when (eq system-type 'darwin)
  (require 'ucs-normalize)
  (set-file-name-coding-system 'utf-8-hfs)
  (setq locale-coding-system 'utf-8-hfs))













;; 

;; キーバインド
                                   
;;_________________________________________________________________________


;; "C-t"でウィンドウを切り替える
(define-key global-map (kbd "C-t") 'other-window)


;; C-mにnewline-and-indentを割り当てる
(global-set-key (kbd "C-m") 'newline-and-indent)



;; sr-speedbar
(global-set-key (kbd "s-s") 'sr-speedbar-toggle)

;; Display Line Number
(global-set-key "\M-n" 'linum-mode)













;;
;; Color
;;______________________________________________________________________




(if window-system (progn

  ;; 文字の色を設定します。
  (add-to-list 'default-frame-alist '(foreground-color . "gray100"))
  ;; 背景色を設定します。
  (add-to-list 'default-frame-alist '(background-color . "gray0"))
  ;; カーソルの色を設定します。
  (add-to-list 'default-frame-alist '(cursor-color . "OliveDrab3"))
  ;; マウスポインタの色を設定します。
  (add-to-list 'default-frame-alist '(mouse-color . "DodgerBlue2"))
  ;; モードラインの文字の色を設定します。
  (set-face-foreground 'modeline "grey92")
  ;; モードラインの背景色を設定します。
  (set-face-background 'modeline "grey23")
  ;; 選択中のリージョンの色を設定します。
  (set-face-background 'region "OliveDrab")
  ;; モードライン（アクティブでないバッファ）の文字色を設定します。
  (set-face-foreground 'mode-line-inactive "gray60")
  ;; モードライン（アクティブでないバッファ）の背景色を設定します。
  (set-face-background 'mode-line-inactive "gray0")

))


(if window-system (progn

(set-face-foreground 'font-lock-comment-face "AntiqueWhite4")
(set-face-foreground 'font-lock-string-face  "LightSteelBlue3")
(set-face-foreground 'font-lock-keyword-face "darkolivegreen1")
(set-face-foreground 'font-lock-function-name-face "darkkhaki")
(set-face-bold-p 'font-lock-function-name-face t)
(set-face-foreground 'font-lock-variable-name-face "plum1")
(set-face-foreground 'font-lock-type-face "LavenderBlush3")
(set-face-foreground 'font-lock-builtin-face "lavender")
(set-face-foreground 'font-lock-constant-face "orchid1")
(set-face-foreground 'font-lock-warning-face "blue")
(set-face-bold-p 'font-lock-warning-face nil)

))









;; 
;; 行のハイライト
;; 
;; hl-line-mode_____________________________________________________________



;; (defface my-hl-line-face
;;   ;;  背景が dark ならば 背景を黒に.
;;   '((((class color) (background dark))
;;      (:background "grey1" t))
;;     ;; 背景が light ならば背景色を緑に
;;     (((class color) (background light))
;;      (:background "LightGoldenrodYellow" t))
;;     (t (:bold t)))
;;   "hl-line's my face")
;; (setq hl-line-face 'my-hl-line-face)
;; (global-hl-line-mode t)













;; 

;;  フォント  (window-system only)

;; ________________________________________________________-



(when window-system



;; 日本語

(set-fontset-font
 nil 'japanese-jisx0208
 (font-spec :family "Kozuka Gothic Pro"))


;; 英語 asciiフォントをMonacoに

(set-face-attribute 'default nil
                    :family "Monaco"
                    :height 120)




;; Font rescale

(setq face-font-rescale-alist           
      '((".*Monaco.*" . 1.0)
        (".*Kozuka_Gothic_Pro.*" . 1.2)
        ("-cdac$" . 1.3)))



)











;; 

;; auto-installの設定

;; ____________________________________________________________

(when (require 'auto-install nil t)
  (setq auto-install-directory "~/.emacs.d/elisp/")
  (auto-install-update-emacswiki-package-name t)
  ;; 必要であればプロシキの設定を行う
  ;; (setq url-proxy-services '(("http" . "localhost:8339")))
  (auto-install-compatibility-setup))





;; 

;; auto-completeの設定

;; ____________________________________________________________

(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories
               "~/.emacs.d/elisp/ac-dict")
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
(ac-config-default))



               




;; 

;; color-moccurの設定

;; ____________________________________________________________


(when (require 'color-moccur nil t)
  ;; M-oにoccurを割り当て
  (define-key global-map (kbd "M-o") 'occur-by-moccur)
  ;; スペース区切りでAND検索
  (setq moccur-split-word t)
  ;; ディレクトリ検索のとき除外するファイル
  (add-to-list 'dmoccur-exclusion-mask "\\.DS_Store")
  (add-to-list 'dmoccur-exclusion-mask "^#.+#$")
  ;; Migemoを利用できる環境であればMigemoを使う
  (when (and (executable-find "cmigemo")
             (require 'migemo nil t))
    (setq moccur-use-migemo t)))


;; moccur-editの設定
(require 'moccur-edit nil t)



;; moccur-edit-finish-editと同時にファイルを保存する
(defadvice moccur-edit-change-file
  (after save-after-moccur-edit-buffer activate)
  (save-buffer))









;; 

;; multi-termの設定

;; ________________________________________________________


(when (require 'multi-term nil t)
  (setq multi-term-program "/usr/local/bin/zsh"))



(custom-set-variables
     '(term-default-bg-color "#000000")        ;; background color (black)
     '(term-default-fg-color "#FFFFFF"))       ;; foreground color (white)




; Emacs が保持する terminfo を利用する
(setq system-uses-terminfo nil)



;; C-x C-c ESCは端末に渡さない
(setq term-unbind-key-list '("C-x" "C-c" "<ESC>"))

;; 以下のコマンドを使えるようにする
(setq term-bind-key-alist
      '(("C-c C-c" . term-interrupt-subjob)
        ("C-m" . term-send-raw)
        ("M-f" . term-send-forward-word)
        ("M-b" . term-send-backward-word)
        ("M-p" . term-send-up)
        ("M-n" . term-send-down)
        ("M-M" . term-send-forward-kill-word)
        ("M-N" . term-send-backward-kill-word)
        ("M-r" . term-send-reverse-search-history)))


        
         
        






;; ;; 

;; ;; SKK

;; ;; ____________________________________________________________________

;; ;; C-j の機能を別のキーに割り当て
;; (global-set-key (kbd "C-m") 'newline-and-indent)
;; ;; C-\ でも SKK に切り替えられるように設定
;; (setq default-input-method "japanese-skk")
;; ;; 送り仮名が厳密に正しい候補を優先して表示
;; (setq skk-henkan-strict-okuri-precedence t)
;; ;;漢字登録時、送り仮名が厳密に正しいかをチェック
;; (setq skk-check-okurigana-on-touroku t)










;; 

;; HTML編集のデフォルトモードをnxml-modeにする

;; (HTML4は"M-x html-mode"で切り替える)

;; ___________________________________________________________________________

(add-to-list 'auto-mode-alist '("\\.[sx]?html?\\(\\.[a-zA-Z_]+\\)?\\'" . nxml-mode))



;;  HTML5

(eval-after-load "rng-loc"
  '(add-to-list 'rng-schema-locating-files
                "~/.emacs.d/public_repo/html5-el/schemas.xml"))
(require 'whattf-dt)

;; </を入力すると自動的にタグを閉じる
(setq nxml-slash-auto-complete-flag t)
;; M-TAB出タグを保管する
(setq nxml-bind-meta-tab-to-complete-flag t)
;; nxml-modeでauto-complete-modeを利用する　
(add-to-list 'ac-modes 'nxml-mode)

;; ;; 子要素のインテンド幅を設定する。初期値は２
;; (setq nxml-child-indent 0)
;; ;; 属性値のインデント幅を設定する。初期値は４
;; (setq nxml-attribute-indent 0)







;;

;; CSS

;; _________________________________________________________________________

(defun css-mode-hooks ()
  "css-mode hooks"
  ;; インデントをCスタイルにする
  (setq cssm-indent-function #'cssm-c-style-indenter)
  ;; インデント幅を２にする
  (setq cssm-indent-level 2)
  ;; インデントにタブ文字を使わない
  (setq-default indent-tabs-mode nil)
  ;; 閉じカッコの前に改行を挿入する
  (setq cssm-newline-before-closing-bracket t))

(add-hook 'css-mode-hook 'css-mode-hooks)










;;

;; Javascript

;; _________________________________________________________________________

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(add-hook 'js2-mode-hook 'js-indent-hook)







;;

;; Ruby-mode

;; _________________________________________________________________

 (setq ruby-indent-level 3 ; インデント幅を３に。初期値は２
       ruby-deep-indent-pare-syle nil ; 改行時のインテンドを調整する
       ;; ruby-mode実行時にindent-tabs-modeを設定値に変更
       ruby-indent-tabs-mode t) ; タブ文字を使用する。初期値はnil


;; 括弧の自動挿入
(require 'ruby-electric nil t)
;; endに対応する行のハイライト　
(when (require 'ruby-block nil t)
  (setq ruby-block-highlight-toggle t))
;; インタラクティブRubyを利用する
(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")

;; ruby-mode-hook用の関数を定義
(defun ruby-mode-hooks ()
  (inf-ruby-keys)
  (ruby-electric-mode t)
  (ruby-block-mode t))
  ;; ruby-mode-hookに追加
(add-hook 'ruby-mode-hook 'ruby-mode-hooks)








;;

;; Rails

;; ________________________________________________________



(when (require 'rhtml-mode nil t)
  (add-to-list 'auto-mode-alist '("\\.rhtml\\'" . rhtml-mode)))










;;

;; Objective-C

;; ___________________________________________________________


(add-to-list 'auto-mode-alist '("\\.mm?$" . objc-mode))
(add-to-list 'auto-mode-alist '("\\.h$" . objc-mode))

(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@implementation" . objc-mode))
(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@interface" . objc-mode))
(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@protocol" . objc-mode))



;; C-c o で対応するファイルを開く
(setq ff-other-file-alist
     '(("\\.mm?$" (".h"))
       ("\\.cc$"  (".hh" ".h"))
       ("\\.hh$"  (".cc" ".C"))

       ("\\.c$"   (".h"))
       ("\\.h$"   (".c" ".cc" ".C" ".CC" ".cxx" ".cpp" ".m" ".mm"))

       ("\\.C$"   (".H"  ".hh" ".h"))
       ("\\.H$"   (".C"  ".CC"))

       ("\\.CC$"  (".HH" ".H"  ".hh" ".h"))
       ("\\.HH$"  (".CC"))

       ("\\.cxx$" (".hh" ".h"))
       ("\\.cpp$" (".hpp" ".hh" ".h"))

       ("\\.hpp$" (".cpp" ".c"))))
(add-hook 'objc-mode-hook
         (lambda ()
           (define-key c-mode-base-map (kbd "C-c o") 'ff-find-other-file)
         ))





;; 補完
;; __________________________________________________________



;; ロード
(require 'auto-complete-config)
(require 'ac-company)
;; 対象の全てで補完を有効にする
(global-auto-complete-mode t)
;; ac-company で company-xcode を有効にする
(ac-company-define-source ac-source-company-xcode company-xcode)
;; objc-mode で補完候補を設定
(setq ac-modes (append ac-modes '(objc-mode)))
;; hook
(add-hook 'objc-mode-hook
         (lambda ()
           (define-key objc-mode-map (kbd "\t") 'ac-complete)
           ;; XCode を利用した補完を有効にする
           (push 'ac-source-company-xcode ac-sources)
           ;; C++ のキーワード補完をする Objective-C++ を利用する人だけ設定してください
           (push 'ac-source-c++-keywords ac-sources)
         ))
;; 補完ウィンドウ内でのキー定義
(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)
(define-key ac-completing-map (kbd "M-/") 'ac-stop)
;; 補完が自動で起動するのを停止
(setq ac-auto-start nil)
;; 起動キーの設定
(ac-set-trigger-key "TAB")
;; 候補の最大件数 デフォルトは 10件
(setq ac-candidate-max 20)













;; _______________ F l y m a k e ____________________________________

;;

;; Makefileがあれば利用し、無ければ直接コマンドを実行

;; ____________________________________________________________





;; Makefileの種類を定義
(defvar flymake-makefile-filenames
  '("Makefile" "makefile" "GUNmakefile")
  "File names for make.")

;; Makefileがなければコマンドを直接利用するコマンドラインを生成
(defun flymake-get-make-gcc-cmdline (source base-dir)
  (let (found)
    (dolist (makefile flymake-makefile-filenames)
      (if (file-readable-p (concat base-dir "/" makefile))
          (setq found t)))
    (if found
        (list "make"
              (list "-s"
                    "-C"
                    base-dir
                    (concat "CHK_SOURCES=" source)
                    "SYNTAX_CHECK_MODE=1"
                    "check-syntax"))
      (list (if (string= (file-name-extension source) "c") "gcc" "g++")
            (list "-o"
                  "/dev/null"
                  "-fsyntax-only"
                  "-Wall"
                  source)))))



;; Flymake初期化関数の設定
(defun Flymake-simple-make-gcc-init-impl
  (create-temp-f use-relative-base-dir
                 use-relative-source build-file-name get-cmdline-f)
  "Create syntax check command line for a directly checked source file.
Use CREATE-TEMP-F for creating temp copy."
  (let* ((args nill)
         (source-file-name buffer-file-name)
         (buildfile-dir (file-name-directory source-file-name)))
    (if buildfile-dir
        (let* ((temp-source-file-name
                (flymake-init-create-temp-buffer-copy create-temp-f)))
          (setq args
                (flymake-get-syntax-check-program-args
                 temmp-source-file-name
                 buildfile-dir
                 use-relative-base-dir
                 use-relative-source
                 get-cmdline-f))))
    args))



;; 初期化関数を定義
(defun flymake-simple-make-gcc-init ()
  (message "%s" (flymake-simple-make-gcc-init-impl
                 'flymake-create-temp-inplace t t "Makefile"
                 'flymake-get-make-gcc-cmdline))
  (flymake-simple-make-gcc-init-impl
   'flymake-create-temp-inplace t t "Makefile"
   'flymake-get-make-gcc-cmdline))


;; ;; 拡張子 .c, .cpp, c++などのときに上記の関数を利用する
;; (add-to-list 'flymake-allowed-file-name-masks
;;              '("\\.\\(?:c\\(?:pp\\|xx\\|\\+\\+\\)?\\|CC\\)\\'"
;;                flymake-simple-make-gcc-init))




