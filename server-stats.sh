echo "===== SERVER PERFORMANCE STATS ====="
echo
echo "CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print "Used CPU: " 100-$8 "%"}'
echo
echo "Memory Usage:"
free -m | awk 'NR==2{
printf "Used: %s MB\nFree: %s MB\nUsage: %.2f%%\n",
$3,$4,$3*100/$2
}'
echo

echo "Disk Usage:"
df -h / | awk 'NR==2{
print "Used: "$3
print "Free: "$4
print "Usage: "$5
}'
echo

echo "Top 5 Processes by CPU Usage:"
ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -6
echo

echo "Top 5 Processes by Memory Usage:"
ps -eo pid,ppid,cmd,%mem --sort=-%mem | head -6
echo
echo "System Uptime:"
uptime -p
echo

echo "Load Average:"
uptime | awk -F'load average:' '{print $2}'
echo

echo "Logged In Users:"
who | wc -l
