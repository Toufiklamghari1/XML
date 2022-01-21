<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="html" />
    <xsl:template match="/">
        <html>
            <head>
                <title>Catalogue</title>
                <link rel="stylesheet" href="catalogue.css"></link>
            </head>
            <body>
                <div class="title">
                    <center><h1>Articles des Filles</h1></center>
                </div>
                <xsl:for-each select="catalogue/article">
                    <div class="article">
                        <div class="image">
                            <center>
                                <img>
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="photo/@source"></xsl:value-of>
                                    </xsl:attribute>
                                </img>
                            </center>
                        </div>
                        <div class="info">
                            <div class="designation">
                                <xsl:value-of select="Désignation"/>                  
                            </div>
                            <div class="description">
                                <xsl:value-of select="description"/>                  
                            </div>
                            <div class="ref">
                                <b>Référence : </b><xsl:value-of select="@ref"/>                  
                            </div>
                            <div class="prixTTc">
                                <b>PrixTTC : </b> <xsl:value-of select="prixTTC"/>                  
                            </div>
                            <div class="tailles">
                                <b>Tailes disponibles : </b> <xsl:for-each select="taillesDisp/taille"><xsl:value-of select="."/></xsl:for-each>                 
                            </div>
                            <div class="detail">
                                <a href= "{détail}"> Fiche Article</a>                 
                            </div>
                        </div>
                    </div>
                    
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>