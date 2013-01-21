<?xml version="1.0" encoding="UTF-8"?>

<!-- New document created with EditiX at Sat Jan 02 07:32:28 PST 2010 -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>

	<xsl:template match="/root">
               
		<table border="0" width="95%" id="bio-header"  title="Personal information block">
			<tr>
				<td width="210" title="">
  				<img>
    					<xsl:attribute name="border">
    						1
    					</xsl:attribute>  	
    					<xsl:attribute name="width">
    						160
    					</xsl:attribute>
    					<xsl:attribute name="height">
    						200
    					</xsl:attribute>
    					<xsl:attribute name="src">
    						<xsl:value-of select="/root/picture/img/@src"/>
    					</xsl:attribute>
   					<xsl:attribute name="alt">
    						<xsl:value-of select="/root/picture/img/@alt"/>
    					</xsl:attribute>    		
    				</img>				
				</td>
				<td title="information Block">
				<table>
					<xsl:attribute name="id">bio-info</xsl:attribute>  
					<xsl:attribute name="border">
    					0
					</xsl:attribute>  
					<xsl:attribute name="title">
    					Personal Information table
					</xsl:attribute>
					<xsl:attribute name="width">
    					100%
					</xsl:attribute>
					  										
					<tr>
						<td>
							<xsl:attribute name="title">
    							Name Last first
							</xsl:attribute>					
						<h2 class="bio-name"><xsl:value-of select="firstname"/><xsl:text> </xsl:text><xsl:value-of select="lastname"/>
							<xsl:if test="suffix !=''">							
								<xsl:text>, </xsl:text><xsl:value-of select="suffix"/>
							</xsl:if>

						</h2>

						</td>
					</tr>
					<tr>
						<td title="Title">
						<h3 class="bio-add-info"><xsl:value-of select="BioTitle1"/></h3>
						</td>
					</tr>

					<tr>
						<td title="Email">
						<h3 class="bio-add-info"><xsl:value-of select="email"/></h3>
						</td>
					</tr>
					<tr>
						<td title="Phone">
 
    <xsl:if test="string-length(phone) &gt; 0">
						<h3 class="bio-add-info">Phone: <xsl:value-of select="phone" /></h3>
      </xsl:if>
 
     <xsl:if test="string-length(ext) &gt; 0">
						<h3 class="bio-add-info">Ext: <xsl:value-of select="ext" /></h3>
      </xsl:if>
 


						</td>
					</tr>
					<tr>

						<td title="Line 2">
						<h3 class="bio-add-info"></h3>
						</td>
					</tr>
					<tr>
						<td title="Line 3">
						<h3 class="bio-add-info"></h3>
						</td>
					</tr>

					<tr>
						<td title="Line 4">
						<h3 class="bio-add-info"></h3>
						</td>
					</tr>
				</table>
				</td>
			</tr>
		</table>

	
		<table border="0">

			<tr>
				<td title="Education">
				<h2 class="bio-main-text-title">Education</h2>
				</td>
			</tr>
			<tr>
				<td>
					<xsl:copy-of select="education"/>
				</td>
			</tr>
		</table>
		<div>
			<xsl:if test="biography !=''">
			<xsl:attribute name="id">
				bio-biography
			</xsl:attribute>
			<h2 class="bio-main-text-title">Biography</h2>
			<xsl:copy-of select="biography"/>
			</xsl:if>
		</div>
		<div>
			<xsl:if test="publications !=''">
			<xsl:attribute name="id">
				bio-biography
			</xsl:attribute>
			<h2 class="bio-main-text-title">Publications</h2>
			<xsl:copy-of select="publications"/>
			</xsl:if>
		</div>
		<div>
			<xsl:if test="additional_conent !=''">
			<xsl:attribute name="id">
				bio-biography
			</xsl:attribute>
			<h2 class="bio-main-text-title">Additional Professional Accomplishments</h2>
			<xsl:copy-of select="additional_conent"/>
			</xsl:if>
		</div>				
	</xsl:template>
</xsl:stylesheet>
