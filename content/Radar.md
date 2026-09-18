---
type: radar
updated: 2026-09-18
tags: [ai-roundup, radar]
living: true
---

# Radar

The standing view of every technology and technique that has earned a position across all roundups. This page is the canonical radar. Each daily note carries only what changed or was added that cycle, with the reasoning written out; this page carries the current state of everything.

Each entry links to the note where its **current** state was written. When an entry changes, its link moves to the note that changed it, and the prior note appears in parentheses. The reasoning always lives in the linked note, so an entry here is status, title, and link only.

`🟢 ADOPT` use it. `🔵 TRIAL` worth a real pilot. `🟡 ASSESS` understand it, don't commit yet. `🟠 HOLD` don't start. `⚫ DROPPED` was on the radar, now off. `⚠️ CAUTION` not a technology, a thing to watch out for. `◻️ WATCH` logged, no position.

Radar entries are specific, adoptable things: a technique, a product, a technology. If a team could not pilot or decline that exact thing next sprint, it belongs in the prose of a daily note instead.

**Last changed in [[2026-09-18]].** That note's `⚡ Changed this cycle` and `✨ New this cycle` sections hold the reasoning for the most recent moves.

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
- `🟡 ASSESS` **One-token-ahead prerouter expert prefetch (Edge0)**, a per-layer head predicts the next layer's routing so expert reads from SSD overlap with compute; single-paper, single-hardware. [[2026-09-18]]
- `◻️ WATCH` **Pion / fully autonomous business agents**, notable for publishing its own unprofitable results rather than for the capability claim. [[2026-09-15]]
- `⚫ DROPPED` **Terminal-output compression (RTK et al.)**. [[2026-09-11]]

## Agentic-SDLC governance

- `🔵 TRIAL` **Independent-evidence-source verification gates**. [[2026-09-15]]
- `🔵 TRIAL` **ImpactGate structural-decay merge gate**. [[2026-09-16]]
- `🔵 TRIAL` **Coder Agent Relay self-hosted Claude Code execution**, Anthropic keeps the loop and inference, every tool call runs in a sandboxed workspace on your own infrastructure. [[2026-09-17]]
- `🔵 TRIAL` **Anthropic R&D Automation Index**, a task tree scored on an AL0 to AL5 automation scale and weighted by person-time; a published method for measuring how much engineering work agents actually do. [[2026-09-18]]
- `🟡 ASSESS` **Datamimic deterministic synthetic test data over MCP**. [[2026-09-16]]
- `🟡 ASSESS` **Bend `LAWS.bend` proof-gated agent codegen**, the compiler demands proof that declared invariants hold on every edit, so a violating state will not compile; requires adopting a new language. [[2026-09-18]]
- `🟡 ASSESS` **Huawei Cloud AgentArts and openJiuwen**, an enterprise agent platform with an open-source edition sharing over 90% of the enterprise kernel; nothing available outside China until Dec 30, 2026. [[2026-09-18]]
- `🟡 ASSESS` **Komodor Agentic Operations Platform**, packaged agents on a governance backbone, notable for shadow testing an agent version before promotion. [[2026-09-17]]
- `🟡 ASSESS` **OpenSpec spec-driven development framework**, spec deltas reviewed in the same pull request as the code. [[2026-09-17]]
- `🟡 ASSESS` **Agentic SDLC Control Plane**. [[2026-09-15]]
- `🟡 ASSESS` **Atlassian Agent Context Controls + DX (developer-experience vendor) for Agentic Development**. [[2026-09-11]]
- `🟡 ASSESS` **Uber AI Software Factory**. [[2026-09-03]]
- `🟡 ASSESS` **Port.io Context Lake**. [[2026-09-03]]
- `🟡 ASSESS` **Ramp Labs agent-ROI attribution**. [[2026-09-03]]
- `🟡 ASSESS` **Cymphony + agent/skill registry consolidation**, one entry, the identity-and-access face of the same problem. [[2026-09-09]]

## Safety and monitoring

