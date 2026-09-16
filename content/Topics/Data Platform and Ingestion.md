---
type: topic
tags: [topic, data-platform, dbt, snowflake]
updated: 2026-09-16
living: true
---

# Data Platform and Ingestion

Movement in the warehouse and transformation layer: Snowflake's semantic, governance, and agent-control features, dbt's 2.0 progression and its Snowflake-native CI story, and the ingestion shift toward agent-written pipelines.

## Where this stands

Snowflake spent September moving the agent problem into the warehouse rather than leaving it to a separate governance vendor. Cortex AI Gateway is the centre of that: one control plane over models, data, 100-plus MCP servers, and enterprise tools, with policy and audit enforced at the tool-call level, covering third-party agents like Claude Code and Cursor alongside first-party Cortex functions. Core gateway is public preview; the cost, policy, and audit features around it are private preview.

dbt's Snowflake-native CI story is now the most directly actionable thing in this layer: Slim CI, defer-to-production, failed-execution recovery, and concurrent execution all went GA on Sep 10 for dbt Projects on Snowflake. That has a real adoption cost attached, not just a flag, because all four depend on the `2026_06` behaviour-change bundle.

The ingestion layer is the quietest part and the one with the clearest direction: as pipeline authoring gets cheap enough for agents to do, the bottleneck moves upstack to modelling and semantics, which is why the semantic-layer items keep outnumbering the ingestion items.

## Open questions

- Does the Cortex AI Gateway boundary hold? It governs the routing path, not entitlement, so Cortex database roles remain the access layer. Whether that stays a clean separation or becomes two overlapping permission systems is unresolved.
- No independent measurement of Snowflake's dynamic model routing exists. The 3x and 25 percent token-efficiency claims are internal testing.
- `interactive_table` cannot carry a model contract. Whether that is a beta gap or a structural limit decides whether it can ever sit anywhere but the serving edge.
- Open Semantic Interchange still has no vendor shipping native import/export, and Microsoft is still absent while shipping a competing ontology layer in Fabric IQ.

## Timeline

- **2026-09-16.** Cortex AI Gateway reaches public preview: one auto-provisioned `SNOWFLAKE` gateway per account, role-granted model access, per-user quotas, custom-budget integration, trace tables, `AI_GATEWAY_USAGE_HISTORY`. Dynamic model routing ships across the gateway, CoCo, CoWork, and third-party agents. `EXPLAIN CHANGES` for dynamic tables and App Runtime go GA; Horizon Catalog Explorer becomes the default Snowsight browser. dbt adds an `interactive_table` materialization in beta, backs `state:*` selectors with dbt State, and turns platform AI features on by default. ([[2026-09-16]])
- **2026-09-15.** dbt ships Analyst Read to all accounts and splits Semantic Layer failures into distinct `[WAREHOUSE_AUTHENTICATION_FAILED]` and `[WAREHOUSE_PERMISSION_DENIED]` prefixes instead of one indistinguishable message. Model query history goes GA for Redshift and Databricks. Microsoft Fabric IQ Ontology moves further into preview with sharing, permissions, rules that can initiate business processes, and an MCP server. ([[2026-09-15]])
- **2026-09-14.** dbt Projects on Snowflake CI capabilities go GA (Slim CI, defer to production, failed-execution recovery, concurrent execution), gated on the `2026_06` behaviour-change bundle which moves dbt project objects to a single mutable live version. Snowflake CLI plus the new system functions make this a full CI/CD story rather than a warehouse feature. ([[2026-09-14]])
- **2026-09-11.** Open Semantic Interchange becomes an Apache project, with reference converters merged for dbt MetricFlow, GoodData, Salesforce, and Apache Polaris, and no vendor shipping native import or export. dlt sits at 1.30.0 (Apache 2.0, ~5.8k stars, Python 3.10 to 3.14). The context-layer-over-semantic-layer pattern consolidates across Atlan, Looker BI Agents, and SAP Knowledge Graph. ([[2026-09-11]])
- **2026-09-03.** Snowflake Advanced Semantics and Semantic Studio in private preview since the June Summit: level-of-detail calculations, composable semantic definitions, and an AI-assisted semantic model IDE with CoCo integration. ([[2026-09-03]])

## On the radar

- `🔵 TRIAL` **Snowflake Cortex AI Gateway**. [[2026-09-16]]
- `🔵 TRIAL` **Snowflake dynamic model routing**. [[2026-09-16]]
- `🔵 TRIAL` **dbt Projects on Snowflake CI capabilities**. [[2026-09-14]]
- `🔵 TRIAL` **Snowflake Advanced Semantics / Semantic Studio**. [[2026-09-03]]
- `🟡 ASSESS` **dbt `interactive_table` materialization**, contracts unsupported and a silent staleness trap downstream of `table` models. [[2026-09-16]]
- `🟡 ASSESS` **dlt (data load tool)**. [[2026-09-11]]
- `🟡 ASSESS` **Microsoft Fabric IQ Ontology**. [[2026-09-15]]
- `🟡 ASSESS` **Apache Ossie / Open Semantic Interchange**. [[2026-09-11]]

## Open action items

- Pin `dbt-snowflake` to v1.10.6 or later ahead of Snowflake's default string and binary column size change. Carried from [[2026-09-14]], still open.
- AI features in the dbt platform are now on by default. Confirm that is wanted before it surprises someone. Opened [[2026-09-16]].

## Related

[[Topics/Semantic Layer and Knowledge Graphs|Semantic Layer and Knowledge Graphs]] · [[Topics/Token Cost and Model Routing|Token Cost and Model Routing]] · [[Topics/MCP|MCP]] · [[Topics/Vector Databases and Retrieval|Vector Databases and Retrieval]]
