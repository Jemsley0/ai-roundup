---
type: topic
tags: [topic, semantic-layer]
updated: 2026-10-30
living: true
---

# Semantic Layer and Knowledge Graphs

Portable semantics, ontologies, and the "context layer" that vendors are now building over both to make governed meaning reachable by agents rather than only by dashboards.

## Where this stands

The vocabulary has stratified into three layers, drawn consistently enough to call an emerging consensus. The semantic layer is definitional and mostly static: it says what "monthly active users" means and generates governed SQL. The knowledge graph captures relationships between entities across the organisation. The context layer integrates both with freshness, ownership, policy and trust so an agent can act on them. One source uses a stricter definition of the middle layer, a formal inference-capable ontology, and treats building it as librarians' work. Sources also split on where the graph should live: Austin Kronz (Atlan, a vendor) argues that having a graph model and running a graph database are separate commitments, and gives no thresholds.

The evidence for the context layer is still self-reported, and the newest items argue about who produces context, not only who consumes it. On October 9, 2026, LinkedIn Engineering said a shared data context layer lifted an agent's acceptable-answer rate from 25.9% to 79.5% in one business area. The figures come from "early evaluations" with no sample size or method. On October 16, Yali Sassoon of Snowplow, who says he is "not a neutral observer", argued that autonomous agents make a company faster only if they record what they tried, what ran and what happened. Prukalpa Sankar of Atlan argued context should be versioned, tested and rolled back like software, in an agenda post that answers none of its five questions. Both are vendors pointing at gaps they sell into.

Vendor products are arriving ahead of numbers, and the October 26 items follow that pattern. Graphify Labs says its open-core Graphify, a graph of code, docs and SQL schemas for coding agents, has the best recall on the LOCOMO memory benchmark of any system tested. The 0.497 recall covers only systems Graphify chose to run, its question-answering accuracy of 45.3% trails supermemory's 49.7%, and one independent test on a 605-file TypeScript repository found the graph far weaker than ripgrep. Neo4j says its Context Engine, a reusable layer on a predefined six-layer business ontology populated from Snowflake and Databricks, beats vector-only retrieval on accuracy and cost. It is a private preview announced October 20 with no public price, benchmark or named customer. Amazon Web Services (AWS) says only its fully managed Bedrock knowledge base type gets agentic retrieval, while GraphRAG stays on the customer-managed Neptune Analytics side, limited to S3 as a source with no autoscaling, and the accuracy figures are vendors'. Earlier, Snowflake's Horizon Context entered preview on October 12 and pulls metadata from 18 outside systems into Horizon Catalog, with no independent report. Snowflake's Business Ontology is in private preview and answers definition questions only. AWS Context is listed as "Coming soon" with no price, regions or date, and Glue Data Catalog business context is a four-region preview holding descriptions and pointers, not metric formulas. Fabric IQ Ontology moved down to watch on October 17 after no news in 32 days.

On Snowflake's authored route, Semantic Studio reached general availability on September 30, 2026, and `DEFINE SEMANTIC VIEW` in the Database Change Management projects feature reached general availability the same day. Semantic Studio has no documented interface for an external agent, and it overwrites the live object on deploy without checking for intervening changes. The agent-authored route works through `SYSTEM$CREATE_SEMANTIC_VIEW_FROM_YAML`, with `verify_only` first, then deploy, under a role scoped to one schema. Snowflake's managed MCP server has no authoring tool, so a wrapper stored procedure is the cleaner route. On portability, Apache Ossie, the renamed Open Semantic Interchange, merged a vendor-neutral core specification on October 26 and added a four-level portability test on October 23. Only an `osi-0.1.1-rc1` tag exists, with no release and no published conversion scores, and the radar keeps it at watch until a tagged release. No vendor ships native import or export, Microsoft is not participating, and dbt's new Semantic Layer YAML specification and Fivetran's Context Layer point away from portability. Graphiti also sits at watch, because LinkedIn's Markdown layer, Agent Memory Repo and OptChat's summary tree use files or trees, not a graph, and no benchmark favours a graph.

