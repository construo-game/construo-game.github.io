all : index.html tutorial.html

%.html : %.xml default.xsl
	xalan -in $< -xsl default.xsl -out $@

#upload: index.html
#	rsync -Pvr . grumbel@pingus.seul.org:/home/grumbel/public_html/construo/

commit: all
	cvs commit -m "automatic commit"

# EOF #