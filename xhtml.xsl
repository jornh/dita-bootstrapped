<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns="http://www.w3.org/1999/xhtml"
                xmlns:u="http://www.xmlmind.com/namespace/ditac"
                xmlns:ditac="http://www.xmlmind.com/ditac/schema/ditac"
                exclude-result-prefixes="xs u ditac"
	            version="2.0">

  <xsl:import href="ditac-xsl:xhtml/xhtml.xsl"/>
  <xsl:import href="ditac-xsl:xhtml/task.xsl"/>

  <xsl:param name="brand-name" select="'DITA-Bootstrapped'"/>
  <xsl:param name="brand-href" select="'/'"/>


<!-- from ditac_chunk.xsl -->
  <xsl:template match="ditac:chunk">
    <!-- JHE added div.row wrapper -->
    <div class="row">

    <xsl:apply-templates/>

    </div>
  </xsl:template>



<!-- from xhtmlBase.xsl -->
  <!-- / ================================================================= -->

  <xsl:template match="/">
    <html>
      <head>
        <xsl:choose>
          <xsl:when test="starts-with($xhtmlVersion, '-')">
            <meta http-equiv="Content-Type" 
              content="{concat('text/html; charset=', $xhtmlEncoding)}"/>
          </xsl:when>
          <xsl:when test="$xhtml-mime-type != ''">
            <meta http-equiv="Content-Type" 
              content="{concat($xhtml-mime-type, '; charset=', $xhtmlEncoding)}"/>
          </xsl:when>
        </xsl:choose>

        <xsl:call-template name="pageTitle"/>
<!-- JHE TODO XXX TBD temp remove addition -->
        <!-- <xsl:call-template name="cssMeta"/> -->
<!-- JHE addition -->
<link href="https://netdna.bootstrapcdn.com/twitter-bootstrap/2.1.0/css/bootstrap-combined.min.css" rel="stylesheet" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="http://fancyapps.com/fancybox/source/jquery.fancybox.css" rel="stylesheet" />

    <style type="text/css">
      body {
        position: relative;
        padding-top: 60px; /* adjust for navbar */
      }
      h2 {
        padding-top: 60px; /* adjust for navbar */
      }
    </style>
        <xsl:call-template name="keywordsMeta"/>
        <xsl:call-template name="generatorMeta"/>
      </head>
      <body >

        <!-- JHE additions -->
        <div class="navbar navbar-fixed-top">
          <div class="navbar-inner">
            <div class="container">
              <xsl:if test="$brand-name != ''">
                <a class="brand">
                  <xsl:attribute name="href" select="$brand-href" />
                  <xsl:value-of select="$brand-name"/>
                </a>
              </xsl:if>
              <p>
                <button class="btn btn-inverse pull-right" title="Currently only meaningful on the 'task' type">Toggle: Just facts/details</button> 
              </p>
            </div>
          </div>
        </div>

      <div class="container"> <!-- container -->

<!--         <xsl:message>at body outer div</xsl:message>
 -->

        <xsl:variable name="chunkCount" select="u:chunkCount()"/>
        <xsl:if test="$chunkCount gt 1 and 
                      ($chain-pages = 'top' or $chain-pages = 'both')">
          <xsl:call-template name="chainPages">
            <xsl:with-param name="isTop" select="true()"/>
          </xsl:call-template>
        </xsl:if>

        <xsl:apply-templates/>
        <xsl:call-template name="footnotes"/>

        <xsl:if test="$chunkCount gt 1 and 
                      ($chain-pages = 'bottom' or $chain-pages = 'both')">
          <xsl:call-template name="chainPages">
            <xsl:with-param name="isTop" select="false()"/>
          </xsl:call-template>
        </xsl:if>

      <!-- JHE additions -->
      </div> <!-- container -->
<!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
<!--    <script src="assets/js/bootstrap-modal.js"></script> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>

    <script src="http://fancyapps.com/fancybox/source/jquery.fancybox.js" type="text/javascript"></script>

<!--     <script src="http://cdnjs.cloudflare.com/ajax/libs/fancybox/2.0.6/jquery.fancybox.pack.js" type="text/javascript"></script> -->

    <script type="text/javascript">
    $(document).ready(function(){ /* standard jquery stuff from w3school */
    //  $("div.fig").hide();
      $("button").click(function(){
        $("div.fig").slideToggle();
        $("div.info").slideToggle();
        $("div.tutorialinfo").slideToggle();
        $("div.stepxmp").slideToggle();
        $("div.stepresult").slideToggle();
        $("ol.substeps").slideToggle();
        $("ul.choices").slideToggle();
      });

      /* from fancybox page ref to http://jsfiddle.net/47xjk/  */
      $("a[href$='.jpg'],a[href$='.png'],a[href$='.gif']").attr('rel', 'gallery').fancybox({
            padding : 0,
//            prevEffect   : 'elastic',
            openEffect  : 'elastic',
//            nextEffect    : 'elastic'

    });  
      // JHE: should be possible to loose the .attr('rel', 'gallery') part now because its handled in body.xsl
    });
    </script>

      </body>
    </html>
  </xsl:template>





