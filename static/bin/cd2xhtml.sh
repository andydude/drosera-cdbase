#!/bin/bash
STATIC_DIR=$(dirname $(dirname $0))
xsltproc $STATIC_DIR/xsl/openmath_cd2xhtml.xsl $1 > ${1%.ocd}.xhtml