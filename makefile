all:
	lualatex -shell-escape resume
	convert resume.pdf resume.png
