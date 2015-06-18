pdf:
	pandoc -H options.sty -B header.tex -o ../resume.pdf resume.md
	pandoc -H options.sty -B header.tex -A footer.tex -o ../letter.pdf letter.md
	pdftk ../letter.pdf ../resume.pdf output ../combined.pdf