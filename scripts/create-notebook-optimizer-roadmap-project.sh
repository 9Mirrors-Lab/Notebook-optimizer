#!/usr/bin/env bash
# Creates the "Notebook Optimizer Roadmap" GitHub Project (Projects v2), links this repo,
# sets Status column options (Backlog, Next Up, In Progress, Done), and adds issue #1 if present.
#
# Prerequisite (one time):
#   gh auth refresh -s project -s read:project -h github.com
#
# Usage: from repo root, ./scripts/create-notebook-optimizer-roadmap-project.sh

set -euo pipefail

OWNER="${OWNER:-9Mirrors-Lab}"
REPO_NAME="${REPO_NAME:-Notebook-optimizer}"
TITLE="${TITLE:-Notebook Optimizer Roadmap}"
DESCRIPTION="${DESCRIPTION:-Operating board: completed history, current priorities, and future features for returning later.}"

if ! command -v jq >/dev/null 2>&1; then
  echo "This script requires jq. Install jq and retry." >&2
  exit 1
fi

echo "Creating project: $TITLE"
set +e
CREATE_JSON=$(gh project create --owner "$OWNER" --title "$TITLE" --format json 2>&1)
CREATE_EC=$?
set -e
if [[ "$CREATE_EC" -ne 0 ]]; then
  echo "$CREATE_JSON" >&2
  echo "" >&2
  echo "If you see 'missing required scopes', run:" >&2
  echo "  gh auth refresh -s project -s read:project -h github.com" >&2
  exit 1
fi

PROJ_NUM=$(echo "$CREATE_JSON" | jq -r '.number')

echo "Linking to $OWNER/$REPO_NAME"
gh project link "$PROJ_NUM" --owner "$OWNER" --repo "$OWNER/$REPO_NAME"

README_BODY="## Notebook Optimizer Roadmap

**Goal:** Organize completed historical work, current priorities, and future features so this repo has a clear roadmap when returning later.

**Workflow columns:** Backlog | Next Up | In Progress | Done
"

gh project edit "$PROJ_NUM" --owner "$OWNER" \
  --description "$DESCRIPTION" \
  --readme "$README_BODY" \
  --visibility PUBLIC

echo "Updating Status field options"
STATUS_FIELD_ID=$(gh api graphql -f query='
query($owner: String!, $n: Int!) {
  user(login: $owner) {
    projectV2(number: $n) {
      fields(first: 30) {
        nodes {
          ... on ProjectV2SingleSelectField {
            id
            name
          }
        }
      }
    }
  }
}' -f owner="$OWNER" -F n="$PROJ_NUM" | jq -r '
  (.data.user.projectV2.fields.nodes // [])
  | map(select(.name == "Status"))
  | first
  | .id // empty
')

if [[ -z "$STATUS_FIELD_ID" ]]; then
  echo "Could not find Status field on the new project. Set columns manually in the GitHub UI." >&2
else
  INPUT_JSON=$(jq -n \
    --arg fid "$STATUS_FIELD_ID" \
    '{
      fieldId: $fid,
      singleSelectOptions: [
        {name: "Backlog", color: "GRAY", description: ""},
        {name: "Next Up", color: "BLUE", description: ""},
        {name: "In Progress", color: "YELLOW", description: ""},
        {name: "Done", color: "GREEN", description: ""}
      ]
    }')
  TMPVARS=$(mktemp)
  printf '%s' "$INPUT_JSON" >"$TMPVARS"
  gh api graphql \
    -f query='mutation ($input: UpdateProjectV2FieldInput!) {
      updateProjectV2Field(input: $input) {
        projectV2Field {
          ... on ProjectV2SingleSelectField {
            name
            options { id name }
          }
        }
      }
    }' \
    -F input=@"$TMPVARS" | jq .
  rm -f "$TMPVARS"
fi

ISSUE_URL="https://github.com/$OWNER/$REPO_NAME/issues/1"
if gh issue view 1 --repo "$OWNER/$REPO_NAME" >/dev/null 2>&1; then
  echo "Adding issue #1 to the project"
  gh project item-add "$PROJ_NUM" --owner "$OWNER" --url "$ISSUE_URL" || true
fi

echo ""
echo "Done. Project URL:"
gh project view "$PROJ_NUM" --owner "$OWNER" --format json | jq -r '.url // empty'
echo "(Or run: gh project view $PROJ_NUM --owner $OWNER --web)"
