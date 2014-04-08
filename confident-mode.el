(defun confident-mode/is-input ()
  "Documentation."
  (interactive)
  (save-excursion
    (end-of-line)
    (insert " # INPUT"))
  )

(defun confident-mode/is-output ()
  "Documentation."
  (interactive)
  (save-excursion
    (end-of-line)
    (insert " # OUTPUT"))
  )

(defun confident-mode/is-failure ()
  "Documentation."
  (interactive)
  (save-excursion
    (end-of-line)
    (insert " # FAILURE"))
  )

(defun confident-mode/is-work ()
  "Documentation."
  (interactive)
  (save-excursion
    (end-of-line)
    (insert " # WORK"))
  )

(make-face 'input-face)
(set-face-attribute 'input-face nil :background "NavajoWhite2")

(make-face 'output-face)
(set-face-attribute 'output-face nil :background "SteelBlue")

(make-face 'failure-face)
(set-face-attribute 'failure-face nil :background "LightPink")

(make-face 'work-face)
(set-face-attribute 'work-face nil :background "SpringGreen3")

(set-face-attribute 'input-face nil  :foreground "black")
(set-face-attribute 'output-face nil :foreground "black")
(set-face-attribute 'failure-face nil  :foreground "black")
(set-face-attribute 'work-face nil :foreground "black")

(defun confident-mode-setup-function ()
  "Documentation."
  (local-unset-key (kbd "C-i"))
  (local-unset-key (kbd "C-o"))
  (local-unset-key (kbd "C-f"))
  (local-unset-key (kbd "C-w"))
  (local-set-key (kbd "C-i") 'confident-mode/is-input)
  (local-set-key (kbd "C-o") 'confident-mode/is-output)
  (local-set-key (kbd "C-f") 'confident-mode/is-failure)
  (local-set-key (kbd "C-w") 'confident-mode/is-work)

  )


(define-generic-mode confident-mode
  nil ; COMMENT-LIST
  nil ; KEYWORD-LIST
  '(
    ("\\(.*# INPUT$\\)"
     (1 'input-face))
    ("\\(.*# OUTPUT$\\)"
     (1 'output-face))
    ("\\(.*# FAILURE$\\)"
     (1 'failure-face))
    ("\\(.*# WORK$\\)"
     (1 'work-face))
    )
  nil ; AUTO-MODE-LIST
  '(confident-mode-setup-function)
  )

(provide 'confident-mode)
