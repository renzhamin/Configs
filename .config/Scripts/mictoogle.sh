#!/bin/sh

name="WAVEFUN Flex Pro"
out=$(pacmd list-cards | grep "$name" -B5)
wrn=$(echo "$out" | sed -n 's/.*name:.*<\(.*\)>/\1/p')
a=$(echo "$out" | sed -n 's/.*active\ profile.*<\(.*\)>/\1/p')
 
([ -z $wrn ] && pacmd set-card-profile 0 output:analog-stereo+input:analog-stereo) || \
    
([ "$a" = "headset_head_unit" ] && (pacmd set-card-profile "$wrn" a2dp_sink & pacmd set-card-profile 0 output:analog-stereo+input:analog-stereo)) || \
    
([ "$a" = "a2dp_sink" ] && (pacmd set-card-profile "$wrn" headset_head_unit & pacmd set-card-profile 0 output:analog-stereo))


