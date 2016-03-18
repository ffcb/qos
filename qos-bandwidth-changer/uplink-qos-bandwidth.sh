#!/bin/sh

uploadbandwidth=$(uci get qos.wan.upload 2>/dev/null)
downloadbandwidth=$(uci get qos.wan.download 2>/dev/null)

if [ "$uploadbandwidth" != "1000" -o "$downloadbandwidth" != "16000" ]
  then
    uci set qos.wan.upload=1000 2> /dev/null && \
    uci set qos.wan.download=16000 2> /dev/null && \
    uci commit qos 2> /dev/null && \
    /etc/init.d/qos reload 2> /dev/null
fi
