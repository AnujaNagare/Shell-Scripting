
cat system_details.sh
# Check if connected to Internet or not
clear
echo -e "\e[4mSystem Information\e[0m"
sleep 2
ping -c 1 -w 5 8.8.8.8 &> /dev/null && int="Connected" || int="Disconnected"
echo -e "\e[32mInternet :\e[0m" "\e[31m$int\e[0m"
sleep 1
os=$(uname -o)
echo -e "\e[32mOperating System Type :\e[0m" "\e[31m$os\e[0m"
sleep 1
typp=`/usr/sbin/dmidecode -s system-manufacturer`
echo -e "\e[32mServer Type :\e[0m" "\e[31m$typp\e[0m"
sleep 1

# Check OS Release Version and Name
###################################
OS=`uname -s`
if [ "${OS}" = "Linux" ] ; then
    if [ -f /etc/redhat-release ] ; then
        DIST=`cat /etc/redhat-release | awk '{print $1,$2}'`
    elif [ -f /etc/SuSE-release ] ; then
        DIST=SuSE
    elif [ -f /etc/mandrake-release ] ; then
        DIST='Mandrake'
    elif [ -f /etc/debian_version ] ; then
        DIST="Debian `cat /etc/debian_version`"
    fi
fi

# Check Architecture
echo -e "\e[32mDistribution :\e[0m" "\e[31m$DIST\e[0m"
sleep 1
architecture=$(uname -m)
echo -e "\e[32mArchitecture :\e[0m" "\e[31m$architecture\e[0m"
sleep 1

# Check Kernel Release
kernelrelease=$(uname -r)
echo -e "\e[32mKernel Release :\e[0m" "\e[31m$kernelrelease\e[0m"
sleep 1

# Check hostname
echo -e "\e[32mHostname :\e[0m" "\e[31m$HOSTNAME\e[0m"
sleep 1

# Check Internal IP
internalip=$(hostname -I)
echo -e "\e[32mInternal IP :\e[0m" "\e[31m$internalip\e[0m"
sleep 1

# Check DNS
nameservers=$(cat /etc/resolv.conf | sed '1 d' | awk '{print $2}')
echo -e "\e[32mName Servers :\e[0m" "\e[31m$nameservers\e[0m"
sleep 1

# Check Logged In Users
who>/tmp/who
echo -e "\e[32mLogged In users :\e[0m"
echo -e "\e[31m`cat /tmp/who`\e[0m"
sleep 1

# Check RAM and SWAP Usages
free -h > /tmp/ramcache
echo -e "\e[32mRam Usages :\e[0m"
sleep 1
echo -e "\e[31m`cat /tmp/ramcache | grep -vi Swap`\e[0m"
echo -e "\e[32mSwap Usages :\e[0m"
sleep 1
echo -e "\e[31m`cat /tmp/ramcache | grep -vi Mem`\e[0m"
sleep 1

# Check Disk Usages
df -h | grep -v tmpfs > /tmp/diskusage
echo -e "\e[32mDisk Usages :\e[0m"
sleep 1
echo -e "\e[31m`cat /tmp/diskusage`\e[0m"
sleep 1

# Disks Details
echo -e "\e[32mDisk details :\e[0m"
echo -e "\e[31m`/usr/sbin/fdisk -l| grep -i Disk| egrep -v 'dos|identifier|mapper'`\e[0m"
sleep 1

# Check Load Average
loadaverage=$(top -n 1 -b | grep "load average:" | awk '{print $10 $11 $12}')
echo -e "\e[32mLoad Average :\e[0m" "\e[31m$loadaverage\e[0m"

# Check System Uptime
tecuptime=$(uptime | awk '{print $3,$4}' | cut -f1 -d,)
echo -e "\e[32mSystem Uptime Days/(HH:MM) :\e[0m" "\e[31m$tecuptime\e[0m"
sleep 1

# Check Routing Table
netstat -rn | grep -v table > /tmp/rou
echo -e "\e[32mKernel IP routing table :\e[0m"
sleep 1
echo -e "\e[31m`cat /tmp/rou`\e[0m"

=============
=============

cat fetch-report.sh
#!/bin/bash
clear
for i in `cat /tmp/myscripts/system-reports/hosts`
do
scp -p $i:/var/scripts/*report.txt /tmp/myscripts/system-reports/reports
done
sleep 5
echo -e "\e[32m#### Report has been created ####\e[0m"
echo -e "\e[47mPlease check the reports on /tmp/myscripts/system-reports/reports\e[0m"


