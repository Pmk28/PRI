<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <h1>Teams</h1>
        <table>
            <tr>
                <th>Name</th>
                <th>Playoffs Appearances</th>
                <th>Championships</th>
            </tr>
            <xsl:for-each select="teams/team">
                <tr>
                    <td><xsl:value-of select="name"/></td>
                    <td><xsl:value-of select="playoffs"/></td>
                    <td><xsl:value-of select="championships"/></td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>