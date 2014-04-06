<t:stylesheet xmlns:t="http://www.w3.org/1999/XSL/Transform"
              xmlns:cd="http://www.openmath.org/OpenMathCD"
              xmlns="http://www.w3.org/1999/xhtml"
              version="1.0">

  <t:include href="www.openmath.org/cdfiles2/xsl/om2pmml.xsl"/>

  <!-- handled by / -->
  <t:template match="cd:CDBase"/>
  <t:template match="cd:CDDate"/>
  <t:template match="cd:CDName"/>
  <t:template match="cd:CDReviewDate"/>
  <t:template match="cd:CDRevision"/>
  <t:template match="cd:CDStatus"/>
  <t:template match="cd:CDURL"/>
  <t:template match="cd:CDVersion"/>

  <t:template match="/cd:CD">
    <html>
      <head>
        <link rel="stylesheet" href="../../static/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../../static/css/bootstrap-theme.min.css"/>
        <style>
          .jumbotron hr { border-color: #ddd; }
        </style>
      </head>
      <body>

        <div class="navbar navbar-default">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="">
                <abbr title="OpenMath Content Dictionary">OMCD</abbr>
                <t:text>: </t:text>
                <strong><t:value-of select="normalize-space(cd:CDName)"/></strong>
              </a>
            </div>
            <div class="collapse navbar-collapse">
              <ul class="nav navbar-nav">
                <li class="dropdown">
                  <a href="" class="dropdown-toggle" data-toggle="dropdown">Definitions <b class="caret"></b></a>
                  <ul class="dropdown-menu">
                    <t:for-each select="cd:CDDefinition">
                      <li>
                        <a>
                          <t:attribute name="href">
                            <t:text>#</t:text>
                            <t:value-of select="normalize-space(cd:Name)"/>
                          </t:attribute>
                          <t:value-of select="normalize-space(cd:Name)"/>
                        </a>
                      </li>
                    </t:for-each>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
        </div>
        
        <div class="container">
          <div class="jumbotron">
            <h1>
              <span class="om-cd-name">
                <t:value-of select="normalize-space(cd:CDName)"/>
              </span>
            </h1>
            <hr/>
            <p><t:value-of select="cd:Description"/></p>
            <hr/>
            <dl class="dl-horizontal">
              <dt>URL</dt>
              <dd>
                <a>
                  <t:choose>
                    <t:when test="normalize-space(cd:CDURL) != ''">
                      <t:attribute name="href">
                        <t:value-of select="normalize-space(cd:CDURL)"/>
                      </t:attribute>
                      <t:value-of select="normalize-space(cd:CDURL)"/>
                    </t:when>
                    <t:otherwise>
                      <t:attribute name="href">
                        <t:value-of select="normalize-space(cd:CDBase)"/>
                        <t:text>/</t:text>
                        <t:value-of select="normalize-space(cd:CDName)"/>
                      </t:attribute>
                      <t:value-of select="normalize-space(cd:CDBase)"/>
                      <t:text>/</t:text>
                      <t:value-of select="normalize-space(cd:CDName)"/>
                    </t:otherwise>
                  </t:choose>
                </a>
              </dd>
              <dt>Base</dt>
              <dd>
                <a>
                  <t:attribute name="href">
                    <t:value-of select="normalize-space(cd:CDBase)"/>
                  </t:attribute>
                  <t:value-of select="normalize-space(cd:CDBase)"/>
                </a>
              </dd>
              <dt>Date</dt>
              <dd><t:value-of select="normalize-space(cd:CDDate)"/></dd>
              <t:choose>
                <t:when test="normalize-space(cd:CDReviewDate) != ''">
                  <dt>ReviewDate</dt>
                  <dd><t:value-of select="normalize-space(cd:CDReviewDate)"/></dd>
                </t:when>
              </t:choose>
              <dt>Status</dt>
              <dd><t:value-of select="normalize-space(cd:CDStatus)"/></dd>
              <t:choose>
                <t:when test="normalize-space(cd:CDUses) != ''">
                  <dt>CDUses</dt>
                  <dd><t:value-of select="normalize-space(cd:CDUses)"/></dd>
                </t:when>
              </t:choose>
              <dt>Version</dt>
              <dd>
                <t:value-of select="normalize-space(cd:CDVersion)"/>
                <t:choose>
                  <t:when test="normalize-space(cd:CDRevision) != ''">
                    <t:text>.</t:text>
                    <t:value-of select="normalize-space(cd:CDRevision)"/>
                  </t:when>
                </t:choose>
              </dd>
            </dl>
          </div>

          <t:apply-templates/>
        </div>

        <script src="../../static/js/vendor/modernizr-2.6.2.min.js"><t:text> </t:text></script>
        <script src="../../static/js/vendor/jquery-1.10.2.min.js"><t:text> </t:text></script>
        <script src="../../static/js/bootstrap.min.js"><t:text> </t:text></script>
      </body>
    </html>
  </t:template>

  <t:template match="/cd:CD/cd:CDComment"/>

  <t:template match="cd:CDComment">
    <div class="panel panel-default">
      <div class="panel-heading">
        <div class="panel-title">
          Comment: <t:apply-templates/>
        </div>
      </div>
    </div>
  </t:template>

  <t:template match="cd:Example">
    <div class="panel panel-success">
      <div class="panel-heading">
        <div class="panel-title">
          Example: <t:apply-templates select="text()"/>
        </div>
      </div>
      <div class="panel-body">
        <t:apply-templates select="*"/>
      </div>
    </div>
  </t:template>

  <t:template match="cd:CMP"/>

  <t:template match="cd:FMP">
    <div class="panel panel-info">
      <div class="panel-heading">
        <div class="panel-title">
          Property: <t:apply-templates select="./preceding-sibling::cd:CMP[1]/text()"/>
        </div>
      </div>
      <div class="panel-body">
        <t:apply-templates/>
      </div>
    </div>
  </t:template>


  <t:template match="/cd:CD/cd:CDDefinition/cd:Description"/>

  <t:template match="/cd:CD/cd:Description"/>

  <!-- handled by CDDefinition -->
  <t:template match="cd:Name"/>
  <t:template match="cd:Role"/>

  <t:template match="cd:CDDefinition">
    <div class="panel panel-primary">
      <div class="panel-heading">
        <span class="panel-title">
          <a class="om-name-link">
            <t:attribute name="name">
              <t:value-of select="normalize-space(cd:Name)"/>
            </t:attribute>
          </a>
          <b class="om-name"><t:value-of select="normalize-space(cd:Name)"/></b>
          <span class="om-role pull-right">
            <t:choose>
              <t:when test="contains('aeiou', substring(normalize-space(cd:Role), 1, 1))">
                <t:text> an </t:text>
              </t:when>
              <t:otherwise>
                <t:text> a </t:text>
              </t:otherwise>
            </t:choose>
            <t:value-of select="normalize-space(cd:Role)"/>
          </span>
          <span class="clearfix"/>
        </span>
      </div>
      <div class="panel-body">
        <t:value-of select="normalize-space(cd:Description)"/>
        <hr/>
        <t:apply-templates/>
      </div>
    </div>
  </t:template>

</t:stylesheet>
