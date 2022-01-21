<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE 
    rdf:RDF [ <!ENTITY xsd "http://www.w3.org/2001/XMLSchema# "> ]
>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" 
    xmlns:voc="http://www.exemples.com/vocabulaire"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="xml"></xsl:output>
   <xsl:template match="/">
       <rdf:RDF>
           <xsl:for-each select="musée/objet">
               <xsl:call-template name="tempObj"></xsl:call-template>
           </xsl:for-each>
       </rdf:RDF>
   </xsl:template>
    <xsl:variable name="uri" select="'http://example.com/object/'"/>
    <xsl:template name="tempObj" match="/musée/object">
        <rdf:Description rdf:about="{concat($uri,@code)}">
            <xsl:for-each select="child::*">
                <xsl:call-template name="tempDesc"></xsl:call-template>
            </xsl:for-each>
        </rdf:Description>
        
    </xsl:template>
    <xsl:template name="tempDesc">
        <xsl:if test="name() != 'photo' and name() != 'fabriquéEn'">
            <xsl:element name="{concat('voc:',name())}">
                <xsl:value-of select="."/>
            </xsl:element>
        </xsl:if>
        <xsl:if test="name() = 'fabriquéEn' ">
            <xsl:element name="{concat('voc:',name())}">
                <xsl:element name="rdf:Seq">
                    <xsl:for-each select="child::*">
                        <xsl:element name="rdf:li" >
                            <xsl:attribute name="rdf:ressource">
                                <xsl:variable name="val1" select="."/>
                                <xsl:variable name="val2" select="translate($val1,' ','')"/>
                                <xsl:value-of select="concat($uri,$val2)"/>
                            </xsl:attribute>
                            <xsl:value-of select="."/>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:element>
            </xsl:element>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>