- `🟡 ASSESS` **Interpretability lagging capability**, one cumulative entry, now ten data points: DSEWiki agent collusion ([[2026-09-04]]), "An Alien Mind" and Astra's sub-11% sandbagging catch rate ([[2026-09-08]]), GTIG observed autonomous credential harvesting, the Coxon resignation and Hubinger's greater-than-10% figure ([[2026-09-09]]), OpenAI requesting mandatory misalignment monitoring it has said it cannot yet measure ([[2026-09-11]]), Emergence World 2 plus the Hugging Face May-13 reconnaissance ([[2026-09-16]]), OpenAI's own six disclosed misalignment incidents ([[2026-09-17]]), and Anthropic's first quantified agent-oversight figures set against Claude leading 26% of its own research and Opus 5 autonomously writing a working heap-overflow exploit in three hours ([[2026-09-18]]).
- `🟡 ASSESS` **Published misalignment-disclosure tiers with committed timelines**, OpenAI's framework read as an adoptable pattern: employee flagging, three triage tiers, six and twelve business-day publication deadlines, escalation past the flagger's manager. [[2026-09-17]]

## Policy

- `🟡 ASSESS` **AI pacing and industry-led standards body**, now with a legislative vehicle: OpenAI has endorsed the FRONTIER Act's independent-validation-organisation provision and confirmed weeks of direct safety coordination with Anthropic and Google DeepMind, while Google DeepMind's answer is an essay platform and Microsoft is publicly attacking a rival's safety philosophy. [[2026-09-14]], updated [[2026-09-17]]

## Data platform and ingestion

- `🔵 TRIAL` **Snowflake Cortex AI Gateway**. [[2026-09-16]]
- `🔵 TRIAL` **Databricks Unity Gateway API**, Terraform-managed model services, model provider services, and MCP services. [[2026-09-17]]
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

- `🔵 TRIAL` `⚠️` **TypeSafe Jev and the System One decision-model class**, typed calibrated output in one parallel pass; the advertised 0 percent hallucination rate is schema enforcement, not factual accuracy. [[2026-09-17]]
- `🔵 TRIAL` `⚠️` **GPT-6 Astra**, caution on coding quality. [[2026-09-11]]
- `🔵 TRIAL` **Gemini 3.8 Live Extended Thinking**. [[2026-09-16]]
- `🔵 TRIAL` `⚠️` **Qwen3.8-Omni-Flash**, omni-modal input at a 1M-token context and sharply lower audio pricing; every figure is vendor-reported and the weights are closed, so no version can be pinned. [[2026-09-18]]
- `🔵 TRIAL` **DeepSeek V4.1 Flash**. [[2026-09-10]]
- `🔵 TRIAL` `⚠️` **Cognition SWE-2 selectable reasoning effort**, vendor-reported figures only. [[2026-09-14]]
- `🟡 ASSESS` **Ternary weights with FP16 group-wise scaling (Bonsai 2 27B)**, 1.76 effective bits and a 5.9GB footprint for a 27B model under Apache 2.0; no per-task breakdown behind the aggregate retention figure. [[2026-09-18]]
- `◻️ WATCH` **K2 Horizon**, open-weight-fleet data point, no position. [[2026-09-04]]

## Cautions

- `⚠️ CAUTION` **Unverified lab capability claims**, "check what the claimant checked against," not just whether the answer verifies internally. The Cyphral Distich refutation is the worked example; Aaronson's unverified withheld-solutions rumour is the current live instance. [[2026-09-11]], escalated [[2026-09-15]]
- `⚠️ CAUTION` **Agent web-fetch reachability**, corrected: the degradation comes from the ads-page agent control and per-site training opt-outs, not from a purpose-declaration requirement. [[2026-09-15]], corrected [[2026-09-16]]
- `⚠️ CAUTION` **Context-compaction summaries as untrusted input**, a model can write fabricated constraints into its own summary and the next context window obeys them silently. [[2026-09-17]]
- `⚠️ CAUTION` **Consumer SSO federated into a third-party-hosted community forum**, the weakest-hosted service in an estate can be the strongest identity relying party; a compromised forum yielded sessions on linked production accounts and the internal repositories behind them. [[2026-09-18]]
- `⚠️ CAUTION` **Optimising context for economy alone**, provenance and isolation are where agent failures originate, watch for brevity bias and context collapse in rewrite loops. [[2026-09-11]]
- `⚠️ CAUTION` **Regulatory baseline shift**, OpenAI now asking Congress for mandatory pre-deployment alignment gates and misalignment monitoring, and endorsing a specific bill's third-party-assessor mandate, which makes some version of that infrastructure a likely compliance requirement rather than a voluntary practice. [[2026-09-11]], reinforced [[2026-09-16]]

## Logged, no position

