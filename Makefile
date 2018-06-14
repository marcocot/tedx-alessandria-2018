PANDOC=pandoc
OPTS=--toc
SRCS=$(wildcard *.md)

all: html

html: $(SRCS:.md=.html)

odt: $(SRCS:.md=.odt)

%.html: %.md
	$(PANDOC) $(OPTS) -s -o $@ $<

%.odt: %.md
	$(PANDOC) $(OPTS) -s -o $@ $<

clean:
	@rm -f *.html *.odt