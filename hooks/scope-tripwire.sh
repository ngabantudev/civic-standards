#!/usr/bin/env bash
# Blocks writes that introduce individual-level identifiers into a civic repo.
# A tripwire, not a guarantee: it catches conventional field names and forces a
# deliberate decision on the rest. It cannot catch a field named `subject_ref`.
set -uo pipefail

input=$(cat)
path=$(printf '%s' "$input" | jq -r '.tool_input.file_path // ""')
body=$(printf '%s' "$input" | jq -r '
  (.tool_input.content // "") + "\n" +
  (.tool_input.new_string // "") + "\n" +
  ((.tool_input.edits // []) | map(.new_string // "") | join("\n"))
')

[ -z "$body" ] && exit 0

# Only guard civic sessions. Resolve from cwd, not the target path — writes to
# the scratchpad or any non-repo directory would otherwise skip the check.
cwd=$(printf '%s' "$input" | jq -r '.cwd // ""')
owner=$(git -C "$cwd" config --get github.user 2>/dev/null || true)
[ -z "$owner" ] && owner=$(git -C "$(dirname "$path")" config --get github.user 2>/dev/null || true)
[ "$owner" != "ngabantudev" ] && exit 0

# Skip the files whose job is to talk about the policy.
case "$path" in
  */CLAUDE.md|*/AGENTS.md|*/CONTRIBUTING.md|*/CODE_OF_CONDUCT.md|*/SKILL.md|*/.github/*) exit 0 ;;
esac

# Officials directories opt in per repo. Declared office-field names are
# exempted; bare personal identifiers still block, even here.
allow_officials=$(git -C "$cwd" config --get civic.allowOfficials 2>/dev/null || true)
if [ "$allow_officials" = "true" ]; then
  ALLOWED='(official_name|officeholder|office_title|office_contact|office_phone|office_email|term_start|term_end)'
  body=$(printf '%s' "$body" | grep -vEi "$ALLOWED" || true)
  [ -z "$body" ] && exit 0
fi

PATTERN='(first_name|last_name|full_name|middle_name|maiden_name)'
PATTERN+='|(date_of_birth|dob|birth_date)'
PATTERN+='|(a_number|alien_number|alien_registration)'
PATTERN+='|(badge_number|officer_id|employee_id)'
PATTERN+='|(detainee|inmate|arrestee|defendant_name)'
PATTERN+='|(ssn|social_security)'
PATTERN+='|(home_address|residential_address)'
PATTERN+='|(license_plate|plate_number)'
PATTERN+='|(booking_number|case_number|docket_number)'

hits=$(printf '%s' "$body" | grep -oEi "$PATTERN" | sort -u | tr '\n' ' ')

if [ -n "$hits" ]; then
  cat >&2 <<EOF
SCOPE TRIPWIRE — write to $path blocked.

Individual-identifier patterns found: $hits

Civic repos are systems-only: transparency for systems, privacy for people.
Nothing may name, track, or locate a private individual — including people
subject to these systems and people who operate them.

If the upstream source mixes individual records into systemic data, ingest
the systemic attributes and drop the rest at the ingest boundary. If this is
a false positive (an unrelated use of the word, a comment, a fixture), say so
and the user can approve the write directly.
EOF
  exit 2
fi

exit 0