<!-- from topic.xsl -->
  <xsl:template match="*[contains(@class,' topic/topic ')]">
<!-- JHE addition of variables stolen from a named template below -->
    <xsl:variable name="topicId" select="@id"/>
    <xsl:variable name="tocEntry" select="u:tocEntry($topicId)"/>

    <xsl:choose>
      <xsl:when test="$tocEntry/@role = 'section1NONONONONONONOOOOO'">
        <xsl:element name="div">
          <xsl:attribute name="class">row</xsl:attribute>
          <xsl:call-template name="JHEallTopics"/>
        </xsl:element>
      </xsl:when>
      <xsl:otherwise>
          <xsl:call-template name="JHEallTopics"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>




  <xsl:template name="JHEallTopics">
    <div>
<!--         <xsl:message>at div in topic.xsl on my xhtml.xsl JHE</xsl:message> -->
 <!--      <xsl:call-template name="commonAttributes"/> -->
      <xsl:call-template name="commonAttributes"> <!-- JHE patterned after the h3 stuff below -->
<!-- syntactically OK but does not strip topic/topic stuff then        <xsl:with-param name="class" select="concat(@class, ' JHE span4 JHE')"></xsl:with-param> -->
        <xsl:with-param name="classPrefix" select="concat('JHE span4 ', @classPrefix)"/>
      </xsl:call-template>
      <xsl:call-template name="namedAnchor"/>
      <xsl:apply-templates/>
    </div>
  </xsl:template>




<!-- from body.xsl -->
    <!-- note ============================================================== -->

  <xsl:template match="*[contains(@class,' topic/note ')]">
    <xsl:variable name="type">
      <xsl:call-template name="noteType"/>
    </xsl:variable>

    <xsl:variable name="label">
      <xsl:call-template name="localize">
        <xsl:with-param name="message" select="$type"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="icon">
      <xsl:if test="$use-note-icon = 'yes' and
                    index-of($noteIconList, $type) ge 1">
        <img>
          <xsl:attribute name="src"
                         select="concat($xslResourcesDir,
                                        $type, $note-icon-suffix)"/>
          <xsl:attribute name="alt" select="$label"/>
          <xsl:if test="$note-icon-width != ''">
            <xsl:attribute name="width" select="$note-icon-width"/>
          </xsl:if>
          <xsl:if test="$note-icon-height != ''">
            <xsl:attribute name="height" select="$note-icon-height"/>
          </xsl:if>
        </img>
      </xsl:if>
    </xsl:variable>

    <div> 
      <xsl:call-template name="commonAttributes"/>
      <xsl:call-template name="namedAnchor"/>

      <xsl:choose>
        <xsl:when test="exists($icon/*)">
          <table border="0" cellspacing="0" class="note-layout">
            <tr>
              <td class="note-icon">
                <xsl:if test="$xhtmlVersion = '-3.2'">
                  <xsl:attribute name="valign">top</xsl:attribute>
                </xsl:if>

                <xsl:copy-of select="$icon"/>
              </td>
              <td class="note-text">
                <xsl:if test="$xhtmlVersion = '-3.2'">
                  <xsl:attribute name="valign">top</xsl:attribute>
                </xsl:if>

                <h5 class="note-head">
                  <xsl:value-of select="$label"/>
                </h5>

                <div class="note-body">
                  <xsl:apply-templates/>
                </div>
              </td>
            </tr>
          </table>
        </xsl:when>

        <xsl:otherwise>
          <!-- JHE addition .alert + .label -->
<!--          <h5 class="note-head">
            <xsl:value-of select="$label"/>
          </h5> -->
          <span class="label">
            <xsl:value-of select="$label"/>
          </span>           
          <xsl:text> </xsl:text>
          <span class="note-body">
            <xsl:apply-templates/>
          </span>
        </xsl:otherwise>
      </xsl:choose>
    </div>
  </xsl:template>


  <!-- image ============================================================= -->

  <!-- modified by JHE to include link on img - but only the ones in an image-container - this works with fig>image but if we have e.g a >cmd>uicontrol>image to show the icon to click it will not get hyperlinked :-)
       TODO: maybe add more decoration for fancybox - so we depend less on adding stuff dynamically with e.g. jQuery   -->

  <xsl:template match="*[contains(@class,' topic/image ')]">
    <xsl:choose>
      <xsl:when test="@placement = 'break' or
                      parent::*[contains(@class,' topic/fig ')]">
        <div class="image-container">
          <xsl:if test="@align = 'left' or
                        @align = 'right' or
                        @align = 'center'">
            <xsl:attribute name="style"
              select="concat('text-align: ', string(@align), ';')"/>
          </xsl:if>
          
    <a href="{@href}" rel="gallery"> <!-- JHE fancybox would like a rel="gallery" -->
          <xsl:call-template name="namedAnchor"/>
          <xsl:call-template name="imageToImg"/>
    </a>
        </div>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="namedAnchor"/>
        <xsl:call-template name="imageToImg"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>




</xsl:stylesheet>