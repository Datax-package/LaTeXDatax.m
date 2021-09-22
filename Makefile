.PHONY: all clean test

all : README.html data.tex

README.html : README.md
	md2html --github $< -o $@

data.tex : test.m datax.m
	matlab -batch test

test : data.tex
	cat $<

clean :
	${RM} README.html data.tex
