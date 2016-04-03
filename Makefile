ARGS=--from=markdown+yaml_metadata_block \
	--include-in-header=options.sty \
	--include-before-body=header.tex \
	--variable subparagraph=false \

pdf:
	pandoc $(ARGS) \
	--output=out/resume.pdf resume.md

	pandoc \
	--from=markdown+yaml_metadata_block \
	--include-in-header=options.sty \
	--include-before-body=header.tex \
	--include-after-body=footer.tex \
	--variable subparagraph=false \
	--output=out/letter.pdf letter.md

	pdftk out/letter.pdf out/resume.pdf \
	output out/combined.pdf

latex:
	pandoc \
	--from=markdown+yaml_metadata_block \
	--include-in-header=options.sty \
	--include-before-body=header.tex \
	--output=./out/erik_berkun-drevnig.tex resume.md

html:
	pandoc \
	--output=out/erik_berkun-drevnig.html resume.md

clean:
	rm -f out/*