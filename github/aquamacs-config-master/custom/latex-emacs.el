


;; title: 在ubuntu上安装texlive和ctex-kit
;; home: http://pt0079.blogspot.com/2011/10/ubuntutexlivectex-kit.html

;; 下载&安装ctex-kit
;;     mkdir -p ~/texmf/tex/latex
;;     cd ~/texmf/tex/latex
;;     svn co http://ctex-kit.googlecode.com/svn/trunk/ctex
;;   自此，ctex-kit就装好了，非常简单。
;;
;; 安装Adobe字体
;;      http://bbs.ctex.org/viewthread.php?tid=47618 
;;      它们分别是：
;;            AdobeFangsongStd-Regular.otf 
;;            AdobeHeitiStd-Regular.otf 
;;            AdobeKaitiStd-Regular.otf 
;;            AdobeSongStd-Light.otf
;; 用一个简单的例子试一下
;;         \documentclass[adobefonts]{ctexart} 
;;         \begin{document} 
;;           苹果,TeX Live 2009！ 
;;         \end{document}
;;     在命令行下用 xelatex test.tex 进行编译，顺利的话，就得到了pdf文件。


(require 'auto-complete-auctex)

 (setq TeX-PDF-mode t)

(add-hook 'LaTeX-mode-hook (
                            lambda()
                                  (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
                                  (TeX-PDF-mode t)
                                  (setq TeX-command-default "XeLaTeX")
                                  (setq TeX-save-query  nil )
                                  (setq TeX-show-compilation t)
                                  ))


;; 一键编译预览
;; 使用 F10，无须 C-c C-c 





