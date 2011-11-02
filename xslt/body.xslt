<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

   <xsl:template name="body">
      <xsl:param name="lang"/>

      <xsl:variable name="MENU_ALIGN">
         <xsl:choose>

            <xsl:when test="$lang = 'he'">
               <xsl:text>left</xsl:text>
            </xsl:when>
            <xsl:otherwise>
               <xsl:text>right</xsl:text>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>

      <xsl:variable name="INDEX_ALIGN">
         <xsl:choose>

            <xsl:when test="$lang = 'he'">
               <xsl:text>right</xsl:text>
            </xsl:when>
            <xsl:otherwise>
               <xsl:text>left</xsl:text>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>

      <body>

         <table width="100%">

            <tr>

               <td width="70%">
                  <center>
                     <h3>

                        <xsl:value-of select="@name"/>
                        <xsl:if test="$YEAR">
                           <xsl:text>: </xsl:text>
                           <xsl:value-of select="$YEAR"/>
                        </xsl:if>

                     </h3>
                  </center>
               </td>

               <td rowspan="2" align="{$MENU_ALIGN}" valign="top">

                  <a href="http://nginx.org">

                     <img src="/nginx.gif" alt="nginx" border="0"/>

                  </a>
                  <br/>

                  <br/>

                  <br/>

                  <xsl:apply-templates select="document(concat($XML, '/menu.xml'))                          /menus/menu[@lang = $lang]/item"/>

               </td>

            </tr>

            <tr>
               <td valign="top">

                  <xsl:if test="section[@name]">

                     <table width="100%">
                        <tr>
                           <td align="{$INDEX_ALIGN}">

                              <xsl:for-each select="section[@id and @name]">

                                 <a href="#{@id}">
                                    <xsl:value-of select="@name"/>
                                 </a>
                                 <br/>

                                 <xsl:if test="@id = 'directives'">

                                    <xsl:for-each select="directive[@name]">

                                       <xsl:text>     </xsl:text>

                                       <a href="#{@name}">
                                          <xsl:value-of select="@name"/>
                                       </a>
                                       <br/>
                                    </xsl:for-each>
                                 </xsl:if>
                              </xsl:for-each>

                           </td>
                        </tr>
                     </table>
                  </xsl:if>

                  <xsl:apply-templates/>

                  <xsl:if test="@author">

                     <table width="100%">
                        <tr>
                           <td align="right">

                              <xsl:value-of select="document(concat($XML, '/i18n.xml'))                        /i18n/text[@lang = $lang]/item[@id='author']"/>

                              <xsl:text> </xsl:text>
                              <xsl:value-of select="@author"/>
                              <br/>

                              <xsl:if test="@editor">

                                 <xsl:value-of select="document(concat($XML, '/i18n.xml'))                            /i18n/text[@lang = $lang]/item[@id='editor']"/>

                                 <xsl:text> </xsl:text>
                                 <xsl:value-of select="@editor"/>
                                 <br/>
                              </xsl:if>

                              <xsl:if test="@translator">

                                 <xsl:value-of select="document(concat($XML, '/i18n.xml'))                            /i18n/text[@lang = $lang]/item[@id='translator']"/>

                                 <xsl:text> </xsl:text>
                                 <xsl:value-of select="@translator"/>
                                 <br/>
                              </xsl:if>

                           </td>
                        </tr>
                     </table>
                  </xsl:if>

               </td>
            </tr>

         </table>

      </body>
   </xsl:template>

</xsl:stylesheet>
