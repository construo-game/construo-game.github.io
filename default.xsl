<?xml version='1.0'?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output
      indent="yes"
      method="html"
      doctype-public="XSLT-compat"
      encoding="UTF-8"
      />

  <xsl:template match="node()|@*">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()" />
    </xsl:copy>
  </xsl:template>

  <xsl:template match="page">
    <html>
      <head>
	<title><xsl:value-of select="@title"/></title>
	<link rel="stylesheet" href="default.css" type="text/css" />
        <link rel="icon" href="images/favicon.png" type="image/png" />
      </head>
      <body>
        <h1 align="center"><img src="images/logo.png" alt="Construo"/></h1>
        <div id="nav">
          <ul>
            <li><a href="index.html">Construo</a></li>
            <li><a href="tutorial.html">Tutorial</a></li>
          </ul>
        </div>
        <div id="body">
          <xsl:apply-templates/>
        </div>
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
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="news/item">
    <dt><strong><xsl:value-of select="@date"/></strong></dt>
    <dd><xsl:apply-templates/></dd>
  </xsl:template>

  <xsl:template match="section-toc">
    <dl style="toc">
      <xsl:for-each select="following-sibling::section">
        <dt><a href="#{generate-id()}"><xsl:value-of select="@title" /></a></dt>
        <dd>
          <dl>
            <xsl:for-each select="child::subsection">
              <dt><a href="#{generate-id()}"><xsl:value-of select="@title" /></a></dt>
              <dd>
                <dl>
                  <xsl:for-each select="child::subsubsection">
                    <dt><a href="#{generate-id()}"><xsl:value-of select="@title" /></a></dt>
                  </xsl:for-each>
                </dl>
              </dd>
            </xsl:for-each>
          </dl>
        </dd>
      </xsl:for-each>
    </dl>
  </xsl:template>

  <xsl:template match="section">
    <div class="section">
      <h2 id="{generate-id()}"><xsl:value-of select="@title"/></h2>
      <div class="sectionbody">
        <xsl:apply-templates/>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="subsection">
    <h3 id="{generate-id()}"><xsl:value-of select="@title"/></h3>
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="subsubsection">
    <h4 id="{generate-id()}"><xsl:value-of select="@title"/></h4>
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="downloads">
    <ul>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>

  <xsl:template match="downloads/item">
    <xsl:choose>
      <xsl:when test=".=''">
        <li><a href="http://savannah.nongnu.org/download/construo/{@file}"><xsl:value-of select="@file"/></a></li>
      </xsl:when>
      <xsl:otherwise>
        <li><a href="http://savannah.nongnu.org/download/construo/{@file}">
          <xsl:value-of select="@file"/></a>
          -
          <xsl:apply-templates/>

        </li>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="screenshots">
    <div class="screenshots">
      <ul>
        <xsl:apply-templates/>
      </ul>
    </div>
  </xsl:template>

  <xsl:template match="screenshots/item">
    <li><a href="images/{.}.png"><img src="images/{.}_small.png"/></a></li>
  </xsl:template>

  <xsl:template match="copyright">
    <div id="footer">
      <p>
        Copyright (c) 2001 <A HREF="http://pingus.seul.org/~grumbel/">Ingo Ruhnke</A> <A HREF="mailto:grumbel@gmail.com?subject=[Construo]">&lt;grumbel@gmail.com&gt;</A><BR/>
        Last update: 2010-05-30
      </p>
    </div>

  </xsl:template>

</xsl:stylesheet>
