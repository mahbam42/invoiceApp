<?xml version="1.0" encoding="UTF-8"?>

<!-- New document created with EditiX at Sat Jan 02 07:32:28 PST 2010 -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/root">
				<table border="1">
					<tr>
						<td>
							<xsl:value-of select="firstname"/>
						</td>
						<td>
							<xsl:value-of select="lastname"/>

						</td>
						<td>
							<xsl:value-of select="BioTitle1"/>

						</td>
						<td>
							<xsl:value-of select="BioTitle2"/>

						</td>
						<td>
							<xsl:value-of select="email"/>

						</td>
						<td>
							<xsl:value-of select="education"/>

						</td>
					</tr>
				</table>
	</xsl:template>
</xsl:stylesheet>
