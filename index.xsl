<?xml version='1.0'?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/TR/xhtml1/strict">

  <xsl:output method="html" indent="yes"/>

  <xsl:template match="node()|@*">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()" />
    </xsl:copy>
  </xsl:template>
  
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
	  <table bgcolor="#b4b4a1" width="100%">
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
    <dt><strong><xsl:value-of select="@date"/></strong></dt>
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

  <xsl:template match="downloads/item">
    <xsl:choose>
      <xsl:when test=".=''">
        <li><a href="http://freesoftware.fsf.org/download/construo/{@file}"><xsl:value-of select="@file"/></a></li>
      </xsl:when>
      <xsl:otherwise>
        <li><a href="http://freesoftware.fsf.org/download/construo/{@file}">
            <xsl:value-of select="@file"/></a>
          -
          <xsl:apply-templates/>
          
        </li>
      </xsl:otherwise>
    </xsl:choose>
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
    <table cellpadding="0" cellspacing="0" width="100%">
      <tr>
        <td align="left">
          <small>
            Copyright (c) 2001 <A HREF="http://pingus.seul.org/~grumbel/">Ingo Ruhnke</A>, <A HREF="mailto:grumbel@gmx.de?subject=[Construo]">&lt;grumbel@gmx.de&gt;</A><BR/>
            Last update: Mon May 13 13:29:08 2002<br/>
          </small>
        </td>
        <td align="right" valign="bottom">
          <!-- Begin Nedstat Basic code -->
          <!-- Title: Construo -->
          <!-- URL: http://www.nongnu.org/construo/ -->
          <script language="JavaScript" type="text/javascript" src="http://m1.nedstatbasic.net/basic.js">
          </script>
          <script language="JavaScript" type="text/javascript" >
            <!--
            nedstatbasic("ACV1PwjX+S79e4Epog/n15KvtIwA", 0);
            // -->
          </script>
          <noscript>
            <a target="_blank" href="http://v1.nedstatbasic.net/stats?ACV1PwjX+S79e4Epog/n15KvtIwA"><img
                src="http://m1.nedstatbasic.net/n?id=ACV1PwjX+S79e4Epog/n15KvtIwA"
                border="0" width="18" height="18"
                alt="Nedstat Basic - Free web site statistics" /></a>
          </noscript>
          <!-- End Nedstat Basic code -->
        </td>
      </tr>
    </table>
  </xsl:template>

</xsl:stylesheet>