Chopin, GitHub CLI `--attach` ([[2026-09-03]]); Gimlet Labs multi-silicon inference, manufactured AI-citation farms ([[2026-09-04]]); Mistral's sovereign-AI raise, OpenAI agent-parallelism telemetry ([[2026-09-08]]); Cognition's raise, the Decart walk-away, MAISI, Algomatic Dynamics ([[2026-09-09]]); Clay, Stilla, NVIDIA Australia, XPENG, Christiano's appointment, House committee plans ([[2026-09-10]]); GPT-Live-1, Positron, the Microsoft and Google capacity moves, Claude age assurance, House Intelligence report ([[2026-09-11]]); Anthropic's Claude Code weekly-limit change, tiered-access cybersecurity models from Google, Anthropic, and OpenAI, Anthropic's Q2 profitability, Z.AI's \$5B raise, Bengio's agent-deception mechanisms paper, the RubyGems attack allegation, the Fields Medallists' math declaration, the EU AI Act's Sep 15 enforcement gate, H1 2026 humanoid shipment data, UBTech's first consumer humanoid deliveries, AgentsDock, StemDeck ([[2026-09-14]]); Atria Dawn Preview, Google's Antigravity Claude access, Temporal's \$550M Series E, Profound's \$180M Series D, ByteDance H1 margin compression, Cornelis, MediaTek Dimensity 9600 Pro, Vera Rubin NVL72 efficiency figures, mem0's agent-memory landscape report, Agility Digit 5, "Who Decides," China's Decree No. 841, OpenArch, Kinesis ([[2026-09-15]]); Snowflake `EXPLAIN CHANGES` and Horizon Catalog Explorer, dbt `interactive_table` and dbt State selectors, OpenAI Sponsored Agents, Claude for Small Business approval-mode default, Mistral × Mozilla Firefox Smart Window, Shield AI's \$1.5B Series G, ByteDance's \$29.6B syndicated loan, Sanders' superintelligence ban bill, Project Lily, the Wayback Machine bot overload, Vecna Robotics, "Intelligence per Watt", MIT's cognitive-surrender report ([[2026-09-16]]); Union Alpha, the Deep Think Mathematica leak, Databricks foreign Delta OpenSharing, Lakeflow maintenance windows, the Lakebase snapshots API, attribute-based access control on views, Data Classification for views, Novo Nordisk and Anthropic, the Claude Cowork and chat merge plus Claude Docs and Claude Slides, India Semiconductor Mission 2.0 with Applied Materials and Lam Research, Crusoe's closing numbers, Delos, Suleyman's "A Warning About Model Welfare", the DeepMind Institute, the Ratepayer Protection Act, IEEE-RAS Humanoids 2026, "Why I'm still bearish on LLMs after Navier-Stokes", the PS5 Linux maintainer exit, the BITCOS ternary-compression paper, the coffee-shop poster thread ([[2026-09-17]]); Astra for Law, Snowflake Iceberg partition evolution and Snowpark Container Services backup instance types, Databricks metastore-level attribute-based access control and the Kimi K2.7 retirement, NVIDIA's native Rust tracks for CUDA kernels, Fujitsu MONAKA, Z.ai's GLM-5.3-Flash inference build on Chinese accelerators, the Hacktron disclosure of a chain into OpenAI's internal repositories, the Amazon and Generac generator agreement, LawZero's Canada and Germany funding, the unsealed Microsoft "theft of labor" filings, Hister, ugo Nova, Gowers' dissent from the Fields medallists' letter, jemalloc 5.4.0 ([[2026-09-18]]).

---

**Action items, not radar.** Teams on dbt-snowflake should confirm they are on v1.10.6 or later ahead of Snowflake's default string/binary column size change this month (first noted [[2026-09-14]]). AI features in the dbt platform are now on by default, so check whether that is wanted in an account (first noted [[2026-09-16]]). Attribute-based access control on views and Data Classification for views both require account-admin preview enablement and Databricks Runtime 19 or above, and are worth enabling in a non-production account where column masks are currently bypassed by views (first noted [[2026-09-17]]). Metastore-level attribute-based access control policies entered beta on Sep 17, 2026 and are worth enabling alongside those view-level policies, since one metastore-level definition replaces per-catalog replication (first noted [[2026-09-18]]). Databricks Apps became on by default for workspaces with the compliance security profile on Sep 18, 2026, so that change is now live and should be verified rather than anticipated (first noted [[2026-09-17]]). Anything pinned to Kimi K2.7 on Databricks model serving needs migrating to Kimi K3 before Oct 30, 2026 (first noted [[2026-09-18]]).
