# note as we use this script in nix there's no need for shebang

# Allowed choices are
# - claude-sonnet-4.5
# - claude-haiku-4.5
# - claude-opus-4.5
# - claude-sonnet-4
# - gpt-5
# - gpt-5.1
# - gpt-5.1-codex-mini
# - gpt-5.1-codex
# - gpt-5-mini
# - gpt-4.1
# - gemini-3-pro-preview.

model="gpt-4.1"
agent="commit-creator"
diff_output="$(git diff --cached)"
diff_unstaged="$(git diff)"

if [ -z "$diff_output" ]; then
  echo "Error: No staged changes."
  exit 1
fi

if [ -n "$diff_unstaged" ]; then
  echo "Error: There are unstaged changes. Please stage or stash them first."
  exit 1
fi


prompt="
**Previous commits for context**:
$(git log --oneline -10)

**Changes to analyze**:
$(git diff --cached --stat)

\`\`\`diff
$diff_output
\`\`\`
"

msg="$(
  copilot --no-color --model "$model" --agent "$agent" -s -p "$prompt" \
    | grep -v '^$' \
    | fzf \
    | cat
)"

if [ -z "$msg" ]; then
  echo "Error: Commit message is empty. Aborting."
  exit 1
fi

git commit -m "$msg"
