

servers=("8.8.8.8" "1.1.1.1" "google.com" "microsoft.com" "facebook.com" "academico.ifms.edu.br.com"  "amazon.com")

log_file="latencylog.txt"

date_time=$(date "+%Y-%m-%d %H:%M:%S")

echo "Teste iniciado em $date_time" | tee -a $log_file

# Loop
for server in "${servers[@]}"; do
    echo "Testando conexao em $server..."
    
    ping_result=$(ping -c 4 $server | tail -1 | awk -F '/' '{print $5}')
    if [ -z "$ping_result" ]; then
        echo "$date_time: $server incessivel." | tee -a $log_file
    else
        echo "$date_time: Latência para $server é ${ping_result} ms" | tee -a $log_file
    fi
done
echo "Teste concluído."

