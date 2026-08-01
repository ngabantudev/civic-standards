---
name: new-civic-repo
description: Scaffold the shared civic standards files into a repo — license, data license register, contributing docs, issue templates, and the CLAUDE.md policy block.
disable-model-invocation: true
argument-hint: "[repo-name]"
allowed-tools: Read Write Edit Glob Bash(git status *) Bash(git rev-parse *)
---

Set up shared civic standards in the current repo. Works for a brand-new repo and for retrofitting an existing one.

## 1. Verify placement

Confirm the repo is under the civic tree and carries the civic identity:

```
git rev-parse --show-toplevel
git config github.user
```

`github.user` must be `ngabantudev`. If it is not, stop and report — the repo is in the wrong tree and every file below would be scaffolded under the wrong account.

## 2. Copy templates

Templates live in `${CLAUDE_SKILL_DIR}/templates/`. For each, create it only if absent; if present, report the difference and ask before overwriting.

- `LICENSE` — from the template matching the repo's chosen license
- `LICENSE-DATA.md`
- `CONTRIBUTING.md`
- `CODE_OF_CONDUCT.md`
- `.github/ISSUE_TEMPLATE/data-correction.md`
- `.github/ISSUE_TEMPLATE/new-source.md`

Substitute the repo name and current year.

## 3. Policy block in CLAUDE.md

Every civic repo's `CLAUDE.md` opens with the shared policy block from `${CLAUDE_SKILL_DIR}/templates/CLAUDE-policy-block.md`, then continues with repo-specific architecture below it.

- No `CLAUDE.md`: create it with the policy block, then interview the user for the architecture and commands sections.
- Existing `CLAUDE.md`: insert the policy block at the top if absent. Do not remove or rewrite existing architecture content.

The block is deliberately short. It states the boundary and points at the plugin skills for the detail, so seven repos do not drift into seven versions of the same policy.

## 4. AGENTS.md

Claude Code reads `CLAUDE.md`; other agents read `AGENTS.md`. Symlink so they never diverge:

```
ln -sf AGENTS.md CLAUDE.md
```

If `AGENTS.md` already exists as a real file with different content, report the difference rather than clobbering it.

## 5. README check

Confirm the README states: what the repo maps, where the data comes from, the one command that rebuilds data from upstream, and the license. Report what is missing. Do not invent project description text — ask.

## 6. Report

List what was created, what already existed, what differed, and anything the user must decide.
