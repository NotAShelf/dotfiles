#!/bin/sh

# Convert
ffmpeg -i $1 -codec copy $2.mp4
