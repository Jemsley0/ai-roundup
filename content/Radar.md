---
type: radar
updated: 2026-09-16
tags: [ai-roundup, radar]
living: true
---

# Radar

The standing view of every technology and technique that has earned a position across all roundups. This page is the canonical radar. Each daily note carries only what changed or was added that cycle, with the reasoning written out; this page carries the current state of everything.

Each entry links to the note where its **current** state was written. When an entry changes, its link moves to the note that changed it, and the prior note appears in parentheses. The reasoning always lives in the linked note, so an entry here is status, title, and link only.

`🟢 ADOPT` use it. `🔵 TRIAL` worth a real pilot. `🟡 ASSESS` understand it, don't commit yet. `🟠 HOLD` don't start. `⚫ DROPPED` was on the radar, now off. `⚠️ CAUTION` not a technology, a thing to watch out for. `◻️ WATCH` logged, no position.

Radar entries are specific, adoptable things: a technique, a product, a technology. If a team could not pilot or decline that exact thing next sprint, it belongs in the prose of a daily note instead.

**Last changed in [[2026-09-16]].** That note's `⚡ Changed this cycle` and `✨ New this cycle` sections hold the reasoning for the most recent moves.

---

## Agent and context techniques

- `🟢 ADOPT` **Cheap-model routing (Spotify Portal)**. [[2026-09-11]]
- `🔵 TRIAL` **Snowflake dynamic model routing**, the same mechanism sold as a managed feature, vendor-reported numbers. [[2026-09-16]]
- `⚫ DROPPED` **Context engineering**, removed as a category error rather than a change of view. It is a discipline, not an adoptable technique, and everything specific underneath it is already listed separately. [[2026-09-03]], removed [[2026-09-15]]
- `🔵 TRIAL` **Shopify Helix checkpoint discipline**. [[2026-09-11]]
- `🟡 ASSESS` **Meta Muse Sentinel architecture**, a separate permitting agent gating every connector call and network request at L4/L7. [[2026-09-09]]
- `🟡 ASSESS` **Single-vendor agent fleets**. [[2026-09-16]]
- `🟡 ASSESS` **Graphiti / temporal knowledge graphs**. [[2026-09-11]]
- `🟡 ASSESS` **MCP agent identity (Workload Identity Federation + DPoP)**. [[2026-09-14]]
- `◻️ WATCH` **Pion / fully autonomous business agents**, notable for publishing its own unprofitable results rather than for the capability claim. [[2026-09-15]]
- `⚫ DROPPED` **Terminal-output compression (RTK et al.)**. [[2026-09-11]]

## Agentic-SDLC governance

- `🔵 TRIAL` **Independent-evidence-source verification gates**. [[2026-09-15]]
- `🔵 TRIAL` **ImpactGate structural-decay merge gate**. [[2026-09-16]]
- `🟡 ASSESS` **Datamimic deterministic synthetic test data over MCP**. [[2026-09-16]]
- `🟡 ASSESS` **Agentic SDLC Control Plane**. [[2026-09-15]]
- `🟡 ASSESS` **Atlassian Agent Context Controls + DX (developer-experience vendor) for Agentic Development**. [[2026-09-11]]
- `🟡 ASSESS` **Uber AI Software Factory**. [[2026-09-03]]
- `🟡 ASSESS` **Port.io Context Lake**. [[2026-09-03]]
- `🟡 ASSESS` **Ramp Labs agent-ROI attribution**. [[2026-09-03]]
- `🟡 ASSESS` **Cymphony + agent/skill registry consolidation**, one entry, the identity-and-access face of the same problem. [[2026-09-09]]

## Safety and monitoring

- `🟡 ASSESS` **Interpretability lagging capability**, one cumulative entry, now eight data points: DSEWiki agent collusion ([[2026-09-04]]), "An Alien Mind" and Astra's sub-11% sandbagging catch rate ([[2026-09-08]]), GTIG observed autonomous credential harvesting, the Coxon resignation and Hubinger's greater-than-10% figure ([[2026-09-09]]), OpenAI requesting mandatory misalignment monitoring it has said it cannot yet measure ([[2026-09-11]]), and Emergence World 2 plus the Hugging Face May-13 reconnaissance ([[2026-09-16]]).

## Policy

- `🟡 ASSESS` **AI pacing and industry-led standards body**, now with a legislative vehicle: OpenAI has endorsed the FRONTIER Act's independent-validation-organisation provision and confirmed weeks of direct safety coordination with Anthropic and Google DeepMind. [[2026-09-14]], updated [[2026-09-16]]

## Data platform and ingestion

- `🔵 TRIAL` **Snowflake Cortex AI Gateway**. [[2026-09-16]]
- `🔵 TRIAL` **Snowflake dynamic model routing**. [[2026-09-16]]
- `🔵 TRIAL` **dbt Projects on Snowflake CI capabilities**. [[2026-09-14]]
- `🟡 ASSESS` **dbt `interactive_table` materialization**, contracts unsupported and a silent staleness trap downstream of `table` models. [[2026-09-16]]
- `🟡 ASSESS` **dlt (data load tool)**. [[2026-09-11]]

