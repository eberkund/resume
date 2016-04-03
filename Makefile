HEADER=--from=markdown+yaml_metadata_block \
	--include-in-header=tex/options.sty \
	--include-before-body=tex/header.tex \
	--variable subparagraph=false

FOOTER=--include-after-body=tex/footer.tex

pdf:
	pandoc $(HEADER) -o out/resume.pdf resume.md
	pandoc $(HEADER) $(FOOTER) -o out/letter.pdf letter.md
	pdftk out/letter.pdf out/resume.pdf output out/combined.pdf

tex:
	pandoc $(HEADER) -o out/resume.tex resume.md
	pandoc $(HEADER) $(FOOTER) -o out/letter.tex letter.md

html:
	pandoc -o out/resume.html resume.md

clean:
	rm -f out/*