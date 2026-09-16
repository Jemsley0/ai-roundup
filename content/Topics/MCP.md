---
type: topic
tags: [topic, mcp]
updated: 2026-09-16
living: true
---

# MCP (Model Context Protocol)

The protocol's move from a tool-calling spec to infrastructure: stateless core, the registry and skills-catalog layer, agent identity replacing static tokens, and the emergence of MCP as the transport by which *meaning* reaches an agent rather than just tools.

## Where this stands

The current spec revision is 2026-07-28, and the structural change already shipped: protocol-level sessions removed entirely for horizontal scalability, stateless servers supported, and Multi Round-Trip Requests replacing server-initiated requests so elicitation-style flows work without server state. Tasks moved out of core into an official extension. Enterprise-Managed Authorization is a stable extension.

The forward item to plan around is **agent identity via Workload Identity Federation and DPoP**, explicitly framed as replacing "pasted API keys and long-lived tokens." Anyone currently wiring agents together with static tokens is building against the thing MCP is about to obsolete. Beyond that: agent-to-agent negotiation and delegation without a central orchestrator.

Two adoption facts sit in tension. There are more than 10,000 active public MCP servers and the protocol has been donated to the Linux Foundation's Agentic AI Foundation, and yet an empirical study of 2,853 repositories found nobody in the sample using Claude Code's persistent subagent memory at all, and an Ask HN thread on production MCP use read as an open question rather than a settled one.

The newest shape is governance. Snowflake's Cortex AI Gateway manages 100-plus MCP servers with policy and audit enforced at the tool-call level, which is a materially different control than model-access-level enforcement.

## Open questions

- Production adoption is still not well evidenced. Server count is not usage.
- MCP does not specify how much tool metadata and output must be exposed to the model, so implementations serialise full schemas and outputs into the context window, where they compete with everything else. There is no standard answer to this and it is a direct token-cost problem.
- Tool-call-level policy enforcement is arriving from vendors before the spec has anything to say about it.

## 2026-09-16

