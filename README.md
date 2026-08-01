# civic-standards

Shared standards for the civic repos under `ngabantudev`. Not shared code —
shared policy: scope boundary, sourcing discipline, open-source posture, and
new-repo scaffolding.

## What's in it

| Component | Kind | Behavior |
|---|---|---|
| `scope` | skill, model-invoked | Systems-not-individuals boundary |
| `sourcing` | skill, model-invoked | Primary-source hierarchy, provenance, corrections |
| `openness` | skill, model-invoked | Licensing, contributors, dependency policy, a11y |
| `new-civic-repo` | skill, user-invoked | Scaffolds the shared files into a repo |
| scope tripwire | hook, PreToolUse | Blocks writes introducing individual identifiers |

The three model-invoked skills load automatically when relevant, in every
repo where the plugin is enabled. That is the answer to "stop copying and
pasting" — behavioral standards live here and apply everywhere, and only
files that must physically exist in a repo (LICENSE, CONTRIBUTING, issue
templates) get scaffolded.

## Install

Local development:

```bash
claude --plugin-dir ~/Desktop/civic/civic-standards
```

Once it works, publish it as its own public repo under `ngabantudev` and add
it as a marketplace so every civic repo installs it the same way.

## Adding a new civic repo

```
/civic-standards:new-civic-repo <repo-name>
```

## Editing standards

Change them here, never in an individual repo's `CLAUDE.md`. The policy block
in each repo is deliberately thin and points back at these skills, so seven
repos cannot drift into seven versions of the same rule.
