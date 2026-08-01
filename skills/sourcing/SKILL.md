---
name: sourcing
description: Primary-source discipline for civic data work. Use whenever adding, ingesting, citing, or verifying a data field, layer, statistic, statutory reference, or factual claim in a civic repo.
user-invocable: false
paths:
  - "scripts/**"
  - "src/**"
  - "**/*.md"
  - "public/data/**"
---

# Source hierarchy

Use the highest tier available. Never silently substitute a lower tier.

1. **Primary.** Statutory text, court filings, agency records, FOIA/DPA responses, contracts, official meeting minutes.
2. **Official datasets.** Published by the originating agency — MN Geospatial Commons, county GIS portals, state department portals, federal agency releases.
3. **Republication of tier 2.** Aggregators and mirrors, used only when the originating source is unreachable. Cite both the mirror and the original, and note in `knownGaps` that the original was unavailable.
4. **Journalism.** Citable for events, dates, and attributed statements. Never the source of a structured data field.
5. **Advocacy orgs, blogs, forums, social posts.** Never a data source. May be cited as *claims about* a subject, always labeled as such.

If a claim rests on tier 4 or 5, it is not a data field. Either find tier 1–3 or leave the field null.

# Never fabricate

If an upstream field, primary source, or link does not exist:

- Leave the field `null`. Do not infer, interpolate, or estimate.
- Set the documentation/link field to the explicit string `"No source found"`.
- Record the gap in `knownGaps` with what was sought, where it was looked for, and the date.

A visible gap is more valuable than a plausible guess. Downstream users can act on a known gap; they cannot detect a confident fabrication.

# Provenance record

Every ingest path records, at minimum:

- Primary source URL (the tier-1 or tier-2 original)
- License type of the upstream data
- Required attribution text
- Fetch timestamp

Upstream data licenses are separate from the repo's code license and travel with the data. Check every new source against `LICENSE-DATA.md` and add an entry if absent. CC-BY and similar attribution obligations must be surfaced in the UI, not just the repo.

# Reproducibility

A stranger with a clone and no credentials must be able to rebuild all derived data from upstream with a single documented command. This is the property that makes a transparency claim checkable rather than asserted.

- No API keys required for the data rebuild path.
- No manual steps between clone and rebuilt dataset.
- Vendored snapshots are permitted only with the fetch date recorded and the live source still documented.

# Corrections

Assume records will be wrong and someone will report it. Every repo needs a stated path for disputing a record, and a disputed record is annotated in place rather than silently deleted — deletion destroys the audit trail that makes the correction verifiable.

# Contested and adversarial conditions

This work maps surveillance and enforcement infrastructure. Expect disputes and removal demands.

- Distinguish *this record is factually wrong* from *this record is accurate and someone objects to its publication*. The first is a correction; the second is not.
- Keep the provenance chain intact for every record, so any individual claim can be traced to its source on demand.
- Never weaken a citation to make a claim sound stronger. The citation is the defense.
