.PHONY: all clean test

all : README.html data.tex

README.html : README.md
	md2html --github $< -o $@

data.tex : test.m datax.m
	matlab -batch test

test : data.tex test.pdf
	cat $<

%.pdf : %.tex
	xelatex --file-line-error --interaction=nonstopmode $<

clean :
	${RM} README.html data.tex test.pdf *.log *.aux
