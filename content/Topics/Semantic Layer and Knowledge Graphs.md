---
type: topic
tags: [topic, semantic-layer]
updated: 2026-09-21
living: true
---

# Semantic Layer and Knowledge Graphs

Portable semantics, ontologies, and the "context layer" that vendors are now building over both to make governed meaning reachable by agents rather than only by dashboards.

## Where this stands

The vocabulary has stratified into three layers, and the distinction is now drawn consistently enough to call it emerging consensus. The **semantic layer** is definitional and mostly static: it tells you what "monthly active users" means and generates governed SQL. The **knowledge graph** captures relationships between concepts and entities at the organisational level. The **context layer** or context graph integrates both plus operational signals, freshness, ownership, policy, and trust, into something an agent can act on. The one-line version: a context layer makes the semantic layer agent-ready rather than dashboard-ready.

One of the three main sources behind that consensus quietly uses a stricter definition of the middle layer than the other two, meaning a formal inference-capable OWL/RDF ontology rather than a loose organisational graph, and treats building it as a discipline for librarians and taxonomists rather than something a data engineer produces by writing more YAML. Anyone treating the three-layer model as settled vocabulary should know that.

On portability: Open Semantic Interchange is now an Apache incubating project (Apache Ossie) with 60-plus participants, and it is held at assess for two specific reasons that have not changed. No vendor ships native import or export, and Microsoft is not participating while shipping a competing ontology layer in Fabric IQ.

As of 2026-09-21 the context-layer-over-semantic-layer architecture has a fourth implementation, and it arrived from the transformation layer rather than from BI or the catalog. dbt shipped a new Semantic Layer YAML specification on its Latest release track and Fivetran announced a Context Layer, both at dbt Summit on Sep 16, with the conference framing analytics engineering's successor as context engineering outright. The framing is vendor positioning. The specification is a real obligation, because a new YAML specification on the default release track is a migration paid for later if existing semantic models drift from it, and it is worth reading against those models before anything more is added to them.

The structural note is that the tool defining the metrics is now also offering the context layer over them, which is a different proposition from Atlan, Looker or SAP wrapping someone else's definitions. It also does nothing for the portability problem, since a dbt-specific YAML specification is the opposite direction from Open Semantic Interchange.

## Open questions

- The new dbt Semantic Layer YAML specification has no published migration path from the current one, and no statement on how long both will be supported. Nor has anyone said how it relates to Open Semantic Interchange, which it appears to cut against.
- A portability standard the largest BI vendor ignores is a partial standard. Phase 2 targets native support across 50-plus platforms through Q4 2026, and nothing has shipped yet.
- The 38 percent accuracy gain claimed for agents with unified multi-dimensional context over agents working from semantic definitions alone is vendor-adjacent and unaudited. If it replicates it is the strongest argument in this whole topic.
- Microsoft sat out OSI and showed up for the pacing debate. Fabric IQ Ontology plus an MCP server is the same architecture OSI's absence-of-Microsoft objection was about, arriving proprietary.
- Nobody has reconciled the strict-ontology position with the loose-knowledge-graph one. They imply different amounts of work by an order of magnitude.

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

- `🔵 TRIAL` **Snowflake Advanced Semantics / Semantic Studio**. [[2026-09-03]]
- `🟡 ASSESS` **Microsoft Fabric IQ Ontology**. [[2026-09-15]]
- `🟡 ASSESS` **Apache Ossie / Open Semantic Interchange**, blocked on native vendor support and Microsoft's absence. [[2026-09-11]]
- `🟡 ASSESS` **Context layer over semantic layer, exposed to agents via MCP**. [[2026-09-11]]
- `🟡 ASSESS` **Graphiti / temporal knowledge graphs**. [[2026-09-11]]

## Related

[[Topics/Data Platform and Ingestion|Data Platform and Ingestion]] · [[Topics/Vector Databases and Retrieval|Vector Databases and Retrieval]] · [[Topics/MCP|MCP]] · [[Topics/Agent Memory and Context Engineering|Agent Memory and Context Engineering]]
