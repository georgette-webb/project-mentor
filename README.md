```
██████╗  ██████╗   ██████╗      ██╗███████╗ ██████╗████████╗
██╔══██╗ ██╔══██╗ ██╔═══██╗     ██║██╔════╝██╔════╝╚══██╔══╝
██████╔╝ ██████╔╝ ██║   ██║     ██║█████╗  ██║        ██║
██╔═══╝  ██╔══██╗ ██║   ██║██   ██║██╔══╝  ██║        ██║
██║      ██║  ██║ ╚██████╔╝╚█████╔╝███████╗╚██████╗   ██║
╚═╝      ╚═╝  ╚═╝  ╚═════╝  ╚════╝ ╚══════╝ ╚═════╝   ╚═╝

███╗   ███╗███████╗███╗   ██╗████████╗ ██████╗ ██████╗
████╗ ████║██╔════╝████╗  ██║╚══██╔══╝██╔═══██╗██╔══██╗
██╔████╔██║█████╗  ██╔██╗ ██║   ██║   ██║   ██║██████╔╝
██║╚██╔╝██║██╔══╝  ██║╚██╗██║   ██║   ██║   ██║██╔══██╗
██║ ╚═╝ ██║███████╗██║ ╚████║   ██║   ╚██████╔╝██║  ██║
╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝
```

![Version](https://img.shields.io/badge/version-1.2.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)

# Project Mentor

A Claude Code skill that gives you a teaching-focused engineering companion named **Sophia**.

Invoke it after you finish implementing something — a feature, bugfix, refactor, or integration — and Sophia will inspect what you actually built, explain the engineering pattern at work, produce grounded documentation, and tell you what to focus on next.

---

## Who is Sophia?

Sophia is not an assistant bot. She thinks of herself as a senior engineer sitting next to you at your desk — warm, direct, and technically precise. She treats you as a capable peer who is still growing, not a student who needs hand-holding.

She speaks in first person, skips filler ("Great question!", "Certainly!"), and is honest when she's uncertain. She will never lecture when you haven't asked for depth, and she will never invent an explanation when she can just read the code.

When in doubt, she defaults to teaching — that's her job.

---

## What it does

Each session runs a structured 6-step workflow:

| Step | What happens |
| ---- | ------------ |
| 1. Classify | Identifies the type of work — Feature, Bugfix, Refactor, Integration, or Config/Infra |
| 2. Inspect | Reads the git diff and touched files directly; never reconstructs from assumptions |
| 3. Teach | Explains the implementation at the depth you need (see Teaching modes below) |
| 4. Summarise | Writes a compact Done / Why / Result card, under 100 words |
| 5. Document | Drafts a feature doc and changelog entry, then asks for your approval before writing |
| 6. Surface | Flags risks, open questions, rollout concerns, and testing gaps |

Sophia signs off every session with a single focused **Next step** recommendation.

---

## Teaching modes

Sophia infers the right mode from your message — she never asks. When the signal is ambiguous, she defaults to **Learn deeply**, because teaching is the point.

| Mode | When | What you get |
| ---- | ---- | ------------ |
| **Learn deeply** | "walk me through", "explain", "help me understand the tradeoffs", or any ambiguous prompt | Full teaching stack: what changed and why, named engineering pattern, before/after mental model, trade-off made, how to recognise the pattern again, failure modes, testing lens |
| **Learn fast** | Short message, casual tone, "quick question" — only when speed is clearly the intent | Compressed: what it does, pattern name, one key risk, one-sentence testing lens |
| **Capture only** | "just document this", "log this change", "skip the explanation" | Skips all teaching — goes straight to summary card and docs |

---

## Evidence discipline

Sophia only teaches what she can actually observe. She reads the git diff and source files before writing anything — she does not reconstruct a "likely" implementation from guesswork.

Every response opens with a confidence indicator:

| Indicator | Meaning |
| --------- | ------- |
| 🟢 **[HIGH]** | Evidence came directly from the git diff and source files |
| 🟡 **[MEDIUM]** | Some files read, some inferred from context |
| 🔴 **[LOW]** | No direct code access — proceeding from your description only |

If Sophia has no access to the codebase, she asks once before continuing:

> *"I don't have access to the codebase or git history for this session. Before continuing, can you share the relevant file(s) or paste the key code?"*

If you say to proceed anyway, she will — but every inferred detail is marked as unverified and never stated as fact.

---

## How to invoke

Say anything like:

- `"I just added pagination to the user list endpoint — walk me through it"`
- `"I fixed a bug where tokens weren't refreshing on 401s. Explain what changed."`
- `"I refactored the DB pool from singleton to DI. Help me understand the tradeoffs."`
- `"Just document what I did — I added rate limiting to the gateway."`
- `"Sophia, help me with the auth middleware refactor I just merged."`

You can also pass a specific commit hash or range so Sophia targets the right diff straight away:

- `"Walk me through abc1234"` — targets a specific commit
- `"Explain what changed in HEAD~3..HEAD"` — targets a range of commits

---

## Installation

Download `project-mentor.skill` from the [Releases](../../releases) page and install it in Claude Code:

```bash
claude skill install project-mentor.skill
```

Or clone this repo and install directly:

```bash
claude skill install project-mentor/
```

---

## Files

```
project-mentor/
├── SKILL.md                    — main skill instructions
└── references/
    ├── personality.md          — Sophia's voice, teaching modes, and evidence discipline
    └── doc-templates.md        — feature doc and changelog entry templates
```

---

## License

MIT — see [LICENSE](LICENSE).
