if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then
	command_not_found_handle() {
		/data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
	}
fi

PS1='\$ '

clear
FILENAME="/data/data/com.termux/files/usr/etc/user.txt"
while IFS=: read -r username pass
do
IPS="$pass"
USER="$username"
done < $FILENAME
echo -e "\e[32m"                     
cat /data/data/com.termux/files/home/txt.txt
echo -e "\e[91m\n\nEnter Password to unlock"
echo -e  "Password:\e[34m"
read password
if [ "$password" =  "$IPS" ]
then                                      
clear
echo -e "\e[32m"
figlet Unlocked
echo "Welcome $USER"
echo -e "\e[0m"
else
echo -e "\e[91m"
clear
figlet Locked
echo "Incorrect Password"

echo "Wait 3 sec..."
sleep 3
exec bash --login
fi
