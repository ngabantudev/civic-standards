---
name: openness
description: Open-source and community posture for civic repos — licensing, contributor experience, dependency policy, and accessibility. Use when adding dependencies, writing docs, setting up a repo, or making anything contributor-facing.
user-invocable: false
---

# Licensing

- Code license is declared in `LICENSE` at the repo root and named in the README. It is uniform across all civic repos.
- Upstream **data** licenses are tracked separately in `LICENSE-DATA.md`, one entry per source: source name, URL, license, required attribution text, date checked.
- Attribution obligations from upstream data appear in the UI where the data appears, not only in the repo.
- Never add a dependency or dataset whose license is incompatible with the repo's license or unstated. Unstated is a blocker, not a shrug.

# Contributor experience

A repo that is public but unenterable is published, not open-source. Every civic repo carries:

- `README.md` — what it is, what it maps, how to run it, how the data is built, where the data comes from.
- `CONTRIBUTING.md` — setup, the scope boundary, how to propose a new data layer, how to report a bad record.
- `CODE_OF_CONDUCT.md`
- `LICENSE`, `LICENSE-DATA.md`
- Issue templates for the two things outsiders actually send: **a data correction** and **a new source suggestion**.

Setup must be one clone and one documented command. Every additional required step loses contributors.

# Dependency policy

- Prefer zero external runtime assets: no third-party analytics, remote fonts, embeds, or cloud geocoding.
- Spatial operations run locally on-device against static indexes.
- This is a privacy commitment to visitors, not a performance preference — people researching surveillance infrastructure should not be surveilled while doing it.
- Build-time dependencies are acceptable; runtime third-party calls are not.

# Accessibility

- Any map has a DOM record list beside it that stays synchronized with drawn features. That list is the primary screen-reader interface, not a fallback.
- Respect `prefers-reduced-motion`. Label all controls.
- Data is downloadable in a plain format. A map nobody can query in bulk is a demo, not a transparency tool.

# Public writing

READMEs and docs are read by journalists, organizers, and people the subject matter affects. Describe what the data shows and where it came from. Let the sourcing carry the argument.
