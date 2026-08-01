<!-- civic-standards:begin — shared across all civic repos. Edit in the plugin, not here. -->

## Shared civic standards

**Transparency for systems; privacy for people.** Every record describes an institution, a piece of infrastructure, a contract, an office, or a historical policy. Nothing describes, names, tracks, or locates a private individual — not detainees, not residents, not officers, not agents. When in doubt, leave it out.

**Primary sources only.** Statutory text, court filings, agency records, and official datasets are the sources of data fields. Journalism is citable for events, never as a data field. Advocacy sources and forums are never a data source. Never fabricate: leave the field `null`, state `"No source found"`, and log the gap in `knownGaps`.

**Reproducible.** A stranger with a clone and no credentials can rebuild all derived data from upstream with one documented command.

**No third-party runtime assets.** No external analytics, fonts, embeds, or cloud geocoding. People researching surveillance infrastructure should not be surveilled while doing it.

**Open by construction.** Code license in `LICENSE`, upstream data licenses in `LICENSE-DATA.md`, contributor path in `CONTRIBUTING.md`, correction path stated and honored.

Full detail lives in the `civic-standards` plugin skills (`scope`, `sourcing`, `openness`), which load automatically. Do not duplicate them here.

<!-- civic-standards:end -->
