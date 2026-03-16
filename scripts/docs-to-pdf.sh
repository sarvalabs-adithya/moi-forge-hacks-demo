#!/usr/bin/env bash
# Convert deck (PPTX) and playbook (DOCX) to PDF for viewing on GitHub.
# Requires LibreOffice: brew install --cask libreoffice

set -e
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOCS_DIR="$(cd "$SCRIPT_DIR/../docs" && pwd)"

SOFFICE=""
for path in "/Applications/LibreOffice.app/Contents/MacOS/soffice" "$(which soffice 2>/dev/null)" "$(which libreoffice 2>/dev/null)"; do
  if [[ -n "$path" && -x "$path" ]]; then
    SOFFICE="$path"
    break
  fi
done

if [[ -z "$SOFFICE" ]]; then
  echo "LibreOffice not found. Install with: brew install --cask libreoffice"
  exit 1
fi

cd "$DOCS_DIR"
"$SOFFICE" --headless --convert-to pdf --outdir . MOI_Hacks_Deck.pptx MOI_Hacks_Playbook.docx 2>/dev/null || true
echo "PDFs written to $DOCS_DIR"
ls -la *.pdf 2>/dev/null || echo "No PDFs produced."
