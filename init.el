;; (add-to-list 'load-path "~/.emacs.d/elpa/benchmark-init-20150905.238/")
;; (require 'benchmark-init)

;; Lade benutzerdefinierte Funktionen
;; (load "~/emacs-start-functions.el")


;; Package Archives
;; weitere Installationspakete (weiß nicht, ob nötig, jedes mal zu initialisieren??!!)
;; -> initialisieren ja, add-to-list nein
(require 'package)
(setq package-archives 
      '(("gnu" . "http://elpa.gnu.org/packages/")
	("marmalade" . "http://marmalade-repo.org/packages/")
	("melpa" . "http://melpa.org/packages/")))
(package-initialize)


(load "~/.emacs.d/elisp-files/install-packages.el")

;; Auto-Complete company
(global-company-mode)

;;Slime und CLISP
;(load (expand-file-name "c:\\users\\kaani\\quicklisp\\slime-helper.el"))
; w'scheinlich auch nur einmal nötig
;(add-to-list 'exec-path "C:/Program Files (x86)/Steel Bank Common Lisp/1.3.6/")
(setq inferior-lisp-program "clisp")

;; Zeilennummerierung
(global-linum-mode t)
;; Unten Spalte anzeigen:
(setf column-number-mode t)

;; Highlight matching parens
(show-paren-mode)

;; Keine Scrollbar, menubar, toolbar
(toggle-scroll-bar -1)
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Nervigen Alarmsound deaktivieren
(setf visible-bell t)

;; Dass automatisch beim Kill gespeichert wird
(setq buffer-save-without-query t)

;; Schriftgröße auf 11
(set-face-attribute 'default nil :height 110)

;; Benutze UTF-8
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(setq utf-translate-cjk-mode nil) ; disable CJK coding/encoding (Chinese/Japanese/Korean characters)
(set-language-environment 'utf-8)
(set-keyboard-coding-system 'utf-8-mac) ; For old Carbon emacs on OS X only
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(unless (eq system-type 'windows-nt)
  (set-selection-coding-system 'utf-8))
(prefer-coding-system 'utf-8)

;; Um Abkürzungen zu benutzen
;; Hinzufügen: abkürzendesWort C-x a g aW
;; folgender Befehl "toogelt": (abbrev-mode)
(setq-default abbrev-mode t)

;; Key-Bindings
(global-set-key (kbd "C-z") 'undo)   
(global-set-key (kbd "C-c d") 'diary)
(global-set-key (kbd "C-x C-k k") 'save-and-kill-buffer)

;; Dafür, dass monokai-theme safe ist (das mit latex ist wohl automatisch dazu gekommen, docview auch)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-section-hook
   (quote
    (LaTeX-section-heading LaTeX-section-title LaTeX-section-section)))
 '(custom-safe-themes
   (quote
    ("c59857e3e950131e0c17c65711f1812d20a54b829115b7c522672ae6ba0864cc" default)))
 '(doc-view-dvipdf-program "dvipdfm")
 '(doc-view-ghostscript-program "gswin32c")
 '(package-selected-packages
   (quote
    (ab auctex auctex-latexmk helm-projectile helm-ag helm rainbow-delimiters git-timemachine csv-mode org-bullets magit company paredit clojure-mode-extra-font-locking cider smex rainbow-mode org monokai-theme)))
 '(timeclock-ask-before-exiting nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Monokai Theme
(load-theme 'monokai t)
;; Setze DEFAULT-Ordner auf Dropbox
;; (funktioniert irgendwie nicht...,
;; unter WIN dann einfach "Ausführen in" bei Eigenschaften ändern).
;(setq default-directory "C:/Users/kaani/Dropbox/")

;; Org-Mode activate
(require 'org)
(define-key global-map "\C-ca" 'org-agenda) ; Key combos
(setq org-agenda-files (list "C:/Users/kaani/Dropbox/to-do.org")) ;agenda-files
(setf org-support-shift-select t) ; Shift-Select ermöglichen
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))) ; Bullets statt Sternchen
(setf org-agenda-include-diary t) ; Dass diary Einträge auch in Agenda angezeigt werden

;; Deaktiviere Start-up Screen
(setf inhibit-startup-screen t)

;; Delete Selection Mode
(delete-selection-mode 1)

;; Benutze Smex statt M-x für Vorhersagen
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; Altes M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
;; Bessere List-Buffer
(global-set-key (kbd "C-x C-b") 'ibuffer)


;; Paredit hook für Clojure und Clojurescript
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojurescript-mode-hook 'paredit-mode)

;; Für ClojureScript
(defun cljs-node-repl ()
  (interactive)
  (run-clojure "lein trampoline run -m clojure.main repl.clj"))

;; Für Clojure Test Marcus Datei
(load "~/.emacs.d/elisp-files/marcus-clojure-test-key.el")

;; Timeclock
(global-set-key (kbd "C-x t i") 'timeclock-in)
(global-set-key (kbd "C-x t o") 'timeclock-out)
(global-set-key (kbd "C-x t c") 'timeclock-change)

;; Für mehr Timeclock-Funktionalität
(load "~/.emacs.d/elisp-files/kaan-timeclock.el")
(global-set-key (kbd "C-x t s") 'timeclock-sum-all-hours)
(global-set-key (kbd "C-x t t") 'timeclock-hours-worked-today)
(global-set-key (kbd "C-x t u") 'timeclock-overtime)
(global-set-key (kbd "C-x t f") 'timeclock-open-timelog-file)

;; Um an Timeclock einen Kommentar zu hängen
(load "~/.emacs.d/elisp-files/mikes-timeclock.el")
(global-set-key (kbd "C-x  t d") 'timeclock-provide-description)


;; Aspell Rechtschreibung, Flyspell
;; -- Muss installiert haben in Linux: aspell.
;; -- Dictionary aspell-de
;; -- Setze Sprache: M-x ispell-change-directory -> de_DE
;; -- flyspell-mode
;; Document durchsuchen flyspell-buffer
;; Wort korrigieren/hinzufügen: flyspell correct-word-before-point
;; Hilfsfunktion:
(defun flyspell-save-and-search ()
  (interactive)
  (let ((current-location (point))
	(word (flyspell-get-word)))
    (when (consp word)    
      (flyspell-do-correct 'save nil (car word) current-location (cadr word) (caddr word) current-location))))
(global-set-key (kbd "C-c s") 'flyspell-save-and-search)
