;;; emacs-windows-grammarly.el --- a simple plugin to sent text to MS office word to use Grammarly

(defvar grammarly-file nil
  "The temporary file for storing things sent to Grammarly.")

(defvar grammarly-cmd "c:/Program Files/Microsoft Office/root/Office16/winword.exe")

;; (defvar grammarly-quit-cmd "exit 'c:/Program Files/Microsoft Office/root/Office16/winword.exe' ")

(defvar grammarly-do-unfill-paragraph t
  "If non-nil, remove newlines in paragraphs before sending it to Grammarly.")

(defun grammarly-unfill-paragraph ()
  (let ((fill-column most-positive-fixnum))
    (fill-region (point-min) (point-max))))

(defun grammarly-save-region-and-run ()
  "Save region to a tempfile and run Grammarly on it."
  (interactive)
  (let ((beg (if (region-active-p) (region-beginning) (point-min)))
        (end (if (region-active-p) (region-end) (point-max)))
        (file (or grammarly-file
                  (setq grammarly-file
                        (make-temp-file "grammarly" nil ".txt")))))
    (let ((buf (current-buffer)))
      (with-temp-file file
        (insert-buffer-substring buf beg end)
        (when grammarly-do-unfill-paragraph (grammarly-unfill-paragraph))))
    (call-process-shell-command
     (concat grammarly-cmd " " file))))

(provide 'emacs-grammarly-windows)