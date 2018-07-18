all: index.html index.pdf index.docx index.txt

index.html: index.md style.css
	pandoc --standalone -c style.css --from markdown --to html -o index.html index.md
	pandoc --standalone -c style.css --from markdown --to html -o index_es.html index_es.md

index.pdf: index.html
	wkhtmltopdf index.html index.pdf
	wkhtmltopdf index_es.html index_es.pdf

index.docx: index.md
	pandoc --from markdown --to docx -o index.docx index.md
	pandoc --from markdown --to docx -o index_es.docx index_es.md

index.txt: index.md
	pandoc --standalone --smart --from markdown --to plain -o index.txt index.md
	pandoc --standalone --smart --from markdown --to plain -o index_es.txt index_es.md

clean:
	rm -f *.html *.pdf *.docx *.txt