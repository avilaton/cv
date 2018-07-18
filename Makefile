all: index.html index.pdf index.docx index.txt

index.html: index.md style.css es/index.md
	pandoc --standalone -c style.css --from markdown --to html -o index.html index.md
	pandoc --standalone -c style.css --from markdown --to html -o es/index.html es/index.md

index.pdf: index.html
	wkhtmltopdf index.html index.pdf
	wkhtmltopdf es/index.html es/index.pdf

index.docx: index.md
	pandoc --from markdown --to docx -o index.docx index.md
	pandoc --from markdown --to docx -o es/index.docx es/index.md

index.txt: index.md
	pandoc --standalone --smart --from markdown --to plain -o index.txt index.md
	pandoc --standalone --smart --from markdown --to plain -o es/index.txt es/index.md

clean:
	rm -f *.html *.pdf *.docx *.txt es/*.txt es/*.pdf es/*.doxc es/*.txt