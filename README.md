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

# project-mentor

A Claude Code skill that gives you a teaching-focused project companion named **Sophia**.

Invoke it after you finish implementing something — a feature, bugfix, refactor, or integration — and Sophia will inspect what you actually built, explain the engineering pattern at work, produce grounded documentation, and tell you what to focus on next.

\---

## What it does

Each session runs a structured 6-step workflow:

1. **Classifies the work** — Feature, Bugfix, Refactor, Integration, or Config/infra
2. **Inspects the codebase** — reads git diff and touched files directly; asks for code if no repo access rather than reconstructing assumptions
3. **Teaches the implementation** — depth matched to how you're engaging (see modes below)
4. **Writes an executive summary** — Done / Why / Result / Next, under 100 words
5. **Produces documentation** — feature doc in `docs/features/`, changelog entry in `docs/changes.md` (skipped in Learn fast mode unless you ask)
6. **Surfaces supporting context** — risks, open questions, rollout concerns, testing gaps

Sophia signs off every session with a single focused next-step recommendation.

\---

## Teaching modes

Sophia infers one of three modes from your prompt — she never asks:

| Mode             | When                                                             | What you get                                                                                                                      |
| ---------------- | ---------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| **Learn deeply** | "walk me through", "explain", "help me understand the tradeoffs" | Full teaching stack: before/after, named pattern, trade-off made, mental model, how to spot it again, failure modes, testing lens |
| **Learn fast**   | Short message, casual tone, "quick question"                     | Compressed: what it does, pattern name, one key risk, brief testing lens                                                          |
| **Capture only** | "just document this", "log this change"                          | Skips all teaching — goes straight to summary card and docs                                                                       |

\---

## Evidence discipline

Sophia will not reconstruct a likely implementation when she has no access to your code. If there is no git repo or no files were provided, she asks one clarifying question first:

> \*"Sophia doesn't have access to the codebase or git history for this session. Before continuing, can you share the relevant file(s) or paste the key code?"\*

If you explicitly say to proceed from your description only, she will — but marks every inferred detail as unverified and never presents assumptions as facts.

Confidence is shown at the top of each response: 🟢 [HIGH] · 🟡 [MEDIUM] · 🔴 [LOW].

\---

## How to invoke

Say anything like:

- `"I just added pagination to the user list endpoint — walk me through it"`
- `"I fixed a bug where tokens weren't refreshing on 401s. Explain what changed."`
- `"I refactored the DB pool from singleton to DI. Help me understand the tradeoffs."`
- `"Just document what I did — I added rate limiting to the gateway."`
- `"Sophia, help me with the auth middleware refactor I just merged."`

\---

## Tip

This skill works best alongside Claude Code's built-in **Learning output style** (`/config` → Output style → Learning).

- **Learning mode** — keeps you actively coding, drops `TODO(human):` markers into your code, teaches patterns in real time
- **Sophia (this skill)** — consolidates what you built at stopping points, explains the _why_, names the patterns, produces documentation that survives the session

Learning mode teaches you _while_ you work. Sophia captures and reinforces _what_ you learned.

\---

## Installation

Download `project-mentor.skill` from the [Releases](../../releases) page and install it in Claude Code:

```bash
claude skill install project-mentor.skill
```

Or clone this repo and install directly:

```bash
claude skill install project-mentor/
```

\---

## Files

```
project-mentor/
├── SKILL.md                        — main skill instructions
└── references/
    ├── personality.md              — Sophia's persona and evidence discipline rules
    └── doc-templates.md            — feature doc and changelog entry templates
```

## License

MIT — see [LICENSE](LICENSE).
