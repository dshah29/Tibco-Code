<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
<xsl:output indent="yes"/>
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="*[local-name()='item']/*[local-name()='name']">
		<xsl:element name="name" namespace="{namespace-uri()}">
			<xsl:value-of select="upper-case(replace(.,'([A-Z]+)', concat('_', '$1')))"/>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
