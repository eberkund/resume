HEADER=--from=markdown+yaml_metadata_block \
	--include-in-header=tex/options.sty \
	--include-before-body=tex/header.tex \
	--variable subparagraph=false

FOOTER=--include-after-body=tex/footer.tex

pdf:
	pandoc $(HEADER) -o out/resume.pdf resume.md

tex:
	pandoc $(HEADER) -o out/resume.tex resume.md

html:
	pandoc -o out/resume.html resume.md

clean:
	rm -f out/*
