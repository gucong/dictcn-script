;; If you want to use dictcn-script in emacs,
;; put this file into your load-path and the following into your
;; ~/.emacs:
;;    (require 'dictcn)
;;    (define-key global-map (kbd "C-c d") 'dictcn-lookup)

(provide 'dictcn)
(defun dictcn-lookup ()
  (interactive)
  (let* ((guess (or (and transient-mark-mode mark-active
                         (buffer-substring-no-properties
                          (region-beginning)
                          (region-end)))
                    (current-word nil t)))
         (word (read-string (format "dict.cn (default: %s): " guess)
                            nil nil guess)))
    (shell-command (format "dictcn -w \"%s\"" word)
                   "*dictcn*")))
