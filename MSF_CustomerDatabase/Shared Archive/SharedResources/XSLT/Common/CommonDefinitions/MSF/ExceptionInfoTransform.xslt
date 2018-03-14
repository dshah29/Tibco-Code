<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns0="http://three.co.uk/xsd/resource/common/commondefinitions/msf/exceptioninfo/v1" xmlns:xit="http://three.co.uk/xsd/resource/common/commondefinitions/msf/exceptioninfotransform/v1" version="1.0">
	<xsl:template match="/xit:ExceptionInfoTransform/ns0:ExceptionInfo">
		<ns0:ExceptionInfo>
			<xsl:copy-of select="@*|b/@*"/>
			<xsl:for-each select="/xit:ExceptionInfoTransform/xit:attributes/*">
				<xsl:variable name="elementNamespace" select="namespace-uri()"/>
				<xsl:for-each select="./@*">
					<xsl:variable name="attrName" select="name()"/>
					<xsl:variable name="attrNamespace" select="if (namespace-uri() != '') then namespace-uri() else $elementNamespace"/>
					<xsl:if test="$attrNamespace !=''">
						<xsl:attribute namespace="{$attrNamespace}" name="{$attrName}">
							<xsl:value-of select="."/>
						</xsl:attribute>
					</xsl:if>
				</xsl:for-each>
			</xsl:for-each>
		</ns0:ExceptionInfo>
	</xsl:template>
</xsl:stylesheet>