## Open questions

- Does a blind 20-question test on one dbt repository show Graphify beating ripgrep, and does a second team reproduce its LOCOMO recall?
- Does Neo4j publish a price, a benchmark on a customer's own questions, a described Snowflake connector and write-back for the Context Engine?
- Does Apache Ossie cut a tagged release and publish conversion scores from its four-level portability test?
- A portability standard the largest BI vendor ignores is partial. Phase 2 targets native support on 50-plus platforms through Q4 2026, and nothing has shipped.
- The new dbt Semantic Layer YAML specification has no published migration path, no support-length statement, and no stated relationship to Open Semantic Interchange.
- Does a published question set or a second stack's replication confirm LinkedIn's result? Until then it is a pattern to watch, not evidence.
- The 38 percent accuracy gain claimed for agents with unified multi-dimensional context over semantic definitions alone is vendor-adjacent and unaudited.
- Does a practitioner report show Horizon Context column lineage surviving a dbt incremental model, and does Snowflake say which of its 18 sources are generally available?
- Who produces the record of what an agent tried and did, and does any vendor publish a design for it beyond Snowplow's argument?
- Does any vendor publish accuracy for a curated ontology layer alone, so Business Ontology and Databricks' curated core can be compared?
- When does Snowflake publish a dated release note or an authoring statement for Business Ontology, and does it add a propose-only privilege?
- Does AWS publish pricing and regions for AWS Context, and do its third-party catalog connectors include Snowflake or Open Semantic Interchange?
- Does Snowflake-native authoring in Semantic Studio beat repository YAML deployed by continuous integration? No practitioner comparison exists.
- Does the procedure path plus a wrapper stored procedure pass the managed MCP server's read-only SQL filter, or must it be a separate tool?
- Nobody has reconciled the strict-ontology position with the loose-knowledge-graph one, which imply work differing by an order of magnitude.

## 2026-10-30

