#!/bin/bash

/usr/sbin/iptables -F

/usr/sbin/iptables -P INPUT DROP
/usr/sbin/iptables -P FORWARD DROP
/usr/sbin/iptables -P OUTPUT DROP

/usr/sbin/iptables -N LOGDROP
/usr/sbin/iptables -F LOGDROP
/usr/sbin/iptables -A LOGDROP -m limit --limit 5/m --limit-burst 10 -j LOG --log-prefix="Dropping packet: "
/usr/sbin/iptables -A LOGDROP -j DROP

/usr/sbin/iptables -A INPUT -m state --state INVALID -j LOGDROP
/usr/sbin/iptables -A INPUT -p icmp -j LOGDROP
/usr/sbin/iptables -A INPUT -i lo -j ACCEPT
/usr/sbin/iptables -A INPUT -s 192.168.0.3 -p udp -j ACCEPT
/usr/sbin/iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
/usr/sbin/iptables -A INPUT -p udp --dport ntp -j ACCEPT
/usr/sbin/iptables -A INPUT -m limit -j LOG --log-prefix "Blocked on INPUT: "
/usr/sbin/iptables -A INPUT -j DROP

/usr/sbin/iptables -A FORWARD -m state --state INVALID -j LOGDROP
/usr/sbin/iptables -A FORWARD -p icmp -j LOGDROP
/usr/sbin/iptables -A FORWARD -o lo -j ACCEPT
/usr/sbin/iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
/usr/sbin/iptables -A FORWARD -m limit -j LOG --log-prefix "Blocked on FORWARD: "
/usr/sbin/iptables -A FORWARD -j DROP

/usr/sbin/iptables -A OUTPUT -m state --state INVALID -j LOGDROP
# /usr/sbin/iptables -A OUTPUT -p icmp -j LOGDROP
/usr/sbin/iptables -A OUTPUT -o lo -j ACCEPT
/usr/sbin/iptables -A OUTPUT -p udp -d 192.168.0.1 --dport domain -j ACCEPT
/usr/sbin/iptables -A OUTPUT -p udp --dport ntp -j ACCEPT
/usr/sbin/iptables -A OUTPUT -p tcp --dport www -j ACCEPT
/usr/sbin/iptables -A OUTPUT -p tcp --dport https -j ACCEPT
/usr/sbin/iptables -A OUTPUT -p tcp --dport imaps -j ACCEPT
/usr/sbin/iptables -A OUTPUT -p tcp --dport 465 -j ACCEPT
/usr/sbin/iptables -A OUTPUT -p tcp --dport ssh -j ACCEPT
/usr/sbin/iptables -A OUTPUT -p tcp --dport ftp -j ACCEPT
/usr/sbin/iptables -A OUTPUT -p tcp --dport ftp-data -j ACCEPT
/usr/sbin/iptables -A OUTPUT -p tcp --dport xmpp-client -j ACCEPT
/usr/sbin/iptables -A OUTPUT -p tcp --dport 5000 -j ACCEPT
/usr/sbin/iptables -A OUTPUT -p udp --dport mdns -j ACCEPT
/usr/sbin/iptables -A OUTPUT -p tcp --dport 6667 -j ACCEPT
/usr/sbin/iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
/usr/sbin/iptables -A OUTPUT -j LOGDROP
/usr/sbin/iptables -A OUTPUT -m limit -j LOG --log-prefix "Blocked on OUTPUT: "
/usr/sbin/iptables -A OUTPUT -j DROP

# /usr/sbin/iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

/usr/sbin/iptables-save > /etc/iptables/iptables.rules
# /usr/sbin/iptables-restore < /etc/iptables/iptables.rules
