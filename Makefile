HEADER=--from=markdown+yaml_metadata_block \
	--include-in-header=options.sty \
	--include-before-body=header.tex \
	--variable subparagraph=false

FOOTER=--include-after-body=footer.tex

pdf:
	pandoc $(HEADER) -o out/resume.pdf resume.md
	pandoc $(FOOTER) $(FOOTER) -o out/letter.pdf letter.md
	pdftk out/letter.pdf out/resume.pdf output out/combined.pdf

latex:
	pandoc $(HEADER) -o out/resume.tex resume.md
	pandoc $(FOOTER) $(FOOTER) -o out/letter.tex letter.md

html:
	pandoc -o out/erik_berkun-drevnig.html resume.md

clean:
	rm -f out/*