all: build/images $(patsubst %.xml,build/%.html,$(wildcard *.xml)) build/default.css

build/images: images
	mkdir -p build/
	cp -v -r $< $@

build/default.css: default.css
	mkdir -p build/
	cp -v $< $@

build/%.html : %.xml default.xsl
	mkdir -p build/
	xalan -in $< -xsl default.xsl -out $@

# EOF #
