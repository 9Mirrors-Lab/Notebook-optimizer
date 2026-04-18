#!/usr/bin/env bash
# Reads Notebook Optimizer Roadmap (GitHub Project) items in "Next Up" or "In Progress"
# and writes a short summary to the Portfolio OS card's Next Action field for Notebook optimizer.
#
# Usage: from repo root, with gh authenticated (or GH_TOKEN in env):
#   ./scripts/sync-portfolio-notebook-next-action.sh
#
# Env (optional overrides):
#   PROJECT_OWNER           default: 9Mirrors-Lab
#   ROADMAP_PROJECT_NUMBER  default: 3
#   PORTFOLIO_PROJECT_ID    Project node id for Portfolio OS
#   PORTFOLIO_ITEM_ID       Project item id (PVTI_...) for the Notebook optimizer card
#   NEXT_ACTION_FIELD_ID    Text field id for Next Action on Portfolio OS

set -euo pipefail

PROJECT_OWNER="${PROJECT_OWNER:-9Mirrors-Lab}"
ROADMAP_PROJECT_NUMBER="${ROADMAP_PROJECT_NUMBER:-3}"
PORTFOLIO_PROJECT_ID="${PORTFOLIO_PROJECT_ID:-PVT_kwHODBMHxs4BU9av}"
PORTFOLIO_ITEM_ID="${PORTFOLIO_ITEM_ID:-PVTI_lAHODBMHxs4BU9avzgqTQ34}"
NEXT_ACTION_FIELD_ID="${NEXT_ACTION_FIELD_ID:-PVTF_lAHODBMHxs4BU9avzhN27-M}"
ROADMAP_URL="${ROADMAP_URL:-https://github.com/users/${PROJECT_OWNER}/projects/${ROADMAP_PROJECT_NUMBER}}"

if ! command -v jq >/dev/null 2>&1; then
  echo "jq is required." >&2
  exit 1
fi

if ! command -v gh >/dev/null 2>&1; then
  echo "gh is required." >&2
  exit 1
fi

QUERY='
query($login: String!, $n: Int!) {
  user(login: $login) {
    projectV2(number: $n) {
      items(first: 100) {
        nodes {
          fieldValues(first: 25) {
            nodes {
              __typename
              ... on ProjectV2ItemFieldTextValue {
                text
                field { ... on ProjectV2FieldCommon { name } }
              }
              ... on ProjectV2ItemFieldSingleSelectValue {
                name
                field { ... on ProjectV2FieldCommon { name } }
              }
            }
          }
        }
      }
    }
  }
}'

RESP="$(gh api graphql -f query="$QUERY" -f login="$PROJECT_OWNER" -F n="$ROADMAP_PROJECT_NUMBER")"

TITLES_STATUSES="$(echo "$RESP" | jq -r '
  .data.user.projectV2.items.nodes[]
  | .fieldValues.nodes as $n
  | (
      ($n | map(select(.field != null and .field.name == "Title") | .text) | first // "")
    ) as $title
  | (
      ($n | map(select(.field != null and .field.name == "Status") | .name) | first // "")
    ) as $status
  | select($title != "" and ($status == "Next Up" or $status == "In Progress"))
  | "\($status)\t\($title)"
')"

NEXT_UP_LIST=()
IN_PROGRESS_LIST=()
MAX_PER_BUCKET=8

while IFS=$'\t' read -r status title; do
  [[ -z "${status:-}" ]] && continue
  case "$status" in
    "Next Up")
      if ((${#NEXT_UP_LIST[@]} < MAX_PER_BUCKET)); then
        NEXT_UP_LIST+=("$title")
      fi
      ;;
    "In Progress")
      if ((${#IN_PROGRESS_LIST[@]} < MAX_PER_BUCKET)); then
        IN_PROGRESS_LIST+=("$title")
      fi
      ;;
  esac
done <<< "$TITLES_STATUSES"

join_by_comma() {
  local out="" s
  local first=1
  for s in "$@"; do
    if [[ -n "$s" ]]; then
      if [[ "$first" -eq 1 ]]; then
        out="$s"
        first=0
      else
        out+=", ${s}"
      fi
    fi
  done
  echo "$out"
}

LINE_NEXT="$(join_by_comma "${NEXT_UP_LIST[@]:-}")"
LINE_IP="$(join_by_comma "${IN_PROGRESS_LIST[@]:-}")"

if [[ -z "$LINE_NEXT" && -z "$LINE_IP" ]]; then
  BODY="Roadmap: nothing in Next up or In progress. (${ROADMAP_URL})"
else
  BODY=""
  [[ -n "$LINE_NEXT" ]] && BODY="Next up: ${LINE_NEXT}"
  [[ -n "$LINE_IP" ]] && {
    [[ -n "$BODY" ]] && BODY+=" · "
    BODY+="In progress: ${LINE_IP}"
  }
  BODY+=" (${ROADMAP_URL})"
fi

if ((${#BODY} > 900)); then
  BODY="${BODY:0:897}…"
fi

echo "Setting Portfolio OS Next Action to:"
echo "$BODY"
echo

gh api graphql -f query='
mutation($pid: ID!, $iid: ID!, $fid: ID!, $txt: String!) {
  updateProjectV2ItemFieldValue(
    input: { projectId: $pid, itemId: $iid, fieldId: $fid, value: { text: $txt } }
  ) {
    projectV2Item { id }
  }
}' -f pid="$PORTFOLIO_PROJECT_ID" -f iid="$PORTFOLIO_ITEM_ID" -f fid="$NEXT_ACTION_FIELD_ID" -f txt="$BODY" >/dev/null

echo "Done."
