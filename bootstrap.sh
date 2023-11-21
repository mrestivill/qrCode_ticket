#!/bin/bash
destfile="config.py"
if [ ! -f "$destfile" ]
then 
    echo "creating config file" 
    echo "INPUT_FILE_PATH='$INPUT_FILE_PATH'">"$destfile"
    echo "OUTPUT_FILE_PATH='$OUTPUT_FILE_PATH'">>"$destfile"
    echo "ADMIN_PASSWORD='$ADMIN_PASSWORD'">>"$destfile"
    echo "DOMAIN_NAME='$DOMAIN_NAME'">>"$destfile"
    echo "PAGE_TITLE='$PAGE_TITLE'">>"$destfile"
    echo "EVENT_NAME='$EVENT_NAME'">>"$destfile"
    echo "created config file"
fi
outputfile="$OUTPUT_FILE_PATH"
if [ ! -f "$outputfile" ]
then
	echo "generating output file ..."
	echo y | python main.py generate_ticket_link
fi
python main.py run_webserver 
