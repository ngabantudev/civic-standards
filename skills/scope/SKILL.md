---
name: scope
description: The systems-not-individuals scope boundary for civic repos. Use when defining schemas, ingesting upstream records, designing layers, or deciding whether a field belongs in the dataset.
user-invocable: false
---

# The rule

**Transparency for systems; privacy for people.**

Every record describes an institution, a piece of infrastructure, a contract, an office, or a historical policy. Nothing describes, names, tracks, or locates a private individual.

This applies symmetrically. Not detainees, not residents, not officers, not agents, not officials in their personal capacity. The asymmetry people expect — that surveilling the surveillers is fair play — is not the posture here. The project's authority comes from holding one line consistently.

# Public is necessary, not sufficient

Almost everything that harms people is technically public. Home addresses sit
in county property records. Voter files carry residences. Court filings name
parties. Compiling public records into a profile is what doxxing is — the harm
comes from aggregation, not from any single record being secret.

Two tests, and both must pass:

1. **Role or person?** Is this record about a public role, or about the human
   who occupies it? A senator's office phone is about the role. That senator's
   home address — equally public — is about the person.

2. **Does assembly create something new?** If combining several public records
   produces a capability none of them had alone — locating someone, tracking
   movement, mapping a household — that capability is the thing you built, and
   it is out of scope regardless of each input's availability.

# Officials directories

Some repos exist to help people contact their government. There, a named
person is the point. The rules above still bound it.

**In scope, from official rosters only:** name, title, office held, term dates,
official contact information, official public statements, votes and other
role-conduct.

**Out of scope, though public:** home address, personal phone, personal email,
family members, employment history unrelated to office, photographs not from
official sources, property records, campaign finance beyond required public
filings.

**Out of scope everywhere:** joining an official's name to an enforcement or
surveillance record. A camera, contract, or agreement record never carries the
name of a person who operated it. Systems-mapping repos name offices, not
officeholders — this carve-out does not travel there.

The person appears only as the occupant of a public office, described only in
terms of that office, sourced only from official rosters.

Repos using this carve-out declare it explicitly:

```
git config civic.allowOfficials true
```

and name their fields `official_name`, `officeholder`, `office_title`,
`office_contact`, `office_phone`, `office_email`, `term_start`, `term_end` —
so the schema states its intent rather than relying on context.

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
