<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>Players</title>
            </head>
            <body>
                <h1>Players</h1>
                <table>
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Age</th>
                            <th>Total Points</th>
                            <th>Number of Rings</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="players/player">
                            <tr>
                                <td><xsl:value-of select="name" /></td>
                                <td><xsl:value-of select="age" /></td>
                                <td><xsl:value-of select="total_points" /></td>
                                <td><xsl:value-of select="number_of_rings" /></td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>