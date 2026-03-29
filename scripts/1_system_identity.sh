STUDENT_NAME="Kushal Sanjay Zambare"
SOFTWARE_CHOICE="Python Programming Language" 

if [ -f /etc/os-release ]; then
    DISTRO=$(cat /etc/os-release | grep -w "PRETTY_NAME" | cut -d= -f2 | tr -d '"')
else
    DISTRO=$(uname -s) 
fi

KERNEL=$(uname -r)
USER_NAME=$(whoami)
HOME_DIR=$HOME

if command -v uptime &>/dev/null && uptime -p &>/dev/null; then
    UPTIME=$(uptime -p)
else
    UPTIME="Uptime not available (on Windows Git Bash)"
fi
DATE_TIME=$(date '+%A, %d %B %Y | %T')

LICENSE_MSG="This system is powered by Linux, licensed under the GNU General Public License (GPL) v2.0."

echo "=========================================================="
echo "          Open Source Audit — $STUDENT_NAME"
echo "=========================================================="
echo "Project Theme : $SOFTWARE_CHOICE"
echo "Operating System : $DISTRO"
echo "Kernel Version   : $KERNEL"
echo "Current User     : $USER_NAME"
echo "Home Directory   : $HOME_DIR"
echo "System Uptime    : $UPTIME"
echo "Current Date/Time: $DATE_TIME"
echo "----------------------------------------------------------"
echo "License Note:"
echo "$LICENSE_MSG"
echo "=========================================================="
