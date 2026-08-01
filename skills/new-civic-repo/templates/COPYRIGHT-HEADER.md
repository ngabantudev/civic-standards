# Copyright and licensing notice

Add to the README of every civic repo:

---

## License

Copyright (C) 2026 Steve Yang

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
details. You should have received a copy of the license along with this
program. If not, see <https://www.gnu.org/licenses/>.

**Data** published by this project is licensed CC BY-SA 4.0. Upstream data
retains its own licenses, recorded in `LICENSE-DATA.md`.

Alternative licensing is available. See `CONTRIBUTING.md`.

---

## Getting the license text

```bash
curl -sL https://www.gnu.org/licenses/agpl-3.0.txt -o LICENSE
```

## Why AGPL

AGPL-3.0 treats network access as distribution. Anyone running a modified
version as a hosted service must publish their source. Plain GPL does not
require this, which is the loophole that lets a company host a modified copy
as SaaS and publish nothing.

AGPL does not prevent commercial use, and no open-source license does. What it
prevents is anyone taking this private.
