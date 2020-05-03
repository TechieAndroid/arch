#!/bin/bash

# xrandr --dpi 180

xrdb -merge ~/.Xresources

~/2in1screen &   # <<< invoke the binary around here will be fine

exec i3
