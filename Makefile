.PHONY: all clean

all : README.html

README.html : README.md
	md2html --github $< -o $@

clean :
	rm -f README.html
