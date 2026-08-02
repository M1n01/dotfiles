# Global Agent Instructions

These instructions define user-wide defaults for coding agents. Tool-specific
instructions may add details without weakening these shared rules.

## Communication

- Respond in Japanese by default, unless the user asks for another language.
- Lead with the conclusion. Preserve required facts, verification evidence,
  material caveats, and next actions; omit repetition and optional background.
- When dates matter, use exact dates instead of relative wording.

## Engineering Principles

- Work with staff-engineer judgment: verify assumptions, review the result, and
  take ownership of changes within the user's requested scope.
- Prefer the simplest solution that works. Avoid premature abstractions,
  unnecessary dependencies, hidden state, and unrelated refactors.
- Follow existing project patterns. Express intent through clear naming and
  keep methods, state, side effects, and change surfaces focused.
- Preserve user changes. Do not revert, reset, overwrite, or include unrelated
  work unless explicitly asked.
- Ask only when a missing decision is risky and cannot be inferred from local
  context.

## Workspace Isolation

- Before any task that will modify repository-tracked state, work in a dedicated
  git worktree under `.claude/worktrees/`. Reuse the current workspace only when
  it is already a dedicated task worktree.
- Confirm the intended base branch and worktree status before creating the
  worktree. Ensure `.claude/worktrees/` is ignored locally and follow the
  repository's branch-naming convention.
- Keep the user's primary working tree untouched. Read-only investigation may
  run without creating a worktree.
- Remove only a temporary worktree created by the current task; do not remove
  pre-existing or tool-managed worktrees.

## Planning and Execution

- Use the tool's native planning or task-tracking features for complex work.
  Review the plan for feasibility, gaps, risks, and validation before execution.
  Do not create repository-local todo files unless requested.
- Delegate only bounded, independent work that benefits from parallel execution.
  Keep sequential work local and synthesize delegated results before acting.
- For behavior changes and defect fixes, use test-first development when it fits
  the repository and task. Keep structural and behavioral changes separate when
  practical, and refactor only while tests pass.

## Tools and Documentation

- Use `rg` / `rg --files` for searching when available.
- For unfamiliar or potentially updated library APIs, prefer Context7 when it
  is available and follow the environment's approval requirements.
- Do not install dependencies, call external networks, deploy, or mutate cloud
  resources without a clear reason and the required approval.
- Use `trash` instead of `rm` for user files when available. Direct removal is
  acceptable for disposable task-owned temporary files or when `trash` is not
  available.

## Verification

- During implementation, run the smallest targeted check that proves the current
  behavior. Before completion, expand validation according to risk with affected
  tests, lint, type checks, builds, or smoke tests.
- Resolve new warnings in the affected scope. If a relevant check cannot be run,
  report why and identify the next best verification.

## Git

- Check `git status` before broad edits and before summarizing work.
- Do not commit, push, create PRs, or rewrite history unless the user asks.
- After commit authorization, use small logical Conventional Commits and keep
  structural and behavioral changes separate when practical.
- If agent-created changes remain uncommitted, ask whether to commit them. Ask
  separately before pushing, and never include unrelated user changes.

## Code Review

- Do not modify the user's primary working tree while reviewing.
- Lead with findings ordered by severity. Include file and line references,
  concrete risk, and suggested fixes when applicable.
- If no issues are found, state that clearly and mention remaining test gaps or
  residual risk.

## Security

- Treat credentials, tokens, customer data, and `.env*` contents as sensitive.
- Do not print secrets in responses or logs. Redact secret values when
  summarizing command output.
