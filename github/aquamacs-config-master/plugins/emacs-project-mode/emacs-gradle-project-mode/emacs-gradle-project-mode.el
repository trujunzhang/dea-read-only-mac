;; ================================
;; Gradle project-mode
;; Author : Rimero Solutions
;; Created : 7/11/2013
;;
;; License: GNU GPL v3 (http://www.gnu.org/licenses/gpl-3.0.txt)
;;
;; Sypnosis: Gradle support for use with project-mode
;;    - You can run arbitrary Gradle command for a given project
;;    - Wrapper support with fallback on default Gradle command
;;    - Default command line options
;;    - Default JVM options
;;    - You can browse documentation (wiki, guide, apidocs)
;;    - Menubar integration
;;    - Global minor mode with associated keymap
;; ================================
(require 'compile)
(require 'project-mode)
(require 'easymenu)

(defgroup gradle nil
  "Gradle support for project-mode"
  :prefix "gradle-"
  :group 'programming)

(defvar gradle-executable-suffix
  (if (eq system-type 'windows-nt)
      ".bat"
    ""))

(defcustom use-gradle-wrapper-when-possible t
  "Use the Gradle wrapper whenever available"
  :type 'boolean
  :group 'gradle)

(defcustom gradle-cmd-opts "--no-color"
  "Gradle command line options"
  :type '(string)
  :group 'gradle)

(defcustom gradle-jvm-opts ""
  "JVM options to pass to Gradle"
  :type '(string)
  :group 'gradle)

(defcustom gradle-executable "gradle"
  "Path to Gradle executable.
  By default, it's assumed that gradle is in your PATH variable."
  :type '(string)
  :group 'gradle)

(defcustom gradle-url-documentation "http://www.gradle.org/documentation"
  "Gradle documentation URL"
  :type 'string
  :group 'gradle)

(defcustom gradle-url-apidocs "http://www.gradle.org/docs/current/javadoc/index.html"
  "Gradle API documentation URL"
  :type 'string
  :group 'gradle)

(defcustom gradle-url-guide "http://www.gradle.org/docs/current/userguide/userguide_single.html"
  "Gradle Latest Guide URL"
  :type 'string
  :group 'gradle)

(defun gradle/browse-url-documentation ()
  "Browse the documentation"

  (interactive)
  (if (boundp 'gradle-url-documentation)
      (browse-url gradle-url-documentation)
    (message "No Gradle docs URL set. Customize the 'gradle' group")))

(defun gradle/browse-api-docs ()
  "Browse the API Documentation"

  (interactive)
  (if (boundp 'gradle-url-apidocs)
      (browse-url gradle-url-apidocs)
    (message "No Gradle API URL set. Customize the 'gradle' group")))


(defun gradle/browse-latest-guide ()
  "Browse the official Gradle Guide"

  (interactive)
  (if (boundp 'gradle-url-guide)
      (browse-url gradle-url-guide)
    (message "No Gradle URL guide set. Customize the 'gradle' group")))

(defun gradle/command (str)
  "Run a Gradle command (Non interactive)"

  (project-ensure-current)

  (let ((default-directory (expand-file-name (project-default-directory (project-current)))))
    (let ( (gradle-commandLine gradle-executable))
      ;; runs the gradle command from the project directory
      (when use-gradle-wrapper-when-possible
        (when (file-exists-p (concat default-directory "gradlew" gradle-executable-suffix))
          (setq gradle-commandLine (concat default-directory "gradlew" gradle-executable-suffix))))

      (let ((gradle-cmd (concat gradle-commandLine " " gradle-jvm-opts " " gradle-cmd-opts " " str)))
        (async-shell-command gradle-cmd "*Gradle*")))))

(defun gradle/read-param-and-run (input-hint gradle-command)
  "Read an input parameter and invoke a given Gradle command"

  (setq gradle-command-argument (read-from-minibuffer input-hint))
  (gradle/command (concat gradle-command " " gradle-command-argument)))

(defun gradle/icommand ()
  "Invoke a Gradle task (Interactive)"

  (interactive)
  (gradle/read-param-and-run "Task:" ""))

(defmacro make-gradle-task (fname fdescription fparams)
  (let ((funsymbol (intern (concat fname))))
    `(defun ,funsymbol()
       ,fdescription
       (interactive)
       (when 'project-name
         (gradle/command ,fparams)))))

(make-gradle-task "gradle/refresh-dependencies"
                  "Refresh Dependencies"
                  "--refresh-dependencies")

(make-gradle-task "gradle/list-tasks"
                  "List tasks"
                  "tasks")

(make-gradle-task "gradle/clean"
                  "Clean project"
                  "clean")

(make-gradle-task "gradle/build"
                  "Build project"
                  "build")

(make-gradle-task "gradle/test"
                  "Run tests"
                  "test")

(defvar emacs-gradle-minor-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-c 'rd")  'gradle/refresh-dependencies)
    (define-key map (kbd "C-c 'lt")  'gradle/list-tasks)
    (define-key map (kbd "C-c 'cc")  'gradle/icommand)
    (define-key map (kbd "C-c 'cl")  'gradle/clean)
    (define-key map (kbd "C-c 'b")   'gradle/build)
    (define-key map (kbd "C-c 't")   'gradle/test)
    map)
  "Keymap for gradle project-mode minor mode")

(easy-menu-define emacs-gradle-minor-mode-menu emacs-gradle-minor-mode-map
  "Emacs Gradle Project Mode Menu."
  '("Gradle"
    ["List tasks"           gradle/list-tasks t]
    ["Run command"          gradle/icommand t]
    ["Clean"                gradle/clean t]
    ["Refresh dependencies" gradle/refresh-dependencies t]
    ["Build"                gradle/build t]
    ["Test"                 gradle/test t] ))

;;;###autoload
(define-minor-mode emacs-gradle-minor-mode
  "Emacs Gradle Project Mode -- Run Gradle for any project-mode projects."
  :init-value nil
  :lighter " Gradle"
  :keymap 'emacs-gradle-minor-mode-map
  :group  'gradle
  :global t
  (easy-menu-add emacs-gradle-minor-mode-menu))

(provide 'emacs-gradle-project-mode)
