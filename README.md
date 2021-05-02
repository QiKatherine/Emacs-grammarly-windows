# Introduction
This is a workaround script for exporting text from Emacs buffer to use Grammarly. <br>
We export text to MS word file because Emacs Windows seems to have an issue in calling the Grammarly app.

-----
# How to use:

1) Make sure you've installed Grammarly plug-in in MS Word and have logged in.

2) Add system PATH of the Grammarly executable.
e.g.  `C:\Users\YOURNAME\AppData\Local\GrammarlyForWindows`

3) Check whether your MS word is installed in this path:
 `c:/Program Files/Microsoft Office/root/Office16/winword.exe`
If not, change accordingly in the emacs-grammarly-windows.el file.

4) Save emacs-grammarly-windows.el in place where you normally save .el file.
Put the below code in your dot file.
  ` (add-to-list 'load-path (expand-file-name "~/YourPath/emacs-grammarly-windows.el"))`
  `(require 'emacs-grammarly)`   <br>
  For **Spacemacs** users, put the above code in `defun dotspacemacs/user-config ()` section

5) Open and write text in a buffer, call
 `M-x grammarly-save-region-and-run`

Editing it in MS Word and paste the whole text back to Emacs.
