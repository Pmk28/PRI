<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <h1>Arenas</h1>
        <table>
            <tr>
                <th>Name</th>
                <th>Location</th>
                <th>Capacity</th>
                <th>Team</th>
            </tr>
            <xsl:for-each select="arenas/arena">
                <tr>
                    <td><xsl:value-of select="name"/></td>
                    <td><xsl:value-of select="location"/></td>
                    <td><xsl:value-of select="capacity"/></td>
                    <td><xsl:value-of select="team"/></td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>