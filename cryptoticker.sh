#!/usr/bin/env bash

# cryptoticker
#


# Array -> Symbols
    symbols=("BTC-USDT" "ETH-USDT" "XMR-USDT" "DFI-USDT" "ATOM-USDT" "XTZ-USDT" "BNB-USDT" "SOL-USDT" "FTT-USDT" "CRO-USDT" )
    
    
# Loop Time s    
    t=60


# Def get_price
    get_price() {
        price=$(curl -s -H -X GET 'https://api.kucoin.com/api/v1/market/orderbook/level1?symbol='$1 | jq -r '.data.price')
        echo -e -n "$price"
    }


# Def get_change24h
    get_change24h() {
        change24h_t=$(curl -s -H -X GET 'https://api.kucoin.com/api/v1/market/stats?symbol='$1 | jq -r '.data.changeRate')
        change24h=`printf %.2f $(echo "scale=0; $change24h_t*100" | bc | sed -e 's/^-\./-0./' -e 's/^\./0./')`
        echo -e -n "$change24h"
    }


# Def header
    header() {
        echo -e "\n"
        echo -e " # Cryptoticker"
        echo -e "\n"
    }


# Def data -> Loop Symbols
    price() {
        for i in "${symbols[@]}"
        do
            echo -n -e "\t$i\t"
                get_change24h $i
            echo -n -e "\t\t"
                get_price $i
            echo -e -n "\n"
        done
    
        echo -e "\n\n\n\tLoop time \t$t s"
        echo -e "\tLast change \t"`date +'%H:%M'`
    }


# Exit
    exit_f() {
        echo -n -e "\n\n\n\t Exit(e) -> "
        read -t $t exit_f
        
        if [ "$exit_f" == "e" ]
        then
            clear
            exit 1
        else
            clear
            init
        fi      
    }
    

# Init
    init() {
        clear
        header
        price
        exit_f
    }
    init



# End
#
#