**Snowflake's Cortex AI Gateway governs 100-plus MCP servers with policy and audit at the tool-call level.** The gateway covers bring-your-own and VPC-connected servers with automatic discovery and monitoring, and the enforcement came from Snowflake's integration of Natoma, a centralised MCP gateway. Tool-call-level enforcement is the piece worth noting: it is a different and stronger control than governing which models a role can reach, and it applies to third-party agents including Claude Code, Cursor, ChatGPT, Bedrock, Azure AI Foundry, and custom LangChain or LlamaIndex apps. ([Snowflake](https://www.snowflake.com/en/blog/enterprise-ai-security-agentic-mcp-governance/))

**Datamimic is a good model for how to scope an MCP server.** Its adapter is optional and deliberately thin, exposing **four** operations (`reference`, `scaffold`, `check`, `dry-run`) and explicitly keeping domain generation inside Python and the CLI rather than duplicating generation logic across the MCP path. The agent scaffolds a descriptor, checks it, dry-runs it, and the deterministic engine does the actual work through the normal code path, so the output an agent produces is the same output CI produces. The transferable rule: expose the operations an agent needs to *orient and validate*, not a second implementation of what your library already does. ([GitHub](https://github.com/rapiddweller/datamimic))

Source note: [[2026-09-16]]

## 2026-09-14

**Backfill: the MCP roadmap published Aug 22 is the most consequential thing in this category that this log never covered, and its next phase is agent identity.** Current spec revision is 2026-07-28. What already shipped: protocol-level sessions removed entirely for horizontal scalability, stateless servers supported, and **Multi Round-Trip Requests** replacing server-initiated requests so elicitation-style flows work without server state. **Tasks moved out of core into an official extension** (SEP-2663) on early-adopter feedback, with an intent to fold it back into core later; Enterprise-Managed Authorization is now a stable extension.

The forward-looking item is the one to plan around: MCP is standardising **agent identity via Workload Identity Federation and DPoP**, explicitly framed as replacing "pasted API keys and long-lived tokens," so that an agent acting independently, or delegating authority to a sub-agent, carries a verifiable identity. Beyond that, agent-to-agent negotiation and delegation without a central orchestrator. Anyone currently wiring agents together with static tokens is building against the thing MCP is about to obsolete. ([MCP blog](https://blog.modelcontextprotocol.io/posts/mcp-roadmap/), [Security Boulevard analysis](https://securityboulevard.com/2026/09/tools-were-only-phase-one-mcps-move-toward-agent-interoperability/))

**The missing-controls list from the agentic-SDLC side reads directly against this.** SSO unconfigured, audit logs not wired to SIEM, PR gates unenforced, no sandbox isolation for agent execution. The standard is arriving at roughly the moment orgs discover they need it.

Source note: [[2026-09-14]]

## 2026-09-11

**MCP is becoming the transport by which *meaning* reaches an agent, not just tools and data.** The architectural claim consolidating across the semantic-layer space is that a "context layer" wraps the semantic layer and exposes governed metric meaning to agents over MCP. That is the shape Atlan is selling with its Context Agents Accelerator, and the same shape Google shipped at Cloud Next '26 with Looker BI Agents grounded in a governed semantic layer, a native MCP server for agent access, and agentic workflows that monitor metrics autonomously. What the semantic layer has always done for BI dashboards, enforcing one definition of a metric at query time, is being re-pointed at agents, with access controls travelling with the answer rather than stopping at the warehouse boundary.

Source note: [[2026-09-11]]

## 2026-09-10

**The MCP registry launched in September 2025 has grown to nearly 2,000 server entries**, with a curated and security-audited verified directory planned for Q4 2026, and the June 2026 Enterprise-Managed Authorization extension makes enterprise identity providers the authoritative provisioner for MCP server access with single sign-on. Together with OpenAI's and Vercel Labs' skills catalogs shipping the same day, the registry-plus-identity layer is converging fast enough to be worth a deliberate position rather than a default. ([MCP enterprise roadmap](https://toloka.ai/blog/the-future-of-mcp-enterprise-adoption/))

Source note: [[2026-09-10]]

## 2026-09-09

**The AI-asset-registry layer is consolidating, and MCP is the substrate.** The open-source MCP Gateway & Registry has outgrown MCP and now registers agents, skills, and custom entities behind one authenticated gateway that enforces access and logs every call, and Portkey has shipped a "Skills Registry" pitched explicitly at platform teams owning Claude Code, Cursor, and Codex across an org. The pattern converging across all of these: **register once, discover by natural-language search, reach through a single gate that records everything.** That is the same shape as a service catalog, one abstraction level up. ([MCP Gateway & Registry](https://github.com/agentic-community/mcp-gateway-registry), [Portkey](https://portkey.ai/blog/skills-registry/))

**Uber's Config Knowledge Graph is exposed to both humans and LLMs via MCP** so either can traverse the same graph the same way, which is a useful concrete pattern for graph-plus-MCP.

Source note: [[2026-09-09]]

## 2026-09-04

**An Ask HN thread, "Who is using MCP in production?", pulled 147 points**, a useful read on the gap between MCP's spec momentum and actual production adoption. Production MCP adoption is the load-bearing assumption under most of the agentic-SDLC governance thesis, and the thread suggested it was still an open question in practice rather than a settled one. ([HN](https://news.ycombinator.com/item?id=49548600))

**The day's Show HN crop leaned MCP-heavy**: a Google Search Console MCP server for SEO analysis via Claude Code and ChatGPT, an MCP Tool Definition Quality Score (TDQS) spec attempting to standardize how MCP tools describe themselves, and a Google Ads MCP integration (adChestra). None individually significant, but three MCP-wrapper launches in one day is real data on where the ecosystem's attention is.

Source note: [[2026-09-04]]

## 2026-09-03

**MCP went stateless, and there is now real data on what config actually gets used.** The MCP 2026-07-28 spec removes protocol-level sessions in favor of a stateless core, adds server-rendered UIs (MCP Apps) and long-running work (Tasks), and hardens authorization toward standard OAuth and OIDC, with a separate Enterprise-Managed Authorization extension for zero-touch, IdP-provisioned server access.

**The empirical study is the more interesting half.** Galster et al. examined **2,853 GitHub repositories** for how teams actually configure agentic coding tools, and found Context Files dominate, **AGENTS.md is emerging as the cross-tool interoperability standard**, Skills rarely bundle executable scripts, and **nobody in the sample uses Claude Code's persistent Subagent memory at all**. That is the empirical backdrop to Tobi Lütke's public dispute with Anthropic the same week over Claude Code's refusal to read AGENTS.md: the standard he is pushing for is already the one the wider ecosystem is converging on, not a one-off complaint. ([MCP blog](https://blog.modelcontextprotocol.io/posts/2026-07-28-release-candidate/), [arXiv 2602.14690](https://arxiv.org/abs/2602.14690))

Source note: [[2026-09-03]]

## On the radar

- `🟡 ASSESS` **MCP agent identity (Workload Identity Federation + DPoP)**. [[2026-09-14]]
- `🟡 ASSESS` **Datamimic deterministic synthetic test data over MCP**. [[2026-09-16]]
- `🟡 ASSESS` **Context layer over semantic layer, exposed to agents via MCP**. [[2026-09-11]]
- `🟡 ASSESS` **Cymphony + agent/skill registry consolidation**. [[2026-09-09]]
- `🔵 TRIAL` **Snowflake Cortex AI Gateway**, which governs 100-plus MCP servers at the tool-call level. [[2026-09-16]]

## Related

[[Topics/Agentic SDLC Governance|Agentic SDLC Governance]] · [[Topics/Semantic Layer and Knowledge Graphs|Semantic Layer and Knowledge Graphs]] · [[Topics/Agent Memory and Context Engineering|Agent Memory and Context Engineering]] · [[Topics/Data Platform and Ingestion|Data Platform and Ingestion]]
