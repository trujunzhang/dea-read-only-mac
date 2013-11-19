
;;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;  https://code.google.com/p/emacs-project-mode/wiki/QuickStart
;;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


;;
;;Installation
;;Make sure the project-mode source code is somewhere in your LOAD-PATH (like in the site-lisp directory).
;;Do the same for any dependencies:
;;Dependency: levenshtein.el
;;Modify your .emacs file in your home directory. In Windows sometimes .emacs ends up in AppData\Roaming.
;;(require 'project-mode)
;;(project-load-all) ; Loads all saved projects. Not required.
;;Or you might like this method:
;;(autoload 'project-mode "project-mode" "Project Mode" t)
;;Key Bindings
;;This guide mentions function names, but not key bindings. You can discover the key bindings a few different ways. Use the "Project" menu (enabled with (project-display-menu)). You might try C-h b and look for the functions that begin with "project-" and of course you can just look at the source code since all the key bindings are shown in a single area.

;;Create a project
;;(project-new)
;;You're prompted to enter a project name and project directory.
;;Multiple projects can be loaded at the same time.
;;Search Path: Projects have a list of directories called the search-path. The default directory of a project is the first directory in its search-path.
;;When a project is created it is then automatically selected and made the current project.
;;Too see the currently selected project use (project-show-current-name).
;;Saving and loading projects
;;To save the current project use (project-save).
;;A file will be written to ~/.emacs.d/PROJECT-NAME.proj.
;;To save all projects use (project-save-all).
;;To load a project use (project-load).
;;To load all projects use (project-load-all).
;;Selecting a project
;;(project-choose)
;;When a project is selected a few things happen:
;;Default Directory: The Emacs default-directory is changed to the projects default directory. The default directory is the first directory in the project's search-path.
;;Path Cache: When a project is created or selected a path-cache is created. This path-cache constitutes the files in your project. You can view it with (project-view-path-cache). All files in the project's search-path are included except those that are explicitly excluded using project-search-exclusion-regexes-default. If you want to open a file from the list of files in the path-cache dump buffer use (project-open-file-on-line).
;;Tags: A "TAGS" file is opened if it already exists in the directory. It is not automatically created because of the potential overhead. If you would like to generate the "TAGS" file use (project-tags-refresh).
;;Finding Files (opening files)
;;Find a file with a fuzzy file name match:
;;(project-fuzzy-search)
;;Starts a fuzzy file name search
;;Enter a file name you know exists in the project files. If no files are found that are considered to be reasonable matches, nothing will open. If multiples are returned, you can select the one you want. If there is just one match, it is opened automatically.
;;Find a file using a regular expression file name match:
;;(project-regex-search)
;;Functions similarly to a fuzzy search.
;;HINT: To get a list of files with a given extension you might try: \.rb$ or just rb$ or groovy$ or java$ or \.c$.
;;Full-Text Search
;;Full-text search:
;;(project-search-text)
;;(project-search-text-next)
;;(project-search-text-previous)
;;You will notice a buffer is created with a list of all matches. The next and and previous functions simply navigate that buffer. Therefore you you can control the results by modifying the buffer. For example, you can remove matches you don't want or advance the cursor to the point where you want (project-search-text-next) to start. You can also use (project-open-match-on-line) to open the match at point.
;;Editing Search Paths and Path Cache
;;(project-edit-search-paths)
;;(project-edit-path-cache)
;;Make your modifications and C-c C-c to save.



(setq plugins-root-dir (concat config-root-dir "/plugins"))
(setq project-mode-dir (concat plugins-root-dir "/emacs-project-mode"))
(setq gradle-project-dir (concat project-mode-dir "/emacs-gradle-project-mode"))

(add-to-list 'load-path plugins-root-dir)
(add-to-list 'load-path (expand-file-name project-mode-dir))
(add-to-list 'load-path (expand-file-name gradle-project-dir))

(require 'project-mode)
(project-load-all) ; Loads all saved projects. Not required.




;;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;; url: https://github.com/rimerosolutions/emacs-gradle-project-mode
;;   gradle-project-mode
;;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

;;  Configuration
;; Put the emacs-gradle-project-mode.el file in the folder of your choice and add it to the load-path.

;; Assuming that emacs-gradle-project-mode.el is in ~/.emacs.d/vendor
(require 'emacs-gradle-project-mode)
;; You can load automatically both project-mode and emacs-gradle-project-mode with the following lines:

(emacs-gradle-minor-mode t)
;; You can toggle emacs-gradle-minor-mode using M-x emacs-gradle-minor-mode.