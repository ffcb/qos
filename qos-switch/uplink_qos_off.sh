#!/bin/sh

uplinkstate=$(uci get qos.wan.enabled 2>/dev/null)

if [ "$uplinkstate" = "1" ]
  then
    uci set qos.wan.enabled=0 2> /dev/null && \
    uci commit qos 2> /dev/null && \
    /etc/init.d/qos reload 2> /dev/null
fi
