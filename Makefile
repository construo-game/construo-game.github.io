all : index.html tutorial.html

%.html : %.xml default.xsl
	xalan -IN $< -XSL default.xsl -OUT $@

#upload: index.html
#	rsync -Pvr . grumbel@pingus.seul.org:/home/grumbel/public_html/construo/

commit: all
	cvs commit -m "automatic commit"

# EOF #