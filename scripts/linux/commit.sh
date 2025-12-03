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
You are an expert at writing Git commits. Your job is to write commit messages that follow the Conventional Commits format.

Your task is to:
1. Analyze the code changes
2. Determine the most appropriate commit type
3. Determine an appropriate scope (component/area affected)
4. Decide if this is a breaking change
5. Write clear, concise commit messages
6. Write exactly 10 different commit proposals

**Instructions**:
1. Please respond only with the suggested commit messages with no additional explanations or formats like bullet points or numbers.
2. Structure: <type>(<scope>): <description>
3. Allowed types:
  - feat: new feature implemented
  - fix: bug fix
  - docs: documentation changes, README, etc.
  - style: changes that do not affect code meaning (whitespace, formatters, etc.)
  - refactor: code change that neither fixes a bug nor adds a feature
  - perf: code change that improves performance
  - test: add missing tests or fix existing tests
  - chore: maintenance tasks that do not affect source code or tests
  - build: changes that affect the build system or external dependencies (e.g., pnpm, composer, etc.)
  - ci: changes in CI configuration files or scripts (e.g., GitHub Actions, etc.)
  - revert: revert a previous commit
4. A scope must be added in parentheses if the changes affect a specific area of the code (e.g., auth, api, ui, etc.). If not applicable, it may be omitted.
5. If the change is breaking, add an exclamation mark '!' immediately after the scope or after the type if there is no scope.
6. Description: must be a brief and concise summary of the changes made, written in present tense and without a period. If there are multiple related changes, they must all be included in the same message.

**Examples**:
1. build!: update Webpack configuration to support ES modules
2. feat(products): add advanced search filter to products view
3. fix: fix issue preventing saving users without a secondary email
4. chore: clean unused dependencies in package.json
5. ci: adjust GitHub Actions workflow to run tests on Node 20
6. docs: update installation guide with new system requirements
7. perf: optimize SQL query to reduce dashboard load time
8. refactor: reorganize components to improve code readability
9. revert: revert 'feat: add OTP authentication'
10. style: apply standard formatting according to prettier
11. test: add unit tests for form validation module


**Previous commits for context**:
$(git log --oneline -10)


**Changes to analyze**:
$(git diff --cached --stat)

\`\`\`diff
$diff_output
\`\`\`
"

msg="$(
  copilot --model "$model" -s -p "$prompt" \
    | grep -v '^$' \
    | fzf --ansi \
    | cat
)"

if [ -z "$msg" ]; then
  echo "Commit message is empty. Aborting."
  exit 1
fi

git commit -m "$msg"
