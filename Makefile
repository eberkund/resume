OUTPUT=build
SOURCES=resume.md letter.md $(wildcard tex/*)

FOOTER=--include-after-body=tex/footer.tex
HEADER=--from=markdown+yaml_metadata_block \
	--include-in-header=tex/options.sty \
	--include-before-body=tex/header.tex \
	--variable subparagraph=false

# Targets
$(OUTPUT)/resume.pdf: resume.md
	mkdir -p $(OUTPUT)
	pandoc $(HEADER) -o $(OUTPUT)/resume.pdf resume.md

$(OUTPUT)/resume.tex: resume.md
	mkdir -p $(OUTPUT)
	pandoc $(HEADER) -o $(OUTPUT)/resume.tex resume.md

$(OUTPUT)/resume.html: resume.md
	mkdir -p $(OUTPUT)
	pandoc -o $(OUTPUT)/resume.html resume.md

$(OUTPUT)/letter.pdf: letter.md
	mkdir -p $(OUTPUT)
	pandoc $(HEADER) $(FOOTER) -o $(OUTPUT)/letter.pdf letter.md

# Aliases
pdf: $(OUTPUT)/resume.pdf
tex: $(OUTPUT)/resume.tex
html: $(OUTPUT)/resume.html
letter: $(OUTPUT)/letter.pdf

clean:
	rm -rf $(OUTPUT)