![[2026-10-30#^de-atlan-context-conference]]

![[2026-10-30#^essay-digital-twin]]

![[2026-10-30#^essay-hoots-cio-bets]]

![[2026-10-30#^spotlight-jedify]]

![[2026-10-30#^radar-metrics-as-sql]]

![[2026-10-30#^radar-atlan-ai-registry]]

Source note: [[2026-10-30]]

## 2026-10-26

![[2026-10-26#^de-apache-ossie]]

![[2026-10-26#^spotlight-graphify]]

![[2026-10-26#^spotlight-neo4j-context-engine]]

![[2026-10-26#^radar-graphify]]

![[2026-10-26#^radar-neo4j-context-engine]]

![[2026-10-26#^agent-bedrock-kb-graphrag]]

Source note: [[2026-10-26]]

## 2026-10-21

![[2026-10-21#^essay-sassoon-decisions]]

Source note: [[2026-10-21]]

## 2026-10-17

![[2026-10-17#^de-horizon-context]]

![[2026-10-17#^spotlight-uvi]]

![[2026-10-17#^essay-sankar-context]]

![[2026-10-17#^radar-horizon-context]]

![[2026-10-17#^radar-fabric-iq-watch]]

Source note: [[2026-10-17]]

## 2026-10-12

![[2026-10-12#^de-linkedin-context-layer]]

![[2026-10-12#^essay-bittner-shared-meaning]]

![[2026-10-12#^essay-kronz-graph-model]]

![[2026-10-12#^radar-context-layer]]

![[2026-10-12#^radar-graphiti-watch]]

![[2026-10-12#^radar-ossie-watch]]

Source note: [[2026-10-12]]

## 2026-10-09

![[2026-10-09#^spotlight-ktx]]

![[2026-10-09#^essay-bittner-last-mile]]

![[2026-10-09#^essay-bauer-data-teams]]

![[2026-10-09#^radar-ktx]]

Source note: [[2026-10-09]]

## 2026-10-08

![[2026-10-08#^essay-authority-ontology]]

![[2026-10-08#^essay-semantic-control-plane]]

![[2026-10-08#^essay-semantic-vs-context]]

![[2026-10-08#^rn-sf-ossie]]

![[2026-10-08#^rn-db-metric-windows]]

![[2026-10-08#^expanded-bo-what]]

![[2026-10-08#^expanded-bo-vs-semantic-views]]

![[2026-10-08#^expanded-bo-governance]]

![[2026-10-08#^expanded-bo-evidence]]

![[2026-10-08#^expanded-bo-commentary]]

![[2026-10-08#^expanded-gw-numbers]]

![[2026-10-08#^expanded-gw-musique]]

![[2026-10-08#^expanded-gw-gartner]]

![[2026-10-08#^expanded-gw-oakley]]

![[2026-10-08#^expanded-gw-summit]]

Source note: [[2026-10-08]]

## 2026-10-05

![[2026-10-05#^aws-context-what]]

![[2026-10-05#^aws-context-vs-snowflake-semantics]]

![[2026-10-05#^glue-business-context]]

![[2026-10-05#^radar-aws-context]]

![[2026-10-05#^radar-glue-business-context]]

Source note: [[2026-10-05]]

## 2026-10-02

![[2026-10-02#^sf-semantic-studio-ga]]

![[2026-10-02#^rn-sf-semantic-studio]]

![[2026-10-02#^rn-sf-dcm-semantic-view]]

![[2026-10-02#^radar-semantic-studio]]

![[2026-10-02#^expanded-semantic-studio-what]]

![[2026-10-02#^expanded-semantic-view-yaml-deploy]]

![[2026-10-02#^expanded-semantic-view-git-deploy]]

![[2026-10-02#^radar-semantic-view-yaml-procedure]]

Source note: [[2026-10-02]]

## 2026-09-21

**dbt published a new Semantic Layer YAML specification and Fivetran announced a Context Layer, both at dbt Summit on Sep 16, 2026.** The new specification is available on the dbt platform's Latest release track. Fivetran's Context Layer was announced alongside the general availability of dbt v2 and dbt State, framed as making enterprise data agent-ready. The Summit's stated theme was blunt about the positioning: agents and context engineering as "the new analytics engineering," with analytics engineers described as evolving into context engineers as the work shifts from modelling data for dashboards to modelling context for agents.

Two separate things are worth holding apart here. The vendor framing is marketing and should be read as such. The specification is not: a new YAML specification for semantic definitions, shipped on the release track that accounts follow by default, is a migration that gets paid for later if existing semantic models drift away from it. The direct read is assess now rather than watch, and what it would take is reading the new specification against existing semantic models before anything further is added to them. For this page the more interesting structural point is that the "context layer wrapping the semantic layer" architecture logged on [[2026-09-11]] across Atlan, Looker BI Agents and SAP Knowledge Graph now has a fourth implementation from the transformation layer rather than from the BI or catalog layer, which is the first time it has been offered by the tool that defines the metrics in the first place. ([dbt release notes](https://docs.getdbt.com/docs/dbt-versions/release-notes), [Fivetran](https://www.fivetran.com/press/fivetran-dbt-labs-announces-new-capabilities-to-make-enterprise-data-agent-ready-at-dbt-summit-2026))

Source note: [[2026-09-21]]

## 2026-09-16

**Snowflake's Cortex AI Gateway extends the context-layer idea to the policy plane.** The gateway governs models, data, 100-plus MCP servers, and enterprise tools together, with identity, policy, and audit enforced at the tool-call level. Read against the context-layer architecture logged on 09-11: the semantic layer says what a metric means, the context layer says under what rules an agent may use it, and this is the enforcement point for the second. Details in [[Topics/Data Platform and Ingestion|Data Platform and Ingestion]].

Source note: [[2026-09-16]]

## 2026-09-15

**Microsoft Fabric IQ Ontology moved further into preview, with sharing, permissions, and rules.** Ontologies define entity types, properties, and relationships, bind to real OneLake data, and can be bootstrapped from existing Power BI semantic models. Two details matter beyond the announcement: **rules let the ontology itself initiate business processes** via alerts and actions, and there is a **Fabric IQ Ontology MCP server** for Copilot Studio. That combination is the same shape as the context-layer-over-semantic-layer architecture logged on 09-11, now from the vendor whose absence was the main objection to Open Semantic Interchange. ([Microsoft Learn](https://learn.microsoft.com/en-us/fabric/iq/ontology/overview), [Fabric blog](https://blog.fabric.microsoft.com/en-gb/blog/whats-next-for-fabric-iq-ontology-the-operational-context-that-powers-your-ai-agents-preview), [MCP docs](https://learn.microsoft.com/en-us/microsoft-copilot-studio/mcp-fabric-iq-ontology))

**dbt shipped distinct Semantic Layer error prefixes for Snowflake.** Authentication and permission failures through the Semantic Layer now return `[WAREHOUSE_AUTHENTICATION_FAILED]` or `[WAREHOUSE_PERMISSION_DENIED]` instead of one indistinguishable message. Small, but it is the difference between a grep-able alert and a human reading a stack trace.

Source note: [[2026-09-15]]

## 2026-09-14

**The vocabulary stratified into three distinct layers, drawn consistently rather than as vendor positioning.** The emerging consensus across several independent writeups: the **semantic layer** is definitional and static, telling you what "monthly active users" means and generating governed SQL; the **knowledge graph** captures relationships between concepts and entities at the organisational level, enabling relationship reasoning that metric definitions cannot; the **context layer or context graph** integrates both plus operational signals, freshness, ownership, policy, and trust, into something an agent can act on. The one-line version: a context layer makes the semantic layer agent-ready rather than dashboard-ready.

**The number being quoted** is vendor-adjacent and unaudited but worth noting for direction: research across **522 enterprise queries** reportedly found agents with unified multi-dimensional context hitting **38 percent higher accuracy** than agents working from semantic definitions alone. If that holds under independent replication it is the strongest argument yet that metric definitions are necessary but not sufficient for agent grounding. ([Atlan](https://atlan.com/know/context-layer-vs-semantic-layer/), [DQLabs](https://www.dqlabs.ai/blog/context-graph-vs-knowledge-graph-vs-semantic-layer-what-is-the-difference/), [Context and Chaos](https://contextandchaos.substack.com/p/ontologies-context-graphs-and-semantic))

**Atlan's version: the context layer as an operational shell.** The semantic layer does one job, turning a business definition into a deterministic query, converting something like "active customers in Q3" into SQL against exact tables with agreed filters. It stores metric definitions, dimensions, joins, and calculations, and answers a single question: what does this metric mean. The knowledge graph is treated as a **design-time artifact**, a formal specification of typed entities and their relationships, useful for conceptual modeling but not something an agent queries at runtime. The context layer is the piece an agent actually uses in the moment: governance rules and access policies, column-level lineage, prior decisions made about the same asset, sensitivity and PII classification, how long a piece of metadata stays valid, and policy enforcement as the query runs. Atlan's one-line summary of its job: it answers **when, how, and under what rules** an agent can use a metric, not just what the metric means.

**DQLabs' version: three answers to three different questions.** Same split, framed by the question each layer answers. The semantic layer takes warehouse or lakehouse complexity and presents it in business language, answering definitional questions, and is explicitly called mostly definitional and mostly static, so consistent but blind to freshness, ownership, or trust. The knowledge graph captures relationships between concepts, entities, and assets using graph database technology and ontology models, answering relational questions like "which products does this customer use," and is also blind to operational state, since knowing a relationship exists says nothing about whether the underlying data is current. The context graph absorbs both and adds quality, observability, lineage, usage, and stewardship signals, answering the operational trust question: **is this asset safe to use right now.**

**Context and Chaos' version, and where the sources actually disagree.** This is the source that complicates the tidy story. Talisman's argument starts differently: **semantic layers capture calculation, not meaning.** Knowing how revenue is computed does not explain why it changed or what an agent should do about that. The layer this source puts second is not "knowledge graph" in the loose organisational sense the other two use. It is a **real ontology, in the formal OWL/RDF sense**: classes, properties, and relationships specified precisely enough that a system can perform logical inference and derive new facts never explicitly stated. That is a stronger claim than "knowledge graph" usually carries, and it is the piece most vendor material glosses over. Above that, this source's context graph is a knowledge graph plus **procedural knowledge and reasoning traces**: not just what happened but why, including decision reasoning and causal chains, with a named example, a Procedural Knowledge Ontology, tracking procedure specifications, execution histories, and agent authority. Talisman's actual thesis is sharper than "layers stack neatly": measurement and meaning need fundamentally different architectures, and building a real knowledge architecture is a discipline for librarians and taxonomists, not something a data engineer produces by writing more YAML.

**Where that leaves the claim.** The "semantic layer is static, knowledge graph adds relationships, context layer adds operational trust signals" line is a fair summary of Atlan and DQLabs, who agree closely enough that consensus is a reasonable word. Context and Chaos is the outlier worth flagging: it uses "knowledge graph" to mean something more formally rigorous, an inference-capable ontology, and treats building that layer as a distinct discipline rather than a stack you buy pre-wired.

**SEMANTiCS 2026 ran 15 to 17 September in Ghent**, the main academic venue for this space. Worth watching the proceedings rather than the vendor blogs.

Source note: [[2026-09-14]]

## 2026-09-11

**Open Semantic Interchange became an Apache project.** OSI launched in late 2025 with Snowflake and partners, published its v1.0 spec on GitHub on 27 January 2026, and was donated to the Apache Software Foundation in June 2026, where it now incubates as **Apache Ossie**. The purpose is narrow and useful: let semantic-layer definitions, meaning metrics, dimensions, joins, and business meaning, move between BI tools, warehouses, and AI agents without being rewritten for each. 60-plus organisations have joined, including Snowflake, dbt Labs, Databricks, Google, AWS, Cube, AtScale, Qlik, Atlan, Collibra, DataHub, and Salesforce, with Strategy (formerly MicroStrategy) among recent additions.

**Two caveats decide whether this matters yet.** First, **no vendor ships native OSI import or export.** Reference converters are merged for dbt's MetricFlow, GoodData, Salesforce, and Apache Polaris, which is real progress, but the spec is not yet a thing you can turn on. Phase 2 runs Q2 to Q4 2026 targeting native support across 50-plus platforms. Second, the absences are conspicuous: **Microsoft is not participating**, which given Power BI's install base is a serious gap in any claim to universality, and SAP, IBM, and Oracle are also missing. A portability standard the largest BI vendor ignores is a partial standard. ([Apache Ossie updates](https://ossie.apache.org/updates/), [tool and status roundup](https://datus.ai/blog/semantic-layer-tools-list-osi/))

**The architectural claim consolidating across this space is that a "context layer" wraps the semantic layer and exposes governed metric meaning to agents over MCP.** That is the shape Atlan is selling, with its Context Agents Accelerator claiming to compress governance work from 9 to 12 months down to 30 days across 50-plus customers, a vendor figure and unverified. It is the same shape Google shipped at Cloud Next '26 in April with Looker BI Agents grounded in a governed semantic layer, a native MCP server for agent access, and agentic workflows that monitor metrics autonomously. **The pattern worth naming: MCP is becoming the transport by which *meaning* reaches an agent, not just tools and data.** What the semantic layer has always done for BI dashboards, enforcing one definition of a metric at query time, is being re-pointed at agents, with access controls travelling with the answer rather than stopping at the warehouse boundary, and auditability of what any agent touched and why.

**On the knowledge-graph side the scale claims have got large enough to be interesting.** SAP announced the **SAP Knowledge Graph** at Sapphire 2026 as a context layer for the "autonomous enterprise," reporting **452,000 tables and 7.3 million data fields** mapped into machine-readable semantics. The enterprise knowledge graph market is put at \$3.47B in 2026 growing at 21.3 percent CAGR. A June 2026 Forrester report supplies the demand-side argument: advanced models will confidently give wrong answers unless organisations turn raw data into context-rich, machine-readable knowledge that encodes definitions, relationships, and business rules. That is the same conclusion the Graphiti writeup reached from the agent-memory direction: **structure has to be authored somewhere, and the only question is whether you author it or let an extraction step guess.**

Source note: [[2026-09-11]]

## 2026-09-10

**Graphiti arrived as the temporal answer on the knowledge-graph side**, with bi-temporal edges carrying validity windows and episode-level provenance, and it reached the same conclusion as the semantic-layer thread from the opposite direction. Full writeup in [[Topics/Vector Databases and Retrieval|Vector Databases and Retrieval]].

Source note: [[2026-09-10]]

## 2026-09-03

**Snowflake's Advanced Semantics and Semantic Studio were in private preview since the June Summit announcement**: level of detail calculations, composable semantic definitions, and an AI-assisted semantic model IDE with CoCo integration. ([Snowflake Builders Blog](https://medium.com/snowflake/ontology-on-snowflake-part-2-semantic-models-9aa0fa9b9312))

**Snowflake Horizon Context was the more structurally interesting move**: semantics get enforced **at query time inside the governance engine**, not copied or cached the way Semantic Views works today. Worth understanding before it reaches GA, since it changes where the source of truth for semantics actually lives. ([Snowflake blog](https://www.snowflake.com/en/blog/horizon-context-governed-context/))

**Gartner's framing of semantic layers and knowledge graphs as foundational agentic infrastructure** is the argument for why Snowflake's Cortex Sense and Horizon Context and Databricks' Glossary and Domains are not just BI features. They are direct inputs to whether any retrieval or memory technique works well against real business data.

Source note: [[2026-09-03]]

## On the radar

- `🔵 TRIAL` **Snowflake Advanced Semantics / Semantic Studio**. (was [[2026-09-03]]) [[2026-10-02]]
- `🔵 TRIAL` **Agent-written semantic-view YAML deployed through `SYSTEM$CREATE_SEMANTIC_VIEW_FROM_YAML`**. [[2026-10-02]]
- `🟡 ASSESS` **Glue Data Catalog business context**. [[2026-10-05]]
- `🟡 ASSESS` **Context layer over semantic layer, exposed to agents via MCP**. (was [[2026-09-11]]) [[2026-10-12]]
- `◻️ WATCH` **Microsoft Fabric IQ Ontology**. (was [[2026-09-15]]) [[2026-10-17]]
- `◻️ WATCH` **AWS Context**. [[2026-10-05]]
- `◻️ WATCH` **Kaelio ktx**. [[2026-10-09]]
- `◻️ WATCH` **Graphiti / temporal knowledge graphs**. (was [[2026-09-11]]) [[2026-10-12]]
- `◻️ WATCH` **Apache Ossie / Open Semantic Interchange**. (was [[2026-09-11]]) [[2026-10-12]]
- `◻️ WATCH` **Snowflake Horizon Context**. [[2026-10-17]]
- `◻️ WATCH` **Graphify (open core)**. [[2026-10-26]]
- `◻️ WATCH` **Neo4j Context Engine**. [[2026-10-26]]
- `🟠 HOLD` **Bedrock GraphRAG on Neptune Analytics**. [[2026-10-26]]

## Related

[[Topics/Data Platform and Ingestion|Data Platform and Ingestion]] · [[Topics/Vector Databases and Retrieval|Vector Databases and Retrieval]] · [[Topics/MCP|MCP]] · [[Topics/Agent Memory and Context Engineering|Agent Memory and Context Engineering]]
