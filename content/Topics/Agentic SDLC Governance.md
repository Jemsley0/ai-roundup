---
type: topic
tags: [topic, agentic-sdlc, governance]
updated: 2026-09-16
living: true
---

# Agentic SDLC Governance

How large engineering orgs run many coding agents at once, and how vendors are productising the governance layer underneath that.

## Where this stands

The category went from "a pattern three companies published about" to "a named control plane with an analyst Wave behind it" in under two weeks. The consistent finding across every source is that the hard problems are specification and plumbing, not model capability: Forrester's breakdown of negative-ROI agent deployments at 12 months puts 41 percent on unclear success criteria, 33 percent on insufficient tool or data access, and 26 percent on evaluation-coverage drift. None of those three is a model problem.

Two independent results now say the same thing about verification: put the control outside the model, and vary the *evidence source* rather than the model doing the checking. A cross-model vote over shared evidence approves 62.9 percent of unsafe agent proposals; the same vote over an independent source approves 22.9 percent. Source diversity is worth 40.9 points, model diversity 11.3.

The throughput story is real and decays at every gate: agent-driven activity is up 180 percent at the commit level, 50 percent at the project level, and 30 percent at actual releases.

## Open questions

- Does the control plane consolidate into tools teams already run (Atlassian, GitHub) or into a new procurement category? Forrester's Q4 Wave will push the second answer regardless of which is true.
- Nobody has published a credible cost model for the Verification Tax. Every vendor quotes throughput gains and none quotes the gate cost.
- The gates that exist all target correctness. ImpactGate is the first to target structural decay, and there is no equivalent for the other agent-specific failure modes (fabricated fixtures, silently narrowed scope, tests written to the implementation).
- Does telling an agent the gate threshold in advance change its planning? Untested, and cheap to test.

## Timeline

- **2026-09-16.** ImpactGate publishes a change-impact formula that charges for *where* you put code, weighting by the complexity already in the container being edited. Datamimic supplies deterministic, provenance-hashed test fixtures over MCP so agents stop inventing their own test world. ([[2026-09-16]])
- **2026-09-15.** VP-CONTROL quantifies verification gates: evidence-source diversity beats model diversity 40.9 points to 11.3; a full atomic guard recorded no unsafe effects across 216 episodes while a transactional partial guard only covered what it was written for. A companion synthesis paper names the Agentic SDLC Control Plane, the Throughput Paradox, Production-Qualified Change, and the Verification Tax. Forrester launches an Agentic Development Platforms vendor landscape with a Wave planned for Q4. ([[2026-09-15]])
- **2026-09-14.** The governance layer consolidates into agent registries: Credo AI's Agent Registry (public preview) with risk assessments and named human-oversight intervention points, Kore.ai's vendor-agnostic Agent Management Platform across LangGraph, CrewAI, and AutoGen. Forrester's negative-ROI breakdown lands. ([[2026-09-14]])
- **2026-09-11.** Atlassian ships the first governance layer inside a tool most teams already run: Code Context over multi-repository codebases via the Teamwork Graph (open beta), and Agent Context Controls letting platform teams govern which Jira and Confluence spaces agents may reach (GA pending). Their study found 94 percent of engineering leaders using AI and only 6 percent with systems to scale it across the full SDLC. The "64 percent more shipped per developer" claim is vendor-sourced. ([[2026-09-11]])
- **2026-09-09.** Cymphony exits stealth (\$30M total, \$25M Series A co-led by Sequoia and SMBC's Fin Atlas Beyond Fund) selling a workforce graph that maps employees and agents in one identity graph. It reframes the category: the Uber/Port/Ramp cluster treated many-agents-at-once as a context and attribution problem, Cymphony treats it as identity and access. Meta's Muse Sentinel lands as the permitting-agent architecture, gating every connector call and network request at L4/L7. ([[2026-09-09]])
- **2026-09-03.** The category's founding items, all forwarded rather than found by search. Uber's "AI Software Factory": over 70 percent of PRs agent-originated, productivity roughly doubled year over year, on six platform pieces including a 40M-entry Context Graph and a 2,500-plus item skills registry, at 20,000-plus skill runs and assistant sessions daily. Port.io sells the productised version of the same architecture. Ramp Labs builds a semantic layer turning raw agent traces into purpose, outcome, and cost records. ([[2026-09-03]])

## On the radar

- `🔵 TRIAL` **Independent-evidence-source verification gates**. [[2026-09-15]]
- `🔵 TRIAL` **ImpactGate structural-decay merge gate**. [[2026-09-16]]
- `🟡 ASSESS` **Datamimic deterministic synthetic test data over MCP**. [[2026-09-16]]
- `🟡 ASSESS` **Agentic SDLC Control Plane**. [[2026-09-15]]
- `🟡 ASSESS` **Atlassian Agent Context Controls + DX for Agentic Development**. [[2026-09-11]]
- `🟡 ASSESS` **Uber AI Software Factory**. [[2026-09-03]]
- `🟡 ASSESS` **Port.io Context Lake**. [[2026-09-03]]
- `🟡 ASSESS` **Ramp Labs agent-ROI attribution**. [[2026-09-03]]
- `🟡 ASSESS` **Cymphony + agent/skill registry consolidation**. [[2026-09-09]]

## Related

[[Topics/MCP|MCP]] · [[Topics/Agent Memory and Context Engineering|Agent Memory and Context Engineering]] · [[Topics/Token Cost and Model Routing|Token Cost and Model Routing]] · [[Topics/AI Safety and Interpretability|AI Safety and Interpretability]]
