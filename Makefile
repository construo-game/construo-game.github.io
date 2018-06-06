all : ../Construo.github.io/index.html ../Construo.github.io/tutorial.html

%.html : %.xml default.xsl
	xalan -in $< -xsl default.xsl -out $@

upload:
	cd ../Construo.github.io/ && \
	git commit -m "Upload $(date -I)"

# EOF #
