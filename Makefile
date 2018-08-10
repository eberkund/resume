OUTPUT=build
SOURCES=resume.md $(wildcard tex/*)

FOOTER=--include-after-body=tex/footer.tex
HEADER=--from=markdown+yaml_metadata_block \
	--include-in-header=tex/options.sty \
	--include-before-body=tex/header.tex \
	--variable subparagraph=false

pdf: $(SOURCES)
	mkdir -p $(OUTPUT)
	pandoc $(HEADER) -o $(OUTPUT)/resume.pdf resume.md

tex: $(SOURCES)
	mkdir -p $(OUTPUT)
	pandoc $(HEADER) -o $(OUTPUT)/resume.tex resume.md

html: $(SOURCES)
	mkdir -p $(OUTPUT)
	pandoc -o $(OUTPUT)/resume.html resume.md

clean:
	rm -rf $(OUTPUT)
