<?xml version='1.0'?>
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns="http://www.w3.org/TR/xhtml1/strict">

  <xsl:output method="html"/>
  
  <xsl:template match="page">
    <html>
      <head>
	<title>
	  <xsl:value-of select="@title"/>
	</title>
	<link rel="stylesheet" href="default.css" type="text/css" />
      </head>
      <body>
    <h1 align="center"><img src="images/logo.png" alt="Construo"/></h1>
	<table bgcolor="#88bbbb"><tr><td>
	<table bgcolor="#dddddd" cellpadding="20"><tr><td>
	<xsl:apply-templates/>
	    </td></tr></table>
	    </td></tr></table>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="logo">
    <h1 align="center"><img src="images/logo.png" alt="Construo"/></h1>
  </xsl:template>

  <xsl:template match="link">
    <a href="{@ref}"><xsl:apply-templates/></a>
  </xsl:template>

  <xsl:template match="linkbar">
      Linkbar<br/>
    <xsl:for-each select="/section">
      ..:: <xsl:value-of select="."/> ::..
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="news">
    <table width="35%" bgcolor="black" align="right" hspace="10"><tr><td>
	  <table bgcolor="#b4b4a1">
	    <tr><td bgcolor="black" align="center">
		<font color="#ffffff" size="+2">News</font></td></tr>
	    <tr><td>
		<dl>
		  <xsl:apply-templates/>
		</dl>
	      </td></tr>
	  </table>
	</td></tr></table>
    
  </xsl:template>

  <xsl:template match="news/item">
    <dt><xsl:value-of select="@date"/></dt>
    <dd><xsl:apply-templates/></dd>
  </xsl:template>

  <xsl:template match="section">
    <h2><xsl:value-of select="@title"/></h2>
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <xsl:template match="subsection">
    <h3><xsl:value-of select="@title"/></h3>
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <xsl:template match="downloads">
    <ul>
      <xsl:apply-templates/>      
    </ul>
  </xsl:template>

  <xsl:template match="item">
    <li><a href="dist/{.}"><xsl:value-of select="."/></a></li>
  </xsl:template>

  <xsl:template match="screenshots">
    <center>
      <xsl:apply-templates/>
    </center>
  </xsl:template>
  
  <xsl:template match="screenshots/item">
    <a href="images/{.}.png"><img src="images/{.}_small.png"/></a>
  </xsl:template>

  <xsl:template match="copyright">
    <hr/>
    <small>
      Copyright (c) 2001 <A HREF="http://pingus.seul.org/~grumbel/">Ingo Ruhnke</A>, <A HREF="mailto:grumbel@pingus.cx?subject=[Pingus]">&lt;grumbel@pingus.cx&gt;</A><BR/>
	Last update: Sat May 26 15:36:21 2001<br/>
    </small>
  </xsl:template>

</xsl:stylesheet>
