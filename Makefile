PANDOC=pandoc
ASPELL=aspell
OPTS=--toc
SRCS=$(wildcard *.md)

all: html

html: $(SRCS:.md=.html)

odt: $(SRCS:.md=.odt)

%.html: %.md
	$(PANDOC) $(OPTS) -s -o build/$@ $<

%.odt: %.md
	$(PANDOC) $(OPTS) -s -o build/$@ $<

spellcheck:
	$(foreach var, $(SRCS), $(ASPELL) check -d it $(var);)

clean:
	@rm -f build/*.html build/*.odt