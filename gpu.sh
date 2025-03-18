#!/bin/bash

# 定义颜色函数
function get_percentage_color() {
    local value=$1
    if (( $(awk "BEGIN {print ($value >= 90)}") )); then
        echo -e "\033[38;5;196m" # 亮红色
    elif (( $(awk "BEGIN {print ($value >= 80)}") )); then
        echo -e "\033[38;5;202m" # 橙红色
    elif (( $(awk "BEGIN {print ($value >= 70)}") )); then
        echo -e "\033[38;5;208m" # 橙色
    elif (( $(awk "BEGIN {print ($value >= 60)}") )); then
        echo -e "\033[38;5;214m" # 黄橙色
    elif (( $(awk "BEGIN {print ($value >= 30)}") )); then
        echo -e "\033[38;5;220m" # 黄色
    else
        echo -e "\033[38;5;46m"  # 绿色
    fi
}

while true; do
    printf "\033c"
    
    current_time=$(date "+%Y-%m-%d %H:%M:%S")
    hostname=$(uname -n)
    
    # 使用青色显示主机信息
    echo -e "Host: \033[36m<$hostname>\033[0m - $current_time (Press Ctrl+C to exit)"
    echo "+---------------+-------------+---------------------------+"
    echo "| GPU Name      | Utilization |        Memory Usage       |"
    echo "+---------------+-------------+---------------------------+"
    
    nvidia-smi --query-gpu=index,name,memory.used,memory.total,utilization.gpu --format=csv,noheader,nounits | while IFS=, read -r gpu_id gpu_name mem_used mem_total util; do
        gpu_id=$(echo "$gpu_id" | xargs)
        gpu_name=$(echo "$gpu_name" | xargs)
        mem_used=$(echo "$mem_used" | xargs)
        mem_total=$(echo "$mem_total" | xargs)
        util=$(echo "$util" | xargs)
        
        gpu_name=$(echo "$gpu_name" | sed 's/NVIDIA //g' | sed 's/GeForce //g' | sed 's/Tesla //g' | sed 's/-SXM4//g' | sed 's/-SXM2//g')
        
        mem_used_gib=$(awk "BEGIN {printf \"%.1f\", $mem_used/1024}")
        mem_total_gib=$(awk "BEGIN {printf \"%.1f\", $mem_total/1024}")
        mem_percentage=$(awk "BEGIN {printf \"%.1f\", ($mem_used/$mem_total)*100}")
        
        # 获取颜色
        util_color=$(get_percentage_color $util)
        mem_color=$(get_percentage_color $mem_percentage)
        
        # 格式化输出带颜色的表格行
        printf "| %-13s | %s%10s%%\033[0m | %s%6.1f/%-6.1f GiB (%4.1f%%)\033[0m |\n" \
               "${gpu_name:0:13}" \
               "$util_color" \
               "$util" \
               "$mem_color" \
               "$mem_used_gib" \
               "$mem_total_gib" \
               "$mem_percentage"
    done
    
    echo "+---------------+-------------+---------------------------+"
    sleep 5
done
