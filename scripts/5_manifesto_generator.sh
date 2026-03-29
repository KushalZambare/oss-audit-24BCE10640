echo "=========================================================="
echo "          Open Source Manifesto Generator"
echo "=========================================================="
echo "Answer three questions to generate your personalized manifesto."
echo ""

read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

DATE=$(date '+%d %B %Y')
USER_NAME=$(whoami | tr '\\' '_')
OUTPUT="manifesto_${USER_NAME}_$(date +%Y%m%d).txt"

echo "==========================================================" > "$OUTPUT"
echo "        A PERSONAL OPEN SOURCE MANIFESTO" >> "$OUTPUT"
echo "==========================================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "On this day, $DATE, I, $USER_NAME, reflect on the nature of software." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "To me, '$FREEDOM' is the core of innovation. It is why I rely on tools like '$TOOL'" >> "$OUTPUT"
echo "to solve problems every day. Open source is not just about free code; it's about the" >> "$OUTPUT"
echo "freedom to learn, to modify, and to share knowledge for the benefit of all." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "If I were to build something from scratch to give back to the world, I would" >> "$OUTPUT"
echo "create '$BUILD'. Like 'Python' and the giants before me, I recognize" >> "$OUTPUT"
echo "that we all stand on the shoulders of those who chose transparency over secrecy." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "----------------------------------------------------------" >> "$OUTPUT"
echo "Generated via the OSS Audit Project | Course: OSS NGMC" >> "$OUTPUT"
echo "==========================================================" >> "$OUTPUT"

echo "----------------------------------------------------------"
echo "Manifesto saved to: $OUTPUT"
echo "----------------------------------------------------------"
echo "Previewing your manifesto:"
echo "----------------------------------------------------------"
cat "$OUTPUT"
echo "----------------------------------------------------------"
echo "NOTE: An alias was used to simplify this process: 'alias gen=./manifesto_generator.sh'"
echo "=========================================================="