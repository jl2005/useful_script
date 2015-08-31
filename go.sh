#!/bin/bash
function valid_ip()
{
    local  ip=$1
    local  stat=1
    if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        OIFS=$IFS
        IFS='.'
        ip=($ip)
        IFS=$OIFS
        [[ ${ip[0]} -le 255 && ${ip[1]} -le 255 \
            && ${ip[2]} -le 255 && ${ip[3]} -le 255 ]]
        stat=$?
    fi
    return $stat
}

function valid_domain()
{
    local  ip=$1
    splits=`echo $ip |awk -F'.' '{print NF}'`
    if [ $splits -gt 2 ]; then
    return 0
    else
    return 1
    fi
}

function print_help()
{
	echo "usage: $0 alias|host|name|ip"
	echo "-------------------------------------"
	echo "go 164 | 115.231.105.164"
	echo "go 166 | 115.231.105.166"
	echo "go db  | 192.168.7.183"
	echo "go bj  | 192.168.129.7"
}

if [ $# == 0 ]; then
	print_help;
    exit
fi

if [ $# == 1 ]; then
	if [ $1 == "164" ]; then
        echo "goto 115.231.105.164"
        ssh -p 34185 jiaolong@115.231.105.164
    elif [ $1 == "166" ]; then
        echo "goto 115.231.105.166"
        ssh -p 34185 jiaolong@115.231.105.166
    elif [ $1 == "db" ]; then
        echo "goto 192.168.7.183"
        ssh -p 34185 jiaolong@192.168.7.183
    elif [ $1 == "bj" ]; then
        echo "goto 192.168.129.7"
        ssh -p 34185 jiaolong@192.168.129.7
	fi
fi
