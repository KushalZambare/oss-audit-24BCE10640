PACKAGE="python3" 

echo "================================================"
echo "     FOSS Package Inspector (Python Edition)"
echo "================================================"

if command -v dpkg &>/dev/null; then
    if dpkg -l | grep -q "^ii  $PACKAGE"; then
        echo "Status: $PACKAGE is INSTALLED."
        echo "------------------------------------------"
        dpkg -s $PACKAGE | grep -E 'Version|Maintainer|Description' | head -n 5
    else
        echo "Status: $PACKAGE is NOT installed."
    fi
elif command -v rpm &>/dev/null; then
    if rpm -q $PACKAGE &>/dev/null; then
        echo "Status: $PACKAGE is INSTALLED."
        echo "-----------------------------------------"
        rpm -qi $PACKAGE | grep -E 'Version|License|Summary'
    else
        echo "Status: $PACKAGE is NOT installed."
    fi
elif command -v $PACKAGE &>/dev/null; then
    echo "Status: $PACKAGE is INSTALLED (Detecting via PATH)."
    echo "----------------------------------------------"
    $PACKAGE --version | head -n 1
else
    echo "Error: Could not determine package manager (dpkg/rpm not found)."
    echo "Note: The package '$PACKAGE' is not in your system PATH either."
fi

echo "----------------------------------------------"
case $PACKAGE in
    python3) 
        echo "Python: A high-level language that prioritizes readability and is the backbone of modern data science and AI." ;;
    vlc) 
        echo "VLC: A global media player built by students in Paris, representing the power of free software for all." ;;
    httpd|apache2) 
        echo "Apache: The web server that built the open internet and the backbone of modern web hosting." ;;
    mysql-server|mariadb-server) 
        echo "MySQL/MariaDB: Open source at the heart of millions of web applications and the LAMP stack." ;;
    firefox) 
        echo "Firefox: A browser for the people, built by a non-profit fighting for a private and open web." ;;
    *) 
        echo "$PACKAGE: An open source project contributing to the global community of shared knowledge." ;;
esac
echo "==============================================="