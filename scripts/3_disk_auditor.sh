DIRS=("/etc" "/usr/bin" "/tmp" "$HOME")

if [ -f /etc/os-release ]; then
    PY_LIB_DIR="/usr/lib/python3"
else
    if command -v python3 &>/dev/null; then
        PY_LIB_DIR=$(python3 -c "import sysconfig; print(sysconfig.get_path('stdlib'))")
    elif command -v python &>/dev/null; then
        PY_LIB_DIR=$(python -c "import sysconfig; print(sysconfig.get_path('stdlib'))")
    else
        PY_LIB_DIR="/usr/lib/python3"
    fi
fi

if [ -d "$PY_LIB_DIR" ]; then
    DIRS+=("$PY_LIB_DIR")
fi

echo "=========================================================="
echo "          Disk and Permission Auditor Report"
echo "=========================================================="
printf "%-25s %-15s %-15s\n" "Directory" "Size" "Permissions"
echo "----------------------------------------------------------"

for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        
        if [ -z "$SIZE" ]; then
            SIZE="N/A (Sudo Reqd)"
        fi

        printf "%-25s %-15s %-15s\n" "$DIR" "$SIZE" "$PERMS"
    else
        echo "$DIR => DOES NOT EXIST ON THIS SYSTEM"
    fi
done

echo "----------------------------------------------------------"
if [ -d "$PY_LIB_DIR" ]; then
    echo "Found Python Standard Libraries: $PY_LIB_DIR"
    echo "Current Permissions of Python Libs: $(ls -ld "$PY_LIB_DIR" | awk '{print $1}')"
else
    echo "Note: Python 3 library directory not found at standard location ($PY_LIB_DIR)."
fi
echo "=========================================================="
