
LOGFILE=${1:-"/var/log/syslog"} 
if [ ! -f "$LOGFILE" ] && [ -f "sample.log" ]; then
    LOGFILE="sample.log"
fi
KEYWORD=${2:-"error"}          
COUNT=0

echo "=========================================================="
echo "          Log File Analyzer (Keyword: $KEYWORD)"
echo "=========================================================="

if [ ! -f "$LOGFILE" ]; then
    echo "Error: Log file '$LOGFILE' not found or is inaccessible."
    exit 1
fi

while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

echo "Summary:"
echo "- Analyzed Log  : $LOGFILE"
echo "- Found Keyword : $KEYWORD"
echo "- Total Counts  : $COUNT"
echo "----------------------------------------------------------"


echo "Last 5 matching lines:"
grep -i "$KEYWORD" "$LOGFILE" | tail -n 5 
echo "=========================================================="

