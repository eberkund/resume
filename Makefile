pdf:
	pandoc --from=markdown+yaml_metadata_block -H options.sty --template template.tex -o ../resume.pdf resume.md
	pandoc --from=markdown+yaml_metadata_block -H options.sty --template template.tex -o ../letter.pdf letter.md
	#pdftk ../letter.pdf ../resume.pdf output ../combined.pdf

html:
	pandoc -o resume.html resume.md

clean:
    rm -f *~ *.html *.log *.pdf