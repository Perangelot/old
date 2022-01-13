;; Load the publishing system
(require 'ox-publish)

(message "Build complete!")

;; Customize the HTML output; org-html-head bestimmt Aussehen!
(setq org-html-validation-link nil            ;; Don't show validation link
      org-html-head-include-scripts nil       ;; Use our own scripts
      org-html-head-include-default-style nil ;; Use our own styles
      org-html-head "<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.min.css\" />")

;; Define the publishing project
(setq org-publish-project-alist
      (list ; 2 verschachtelte Listen, weil jede Liste einem Projekt entspricht
       (list "blog"
             :recursive t
             :base-directory "./content"
             :publishing-function 'org-html-publish-to-html
             :publishing-directory "./public"
             :with-author nil           ;; Don't include author name
             :with-creator t            ;; Include Emacs and Org versions in footer
             :with-toc t                ;; Include a table of contents
             :section-numbers nil       ;; Don't include section numbers
             :time-stamp-file nil)))    ;; Don't include time stamp in file


;; Generate the site output
;; The org-publish-all function at the end tells Org to publish every project configured in org-publish-project-alist! The t parameter tells it to regenerate all files regardless of when they were last generated
(org-publish-all t) 
