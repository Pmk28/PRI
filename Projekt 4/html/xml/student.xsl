<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>Student Detail</title>
        <style>
          table {
            width: 100%;
            border-collapse: collapse;
          }
          th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
          }
          th {
            background-color: #f2f2f2;
          }
        </style>
      </head>
      <body>
        <h1>Student Detail</h1>
        <xsl:apply-templates select="university/student"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="student">
    <div>
      <h2>Student Information</h2>
      <ul>
        <li><strong>Student Number:</strong> <xsl:value-of select="@studentNumber"/></li>
        <li><strong>First Name:</strong> <xsl:value-of select="firstName"/></li>
        <li><strong>Last Name:</strong> <xsl:value-of select="lastName"/></li>
        <li><strong>Faculty:</strong> <xsl:value-of select="faculty"/></li>
        <li><strong>Email:</strong> <xsl:value-of select="email"/></li>
        <li>
          <strong>Address:</strong>
          <ul>
            <li><strong>Street:</strong> <xsl:value-of select="address/street"/></li>
            <li><strong>City:</strong> <xsl:value-of select="address/city"/></li>
            <li><strong>Zip Code:</strong> <xsl:value-of select="address/zipCode"/></li>
          </ul>
        </li>
      </ul>
      <h3>Courses</h3>
      <table>
        <tr>
          <th>Code</th>
          <th>Course Name</th>
          <th>Credits</th>
        </tr>
        <xsl:for-each select="courses/course">
          <tr>
            <td><xsl:value-of select="code"/></td>
            <td><xsl:value-of select="courseName"/></td>
            <td><xsl:value-of select="credits"/></td>
          </tr>
        </xsl:for-each>
      </table>
    </div>
  </xsl:template>

</xsl:stylesheet>
