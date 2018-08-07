BUILD_DIR=build
FOOTER=--include-after-body=tex/footer.tex
HEADER=--from=markdown+yaml_metadata_block \
	--include-in-header=tex/options.sty \
	--include-before-body=tex/header.tex \
	--variable subparagraph=false

pdf: resume.md
	mdkir -p $(BUILD)
	pandoc $(HEADER) -o $(BUILD)/resume.pdf resume.md

tex: resume.md
	mdkir -p $(BUILD)
	pandoc $(HEADER) -o $(BUILD)/resume.tex resume.md

html: resume.md
	mdkir -p $(BUILD)
	pandoc -o $(BUILD)/resume.html resume.md

clean:
	rm -rf $(BUILD)
