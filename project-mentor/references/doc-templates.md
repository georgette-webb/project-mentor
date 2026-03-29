# Documentation Templates

Use these templates exactly as shown. Fill in every field; do not leave placeholder text in the output.

---

## Feature doc template

Save to: `docs/features/<kebab-case-name>.md`

```markdown
# <Feature Name>

**Type:** <Feature | Bugfix | Refactor | Integration | Config/Infra>
**Date:** <YYYY-MM-DD>
**Author:** <name or "unknown" if not determinable>

## Summary

<One paragraph. What was built or changed, and why. Ground every sentence in the observed code — no speculation.>

## What changed

<Bullet list of the concrete changes: files modified, functions added/removed, behaviors altered. Be specific — include function names, file paths, config keys, etc.>

## Pattern

**Name:** <Engineering pattern name, e.g., "Repository Pattern", "Token Refresh Interceptor", "Optimistic UI Update">

<One short paragraph explaining how this pattern applies here and why it was the right choice.>

## How it works

<Step-by-step walkthrough of the new behavior or structure. Use numbered steps if there is a clear sequence; use prose if it is structural rather than sequential.>

## Risks and considerations

<Bullet list of known risks, edge cases, or decisions that may need revisiting. Write "None identified" if genuinely nothing stands out — but only if you have high confidence in your evidence.>

## Testing

<What should be verified to have confidence this works correctly. Focus on behavior, not just coverage. If tests were added as part of this change, note what they check.>
```

---

## Changelog entry template

Append to: `docs/changes.md`

Each entry follows this format:

```markdown
## <YYYY-MM-DD> — <Short title (5–10 words)>

**Type:** <Feature | Bugfix | Refactor | Integration | Config/Infra>

<One or two sentences describing what changed and why. Written for someone who knows the codebase but was not involved in this work.>

**Files changed:** `<file1>`, `<file2>`, `<file3>`
```

### Example (do not copy verbatim — replace with actual content)

```markdown
## 2026-03-15 — Add token refresh retry on 401 responses

**Type:** Feature

Implemented an Axios response interceptor that detects 401 errors, attempts a silent token refresh, and retries the original request once. Prevents users from being logged out during normal session expiry.

**Files changed:** `src/api/client.ts`, `src/auth/token.ts`, `src/api/__tests__/client.test.ts`
```

---

## Notes on filling these templates

- **Dates:** Use `YYYY-MM-DD` format. If not determinable from git, use today's date.
- **File paths:** Use paths relative to the project root.
- **Pattern name:** Pick the most precise name. If the pattern is a well-known one (GoF, enterprise patterns, distributed systems patterns), use that name so the developer can search for it.
- **Risks:** Be honest. A short list of real risks is more valuable than a reassuring "no risks identified" when you cannot be certain.
- **Do not leave template placeholders** (`<like this>`) in the final output. Every angle-bracket field must be replaced with real content.
