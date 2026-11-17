#!/bin/bash
# Export all brochures to PDF (A4, backgrounds on) into ~/Downloads.
# Usage: ./make-pdfs.sh [output-dir]
set -e
cd "$(dirname "$0")"
OUT="${1:-$HOME/Downloads}"
CH="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
pdf() { "$CH" --headless=new --disable-gpu --virtual-time-budget=15000 --no-pdf-header-footer \
          --print-to-pdf="$OUT/$2" "file://$PWD/$1" 2>/dev/null && echo "  $OUT/$2"; }
pdf index.html             "Entra — חוברת לאדריכלים.pdf"
pdf realtors/index.html    "Entra — חוברת למתווכים.pdf"
pdf en/index.html          "Entra — Brochure for Architects.pdf"
pdf realtors/en/index.html "Entra — Brochure for Realtors.pdf"
