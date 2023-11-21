#!/bin/bash
destfile="config.php"
if [ -f "$destfile" ]
then 
    echo "$var" > "$destdir"
    echo "INPUT_FILE_PATH='$INPUT_FILE_PATH'">"$destfile"
    echo "OUTPUT_FILE_PATH='$OUTPUT_FILE_PATH'">>"$destfile"
    echo "ADMIN_PASSWORD='$ADMIN_PASSWORD'">>"$destfile"
    echo "DOMAIN_NAME='$DOMAIN_NAME'">>"$destfile"
    echo "PAGE_TITLE='$PAGE_TITLE'">>"$desftile"
    echo "EVENT_NAME='$EVENT_NAME'">>"$destfile"
fi
python main.py run_webserver 
