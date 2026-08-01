---
name: scope
description: The systems-not-individuals scope boundary for civic repos. Use when defining schemas, ingesting upstream records, designing layers, or deciding whether a field belongs in the dataset.
user-invocable: false
---

# The rule

**Transparency for systems; privacy for people.**

Every record describes an institution, a piece of infrastructure, a contract, an office, or a historical policy. Nothing describes, names, tracks, or locates a private individual.

This applies symmetrically. Not detainees, not residents, not officers, not agents, not officials in their personal capacity. The asymmetry people expect — that surveilling the surveillers is fair play — is not the posture here. The project's authority comes from holding one line consistently.

# Applying it to upstream data

Upstream sources routinely mix individual records into systemic data. When they do:

- Ingest the systemic attributes. Drop the rest at the ingest boundary, not in the UI layer.
- Do not retain individual fields "for later" in an unpublished column, a cache, or a commit. If it is in the repo, it is published.
- When in doubt, leave it out.

# What is in scope

- Facilities, buildings, infrastructure, camera and sensor locations
- Agencies and agreements between them
- Contracts, procurement records, budgets
- Public offices as offices — the role, never the person holding it. Cite the statutory basis in place.
- Historical policy: redlining, zoning, ordinances
- **Aggregates.** Facility-level counts and court-level rates are systemic and may appear as clearly labeled aggregate layers.

# What is out of scope

Personal names, case or docket numbers tied to individuals, A-numbers, badge numbers, dates of birth, home addresses, individual photographs, vehicle plates tied to a person, and any identifier that resolves to one human being.

Aggregates small enough to re-identify an individual are individual data wearing a costume. If a cell count is low enough that one person is identifiable, suppress it.

# If asked to cross the line

If a request would add individual-level data, say so plainly and stop. Do not implement a partial version, a feature-flagged version, or a version that stores the data without displaying it. The boundary is the project's credibility; a quiet exception is worth less than the feature could ever be.
