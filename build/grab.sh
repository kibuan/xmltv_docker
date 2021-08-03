#!/usr/bin/bash

if [[ -z "$XMLTV_GRABBER" ]]; then
    echo "No 'XMLTV_GRABBER' variable in place. Using default grabber: 'tv_grab_eu_xmltvse'"
    XMLTV_GRABBER="tv_grab_eu_xmltvse"
fi

FILE=/root/.xmltv/${XMLTV_GRABBER}.conf
echo 'Grabber configuration file is: '$FILE
if test -f "$FILE"; then
    if [[ -z "$XMLTV_DAYS" ]]; then
        XMLTV_DAYS="7"
    fi
    if [[ -z "$OUTPUT_XML_FILENAME" ]]; then
    OUTPUT_XML_FILENAME=${XMLTV_GRABBER}.xml
    fi
    echo Running: ${XMLTV_GRABBER} --config-file /root/.xmltv/${XMLTV_GRABBER}.conf --output /opt/xml/${OUTPUT_XML_FILENAME} --days ${XMLTV_DAYS}
    ${XMLTV_GRABBER} --config-file /root/.xmltv/${XMLTV_GRABBER}.conf --output /opt/xml/${OUTPUT_XML_FILENAME} --days ${XMLTV_DAYS}
    echo "grabber finished, exiting..."
else
    echo "$FILE does not exist. Running: '${XMLTV_GRABBER} --configure'"
    ${XMLTV_GRABBER} --configure --config-file /root/.xmltv/${XMLTV_GRABBER}.conf
fi
exit 0
