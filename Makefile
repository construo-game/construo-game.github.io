index.html : index.xml index.xsl
	xalan -IN index.xml -XSL index.xsl -OUT index.html

#upload: index.html
#	rsync -Pvr . grumbel@pingus.seul.org:/home/grumbel/public_html/construo/

commit:
	cvs commit -m "automatic commit"

# EOF #