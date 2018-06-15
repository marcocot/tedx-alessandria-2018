PANDOC=pandoc
OPTS=--toc
SRCS=$(wildcard *.md)

all: html

html: $(SRCS:.md=.html)

odt: $(SRCS:.md=.odt)

%.html: %.md
	$(PANDOC) $(OPTS) -s -o build/$@ $<

%.odt: %.md
	$(PANDOC) $(OPTS) -s -o build/$@ $<

clean:
	@rm -f build/*.html build/*.odt