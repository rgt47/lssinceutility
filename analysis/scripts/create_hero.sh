#!/bin/bash
# Creates a simple SVG hero image for the blog post
# Install ImageMagick: brew install imagemagick

OUTPUT="ls_since_hero.png"

convert -size 1200x600 \
  gradient:'#1e3a8a'-'#1e40af' \
  -font DejaVu-Sans-Bold -pointsize 80 \
  -fill white -gravity center \
  -annotate +0-50 "ls_since.sh" \
  -pointsize 40 \
  -annotate +0+80 "File Discovery by Date" \
  "$OUTPUT"

echo "Created $OUTPUT (1200x600px)"