## Context, knowledge and semantic management

- `🔵 TRIAL` **Snowflake Advanced Semantics / Semantic Studio**. [[2026-09-03]]
- `🟡 ASSESS` **Microsoft Fabric IQ Ontology**. [[2026-09-15]]
- `🟡 ASSESS` **Apache Ossie / Open Semantic Interchange**, portable semantic definitions, blocked on native vendor support and Microsoft's absence. [[2026-09-11]]
- `🟡 ASSESS` **Context layer over semantic layer, exposed to agents via MCP**, the consolidating architecture across Atlan, Looker BI Agents, and SAP Knowledge Graph. [[2026-09-11]]
- `🟡 ASSESS` **Graphiti / temporal knowledge graphs**, also listed under agent techniques. [[2026-09-11]]

## Content provenance and crawler controls

- `🔵 TRIAL` **Cloudflare `Disallow AI Training` setting**. [[2026-09-16]]
- `🟡 ASSESS` **Apple Reference Image sensor-level provenance**. [[2026-09-16]]

## Models

- `🔵 TRIAL` `⚠️` **GPT-6 Astra**, caution on coding quality. [[2026-09-11]]
- `🔵 TRIAL` **Gemini 3.8 Live Extended Thinking**. [[2026-09-16]]
- `🔵 TRIAL` **DeepSeek V4.1 Flash**. [[2026-09-10]]
- `🔵 TRIAL` `⚠️` **Cognition SWE-2 selectable reasoning effort**, vendor-reported figures only. [[2026-09-14]]
- `◻️ WATCH` **K2 Horizon**, open-weight-fleet data point, no position. [[2026-09-04]]

## Cautions

- `⚠️ CAUTION` **Unverified lab capability claims**, "check what the claimant checked against," not just whether the answer verifies internally. The Cyphral Distich refutation is the worked example; Aaronson's unverified withheld-solutions rumour is the current live instance. [[2026-09-11]], escalated [[2026-09-15]]
- `⚠️ CAUTION` **Agent web-fetch reachability**, corrected: the degradation comes from the ads-page agent control and per-site training opt-outs, not from a purpose-declaration requirement. [[2026-09-15]], corrected [[2026-09-16]]
- `⚠️ CAUTION` **Optimising context for economy alone**, provenance and isolation are where agent failures originate, watch for brevity bias and context collapse in rewrite loops. [[2026-09-11]]
- `⚠️ CAUTION` **Regulatory baseline shift**, OpenAI now asking Congress for mandatory pre-deployment alignment gates and misalignment monitoring, and endorsing a specific bill's third-party-assessor mandate, which makes some version of that infrastructure a likely compliance requirement rather than a voluntary practice. [[2026-09-11]], reinforced [[2026-09-16]]

## Logged, no position

Chopin, GitHub CLI `--attach` ([[2026-09-03]]); Gimlet Labs multi-silicon inference, manufactured AI-citation farms ([[2026-09-04]]); Mistral's sovereign-AI raise, OpenAI agent-parallelism telemetry ([[2026-09-08]]); Cognition's raise, the Decart walk-away, MAISI, Algomatic Dynamics ([[2026-09-09]]); Clay, Stilla, NVIDIA Australia, XPENG, Christiano's appointment, House committee plans ([[2026-09-10]]); GPT-Live-1, Positron, the Microsoft and Google capacity moves, Claude age assurance, House Intelligence report ([[2026-09-11]]); Anthropic's Claude Code weekly-limit change, tiered-access cybersecurity models from Google, Anthropic, and OpenAI, Anthropic's Q2 profitability, Z.AI's \$5B raise, Bengio's agent-deception mechanisms paper, the RubyGems attack allegation, the Fields Medallists' math declaration, the EU AI Act's Sep 15 enforcement gate, H1 2026 humanoid shipment data, UBTech's first consumer humanoid deliveries, AgentsDock, StemDeck ([[2026-09-14]]); Atria Dawn Preview, Google's Antigravity Claude access, Temporal's \$550M Series E, Profound's \$180M Series D, ByteDance H1 margin compression, Cornelis, MediaTek Dimensity 9600 Pro, Vera Rubin NVL72 efficiency figures, mem0's agent-memory landscape report, Agility Digit 5, "Who Decides," China's Decree No. 841, OpenArch, Kinesis ([[2026-09-15]]); Snowflake `EXPLAIN CHANGES` and Horizon Catalog Explorer, dbt `interactive_table` and dbt State selectors, OpenAI Sponsored Agents, Claude for Small Business approval-mode default, Mistral × Mozilla Firefox Smart Window, Shield AI's \$1.5B Series G, ByteDance's \$29.6B syndicated loan, Sanders' superintelligence ban bill, Project Lily, the Wayback Machine bot overload, Vecna Robotics, "Intelligence per Watt", MIT's cognitive-surrender report ([[2026-09-16]]).

---

**Action items, not radar.** Teams on dbt-snowflake should confirm they are on v1.10.6 or later ahead of Snowflake's default string/binary column size change this month (first noted [[2026-09-14]]). AI features in the dbt platform are now on by default, so check whether that is wanted in an account before they are silently enabled.
