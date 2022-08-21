OUTPUT=build
SOURCES=$(wildcard tex/*)

FOOTER=--include-after-body=tex/footer.tex
HEADER=--from=markdown+yaml_metadata_block \
	--include-in-header=tex/options.sty \
	--include-before-body=tex/header.tex

# Targets
$(OUTPUT)/resume.pdf: $(SOURCES) resume.md
	pandoc $(HEADER) -o $(OUTPUT)/resume.pdf resume.md

$(OUTPUT)/resume.tex: $(SOURCES) resume.md
	pandoc $(HEADER) -o $(OUTPUT)/resume.tex resume.md

$(OUTPUT)/resume.html: $(SOURCES) resume.md
	pandoc -o $(OUTPUT)/resume.html resume.md

$(OUTPUT)/letter.pdf: $(SOURCES) letter.md
	pandoc $(HEADER) $(FOOTER) -o $(OUTPUT)/letter.pdf letter.md

# Aliases
pdf: $(OUTPUT)/resume.pdf
tex: $(OUTPUT)/resume.tex
html: $(OUTPUT)/resume.html
letter: $(OUTPUT)/letter.pdf

clean:
	rm $(OUTPUT)/!(.gitkeep)
