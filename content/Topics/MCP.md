---
type: topic
tags: [topic, mcp]
updated: 2026-10-30
living: true
---

# MCP (Model Context Protocol)

The protocol's move from a tool-calling spec to infrastructure: stateless core, the registry and skills-catalog layer, agent identity replacing static tokens, and the emergence of MCP as the transport by which *meaning* reaches an agent rather than just tools.

## Where this stands

The protocol is becoming governed infrastructure, and the newest evidence concerns the interface between server and caller. The current spec revision is 2026-07-28: protocol-level sessions are gone, servers can be stateless, Tasks moved to an extension, and Enterprise-Managed Authorization is stable. More than 10,000 public servers are active, and the protocol sits in the Linux Foundation's Agentic AI Foundation, yet production use is thinly evidenced. Agent identity through Workload Identity Federation and DPoP moved down to watch on October 17, 2026: the specification and SDKs had no release in 33 days and the security-schemes proposal (SEP-1488) is still a draft. Server Cards (SEP-2127), merged on October 8, are labelled an extension, and no SDK or major client supports them. On October 20 the maintainers merged a Tasks and Events Working Group, and on October 21 Mastra shipped the first framework implementation of the draft Events extension (SEP-3415), marked experimental. On October 26 the maintainers closed, for process, a proposal to make clients pin tool descriptions, saying proposals need working-group discussion first. Commenters want the pin to cover the full tool definition, and one reports that 6,911 of 14,089 changed tools in a registry scan changed `inputSchema`, a figure only that commenter has published. A prototype digest is being revived under SEP-1766. The maintainers' local-server guide says "the transport is not a sandbox", yet a sample of 2,999 repositories found 46.0% of local server configs start a server without a version pin, and MCP's own quickstarts use unpinned `npx -y` and `uvx` (issue 3431, no maintainer reply).

Governance is the dominant commercial shape. Snowflake's Cortex AI Gateway, in public preview, enforces policy per tool call, but dynamic routing is only "private preview soon" and the catalog of more than 100 MCP servers is private preview. Databricks registers an MCP service as a Terraform-managed catalog object, ships its Genie One server through Unity Gateway with permissions checked per request, and began screening MCP tool calls and results for jailbreaks in beta on October 21. It says its Smart Router cuts average task cost by more than 30%, and it publishes no method, task set or quality measure. Its budget ladder of warn, approve, downshift and block is the part worth copying. AWS's Bedrock AgentCore Gateway is a managed MCP server that added private-certificate support in October. Eon runs one gateway for more than 100 developers and about 10,000 sessions, and its caveats are the first production report on record: Cedar policy size limits forced a listing mode that "removes semantic tool search", and standard MCP clients needed a custom shim to finish OAuth. Both are self-reported on an AWS blog. Uber published a gateway design hosting over 800 servers and 5,000 tools, with every tool disabled until its owning team enables it. Anthropic's Claude apps gateway has per-developer spend caps that fail open by default, and Claude Code 2.1.305 (October 20) stopped `allowedMcpServers` from filtering `managed-mcp.json` stdio servers that use `${VAR}` only in `env`. OpenAI says Codex CLI 0.164.0 (October 23) can require managed configuration from a server and authorize enterprise MCP connections through account grants. GitHub's Copilot default makes MCP access an org-wide toggle with an October 22, 2026 deadline. Runlayer sells a gateway tied to the identity provider. Its traction is vendor-reported, independent practitioner signal is near zero and pricing is not public, so it holds a single assess entry. A coarse on/off switch and per-call enforcement are different controls, and the spec says nothing about either.

Evidence keeps pointing at servers, not agents, as the weak surface. A study of 3,001 error messages from 150 servers found that naming the exact next tool call lifted credential-error recovery from 45% to 84%. The official Python client had an OAuth flaw that let a hostile server capture credentials, fixed in 1.30.0 and 2.2.0. Pydantic AI's maintainers say provider-native MCP configuration could expose server URLs, authorization tokens and header values in OpenTelemetry traces, fixed in 2.58.0, and MCP Inspector 1.0.3 (October 21) is a security release. Two single-author projects reported that tool definitions change silently, which supports pinning and diffing manifests, now with first-party backing from the maintainers' guide and Microsoft Agent Framework origin pinning. Issue 3394, on retries that re-run mutating calls after a lost response, has 32 comments and no maintainer reply. Its October 15 rescan found 2 of 431 write tools accepting an idempotency key. Prompt-injection detectors also failed to transfer between benchmarks, so a gateway's filter needs testing on your own tool outputs.

Usage patterns are shifting, and nobody has measured the shift. Pi's Codemode and OpenCode 2.0's Code Mode, enabled for every MCP server by default, let the agent write code to sequence tool calls. A sandbox-bypass report is unverified, and Microsoft Agent Framework 1.21.0 warns that nested calls can bypass per-call policy. The leanrea repository says one 8 KB skill file plus plain command-line tools matched the Reverse Engineer Anything server, scoring 74 of 75 against 75 at \$2.17 against \$3.36. The author competes with that server, ran three repetitions on one model, and a no-skill arm scored 67 at almost the same cost, so treat it as a cheap A/B and not a rule. SkillSeek found plain keyword retrieval matches a model-driven loop for choosing among 230,000 skills at about half the cost. MCP also carries curated meaning: LinkedIn reports a shared data context layer exposed through MCP tools raised acceptable answers from 25.9% to 79.5% in one business area, self-reported with no method.

## Open questions

- Does the working group define what a client pins, the description only or the full tool definition including `inputSchema`, and does SEP-1766 advance?
- Does any publisher other than one commenter report the share of changed tools that changed `inputSchema`?
- Does Databricks publish a method, task set and quality measure for the Smart Router's claimed 30% task-cost cut?
- If direct HTTP and command-line access is cheaper for the model but removes per-tool authorization and audit, what is the safe subset? Leanrea's single benchmark does not answer it.
- Does the new Tasks and Events Working Group take up retries and idempotency, or only Events? Issue 3394 has no proposal or maintainer decision.
- Does any SDK or major client adopt Server Cards (SEP-2127) or the Events extension (SEP-3415), and does either leave extension status?
- Registering a server as a catalog object and standardising identity through Workload Identity Federation overlap. Which is authoritative when they disagree, and does the identity track resume after 33 days without a release?
- Eon hit Cedar policy size limits and an OAuth shim on AgentCore Gateway. Do other gateway deployments meet the same two walls?
- How does GitHub's on/off default interact with per-call enforcement from Snowflake, Databricks and AWS, and will other coding-agent vendors follow?
- Do fleets set `enforcement.fail_closed_on_error` on the Claude apps gateway and add `deniedMcpServers` entries before 2.1.305 rolls out?
- Does the error-message finding hold beyond credential and rate-limit errors, and will server authors rewrite error paths without a spec mandate?
- How many deployed clients have moved to the fixed Python client and passed an explicit `issuer=`?
- Does tool-definition drift replicate outside two single-author projects, and does MCP's own quickstart move to pinned versions?
- How does code-composed tool calling compare with plain calls on cost, turns and failure rate, and can per-call policy reach nested calls?
- Does Runlayer's on-behalf-of identity work under AWS request signing on AgentCore, and does any independent report on its scanners appear?
- Does Snowflake move Cortex AI Gateway routing to public preview with a customer measurement on a real workload?
- MCP does not say how much tool metadata and output reaches the model, so full schemas compete for context. This is a direct token-cost problem.
- Server count is not usage, and production adoption remains thinly evidenced.

## 2026-10-30

![[2026-10-30#^agent-mcp-lost-response]]

![[2026-10-30#^agent-append-only-context]]

![[2026-10-30#^ep-moengage-agentcore]]

![[2026-10-30#^spotlight-jedify]]

![[2026-10-30#^radar-idempotency-key]]

![[2026-10-30#^radar-mcp-error-messages-dropped]]

Source note: [[2026-10-30]]

## 2026-10-26

![[2026-10-26#^agent-mcp-tool-pinning]]

![[2026-10-26#^radar-pin-diff-mcp]]

![[2026-10-26#^ep-databricks-smart-router]]

![[2026-10-26#^sdlc-codex-managed-config]]

Source note: [[2026-10-26]]

## 2026-10-21

![[2026-10-21#^runlayer-what]]

![[2026-10-21#^runlayer-how]]

![[2026-10-21#^runlayer-backers]]

![[2026-10-21#^runlayer-customers]]

![[2026-10-21#^runlayer-rippling]]

![[2026-10-21#^runlayer-competitors]]

![[2026-10-21#^runlayer-critical]]

![[2026-10-21#^runlayer-read]]

![[2026-10-21#^agent-pydantic-mcp-fixes]]

![[2026-10-21#^agent-leanrea]]

![[2026-10-21#^agent-mcp-events]]

![[2026-10-21#^sdlc-claude-code-2-1-305]]

![[2026-10-21#^ep-eon-gateway]]

![[2026-10-21#^ep-litellm-spend]]

![[2026-10-21#^rn-mcp-inspector]]

![[2026-10-21#^rn-mcp-sdks]]

![[2026-10-21#^rn-mastra]]

![[2026-10-21#^rn-claude-agent-sdk]]

![[2026-10-21#^rn-graphiti]]

![[2026-10-21#^radar-runlayer]]

![[2026-10-21#^radar-skill-over-mcp]]

![[2026-10-21#^radar-mcp-events]]

![[2026-10-21#^radar-agentcore-gateway-eon]]

Source note: [[2026-10-21]]

## 2026-10-17

![[2026-10-17#^agent-opencode-code-mode]]

![[2026-10-17#^agent-mcp-3394]]

![[2026-10-17#^agent-mcp-unpinned]]

![[2026-10-17#^sdlc-managed-settings]]

![[2026-10-17#^radar-codemode-caution]]

![[2026-10-17#^radar-idempotency-rearg]]

![[2026-10-17#^radar-mcp-identity-watch]]

![[2026-10-17#^rn-aws-gateway-private-ca]]

Source note: [[2026-10-17]]

## 2026-10-12

![[2026-10-12#^agent-mcp-retry-idempotency]]

![[2026-10-12#^de-linkedin-context-layer]]

![[2026-10-12#^sdlc-claude-apps-gateway]]

![[2026-10-12#^prac-context-mode]]

![[2026-10-12#^prac-rea]]

![[2026-10-12#^ep-litellm-1105]]

![[2026-10-12#^radar-idempotency-rearg]]

![[2026-10-12#^radar-context-layer]]

Source note: [[2026-10-12]]

## 2026-10-09

![[2026-10-09#^agent-pi-temporal-outcome-unknown]]

![[2026-10-09#^radar-idempotency-keys]]

![[2026-10-09#^ep-cortex-gateway]]

![[2026-10-09#^rn-dbt-mcp]]

![[2026-10-09#^rn-litellm]]

![[2026-10-09#^spotlight-ktx]]

![[2026-10-09#^radar-codemode]]

Source note: [[2026-10-09]]

## 2026-10-08

![[2026-10-08#^mcp-server-cards-guide]]

![[2026-10-08#^codemode-failures]]

![[2026-10-08#^radar-pin-diff]]

![[2026-10-08#^radar-codemode]]

![[2026-10-08#^radar-server-cards]]

![[2026-10-08#^uber-mcp-gateway]]

Source note: [[2026-10-08]]

## 2026-10-05

![[2026-10-05#^mcp-contract-drift]]

![[2026-10-05#^rn-agentcore-private-tls]]

![[2026-10-05#^radar-mcp-manifest-pinning]]

Source note: [[2026-10-05]]

## 2026-10-02

![[2026-10-02#^pi-codemode-mcp]]

![[2026-10-02#^skillseek-bm25]]

![[2026-10-02#^rn-dbt-mcp-250]]

![[2026-10-02#^radar-codemode-mcp]]

![[2026-10-02#^radar-skillseek]]

![[2026-10-02#^expanded-semantic-view-yaml-deploy]]

Source note: [[2026-10-02]]

## 2026-09-29

![[2026-09-29#^mcp-error-messages]]

![[2026-09-29#^mcp-python-sdk-oauth]]

![[2026-09-29#^agentcore-gateway-tools-list]]

![[2026-09-29#^radar-mcp-error-messages]]

Source note: [[2026-09-29]]

## 2026-09-25

**Databricks' Genie One MCP server reached general availability, exposing Genie itself as a standard MCP tool with Unity Catalog permissions enforced per request rather than at connection time.** `system.ai.genie_one_mcp` is a Databricks-provided MCP Service in Unity Gateway, the same registration surface that went generally available on [[2026-09-17]], that makes Genie, Databricks' natural-language-to-data agent, callable by any MCP client or agent, including Claude, ChatGPT, or Cursor. Verbatim: "The Genie One MCP server is now generally available as a Databricks-provided MCP Service, `system.ai.genie_one_mcp`, in Unity Gateway. It exposes Genie as a conversational tool over the Model Context Protocol, so any MCP client or agent, such as Claude, ChatGPT, or Cursor, can ground its data questions in Genie's trusted insights, with Unity Catalog permissions enforced on every request." The permission detail is the one worth keeping: authorization is checked per request, not once at connection time, which is the tool-call-level enforcement this page has tracked since Snowflake's Cortex AI Gateway on [[2026-09-16]], now applied by Databricks to its own agent product rather than to third-party servers it merely governs. The prior beta endpoint sunsets October 31, 2026. ([Databricks blog](https://www.databricks.com/blog/genie-one-mcp-now-generally-available))

**GitHub Copilot's new global default-enablement policy explicitly covers MCP server access, moving one of the largest coding-agent install bases from implicit opt-in to an admin-choice-with-a-deadline.** A new policy in Copilot Business and Enterprise settings governs how unconfigured generally-available features behave, and MCP server access is named alongside Copilot Code Review as a feature it covers. A 28-day configuration window runs through October 22, 2026, after which any feature an organization never explicitly configured follows the org's chosen global default: Enabled, Disabled, or let-orgs-decide. Nothing here is a gateway or a registry; it is a platform admin's on/off switch applied to MCP as a category of feature, a different kind of governance from the tool-call enforcement Snowflake, Databricks, and AWS sell elsewhere on this page, and it flips MCP server access for Copilot's install base from a default nobody had chosen into a decision every admin now has to make. ([GitHub changelog](https://github.blog/changelog/2026-09-24-default-enablement-of-copilot-features-for-copilot-business-and-enterprise/))

Source note: [[2026-09-25]]

## 2026-09-21

**"Why MCP Was Always a Bad Idea" drew 221 points and 183 comments on Sep 20, and it is the first serious public argument for retirement rather than reform.** Maharshi Patel's case is that MCP was designed for a period when models could not be trusted to write their own integration code, describing it as "a horrible protocol built for a time when LLMs weren't that smart, and we've outgrown it." Agents can now write scripts and call HTTP APIs and command-line tools directly, so on that reading the protocol layer is overhead. The argument holds where MCP is weakest, which is a tool whose entire surface is one HTTP call and whose schema is larger than the call it describes. It is weakest itself on the three things enterprises actually adopted MCP for, and which every governance product on this page sells: discovery, per-tool authorization, and audit. None of those get cheaper by replacing a protocol with a shell, and a shell is a strictly larger attack surface than a typed tool list. Worth reading as a statement of where the protocol's value is not, rather than as a prediction. ([Maharshi Patel](https://maharship.com/blog/why-mcp-was-always-a-bad-idea/))

**Google's AX makes Model Context Protocol servers part of a declarative workspace rather than a per-agent config file.** AX is Apache 2.0, Kubernetes-native, and at 4.6k stars after 556 points on Hacker News on Sep 20. Its Workspace primitive pre-wires Git repositories, Model Context Protocol servers and skill packages so an agent starts warm, declared as an `ax.io/v1alpha1` manifest alongside a Gateway primitive that locks outbound traffic to an explicit host allowlist and a Model primitive holding provider credentials in Kubernetes secrets. For this page the relevant part is that server attachment becomes a declared property of the workspace, checked into a repository and applied by a controller, rather than a JSON file on a developer's laptop. That is the same direction as Databricks registering an MCP service as a catalog object, arriving from the Kubernetes side instead of the warehouse side. The project's README warns of "major breaking changes likely prior to stable release." ([github.com/google/ax](https://github.com/google/ax))

**Databricks added managed Model Context Protocol connectors to Genie One, and will restrict Genie Agents to explicitly attached sources.** Chat in Genie One can now use Databricks-managed connectors for Google Drive, Gmail, Microsoft 365, Atlassian and Slack, which is the first instance on this page of a warehouse vendor shipping first-party connectors to general productivity systems rather than governing third-party servers. In late September 2026, separately, Genie Agents will be restricted to using only the data sources explicitly attached under an agent's Sources. The second is the more consequential: ambient access to a catalog stops being the default, and an agent relying on it will stop working. ([Databricks release notes](https://docs.databricks.com/aws/en/release-notes/product/2026/september))

Source note: [[2026-09-21]]

## 2026-09-18

**AWS published how AgentCore Gateway implements the MCP 2026-07-28 revision, and it is the most detailed account of the stateless shift from any implementer so far.** A single `UpdateGateway` call moves a gateway to the new revision, and four revisions (2025-03-26, 2025-06-18, 2025-11-25, 2026-07-28) then coexist on that gateway with clients selecting per request. The statelessness change is handled by carrying protocol version, client info and capabilities in each request's `_meta` parameter rather than relying on a one-time handshake. Multi-round-trip requests, which the spec introduced to replace server-initiated requests, are implemented per request through an `InputRequiredResult` and an opaque `requestState` token, retiring the persistent server-sent-event stream that elicitation and sampling previously needed. Structured tool output carries a result envelope with time-to-live and cache-scope hints for cacheable operations. Header binding for `Mcp-Method` and `Mcp-Name` is enforced, with a mismatch rejected as `-32020`. One gap is stated plainly: the cross-version translation does not support elicitation and sampling calls from servers to clients when an older client connects to a 2026-07-28 target, which is the exact flow multi-round-trip requests were designed to carry. ([AWS blog](https://aws.amazon.com/blogs/machine-learning/how-agentcore-gateway-supports-the-mcp-2026-07-28-spec/))

**Gateway is also an answer to tool overload and to the bypass problem, both of which the spec leaves open.** Semantic tool discovery ships as a built-in tool, `x_amz_bedrock_agentcore_search`, so an agent queries for the tool it needs in natural language instead of having every registered tool serialised into its context window. That is a direct response to the token-cost question standing open on this page, and it is a vendor answer rather than a spec one. Separately, since June 2026 an AgentCore Runtime can be configured to accept invocations only when they originate from your gateway, enforced through an `aws:SourceArn` resource-based policy condition for Signature Version 4 runtimes and `allowedWorkloadConfiguration` for JSON Web Token runtimes. Every gateway logged on this page governs what an agent may reach through it; this is the first that also closes the path around it. Tool indexing for the search tool is priced separately at \$0.02 per 100 tools per month, with Search invocations at \$0.025 per 1,000 against \$0.005 per 1,000 for ListTools, InvokeTool and Ping. ([Gateway introduction](https://aws.amazon.com/blogs/machine-learning/introducing-amazon-bedrock-agentcore-gateway-transforming-enterprise-ai-agent-tool-development/), [AgentCore release notes](https://docs.aws.amazon.com/bedrock-agentcore/latest/devguide/release-notes.html), [AgentCore pricing](https://aws.amazon.com/bedrock/agentcore/pricing/))

**The Sep 1 Consent Portal removes the piece of OAuth infrastructure every MCP integration was building by hand.** Connecting an agent to GitHub, Salesforce or Slack previously meant building, hosting and maintaining custom OAuth callback infrastructure to complete OAuth 2.0 three-legged authorization. Each gateway now gets a hosted portal with its own web client and credential provider list at a `portalUrl`, where a user reviews and approves the requested access before the agent proceeds, plus a self-service connection-status view that needs no administrator. It is generally available in every commercial region where AgentCore Identity runs, managed through create, get, list, update and delete consent-portal operations, and it requires a gateway with JSON Web Token inbound authentication as its source plus an identity provider whose permitted scopes include `openid`. AWS calls out agent integrated-development-environment clients specifically, since those cannot natively present an OAuth consent URL. ([AWS what's new](https://aws.amazon.com/about-aws/whats-new/2026/09/amazon-bedrock-agentcore/))

Source note: [[2026-09-18]]

## 2026-09-17

**Databricks made an external MCP server a governed catalog object, managed through Terraform.** The Unity Gateway API reached general availability on Sep 16 with create, read, update, list, and delete across three object types: model services, model provider services, and MCP services. Client support is broad on day one: the Terraform provider from 1.132.0, the command-line interface from v1.17.0, the Python software development kit from 0.136.0, Go from v0.178.0, Java from 0.153.0, and JavaScript from 0.19.0, with Declarative Automation Bundles support in beta through the command-line interface.

The significance for this page is not the feature list but what it does to the registration problem. The agent-and-skill-registry consolidation logged on [[2026-09-09]] identified the pattern as "register once, discover by natural-language search, reach through a single gate that records everything," and every implementation of it so far has been a standalone gateway product. Databricks put the registry inside the catalog that already holds the data, governed by the same privileges, declared in the same infrastructure-as-code repository as the tables. That is a materially different answer to who owns the registry, and it arrived one day after Snowflake's equivalent. ([Databricks release notes](https://docs.databricks.com/aws/en/release-notes/product/), [Unity Gateway API reference](https://docs.databricks.com/api/workspace/aigateway))

**Komodor's platform ships more than 50 packaged agents, skills, integrations, and MCP servers behind one governance backbone.** Role-based policies define who may invoke an agent and which credentials and tools it may use, guardrails check inputs, tool calls, and model responses before execution, and every run is audited against a spending limit. Agents run on-premise or on any cloud against any model and provider while sharing one organisational context. This is the registry-plus-gateway pattern sold as a vertically packaged product for Kubernetes-shaped operations rather than as a substrate, and it is the first instance in this log where the MCP servers ship pre-populated rather than being something the buyer registers. ([Komodor](https://www.globenewswire.com/news-release/2026/09/16/3363246/0/en/komodor-launches-agentic-operations-platform-combining-ready-to-run-automation-with-a-comprehensive-backbone-for-custom-agents.html))

Source note: [[2026-09-17]]

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

- `🔵 TRIAL` **Idempotency key per external call for mutating MCP tools**. (was [[2026-10-12]]) [[2026-10-17]]
- `🔵 TRIAL` **MCP error messages that name the next tool call**. [[2026-09-29]]
- `🔵 TRIAL` **Snowflake Cortex AI Gateway**. (was [[2026-09-16]]) [[2026-10-09]]
- `🔵 TRIAL` **Databricks Unity Gateway API**. (was [[2026-09-17]]) [[2026-10-21]]
- `🔵 TRIAL` **Databricks Genie One MCP server**. (was [[2026-09-25]]) [[2026-10-26]]
- `🔵 TRIAL` `⚠️` **Amazon Bedrock AgentCore Gateway**. (was [[2026-09-18]]) [[2026-10-21]]
- `🔵 TRIAL` **AgentCore Gateway dimensional rate limits**. (was [[2026-09-18]]) [[2026-10-21]]
- `🔵 TRIAL` **BM25-first skill and tool retrieval (SkillSeek)**. [[2026-10-02]]
- `🟡 ASSESS` **Pin-and-diff MCP tool manifests**. (was [[2026-10-08]]) [[2026-10-26]]
- `🟡 ASSESS` `⚠️` **Code-mode MCP composition (Pi Codemode, OpenCode Code Mode)**. (was [[2026-10-09]]) [[2026-10-17]]
- `🟡 ASSESS` **Context layer over semantic layer, exposed to agents via MCP**. (was [[2026-09-11]]) [[2026-10-12]]
- `🟡 ASSESS` **Claude apps gateway spend caps**. [[2026-10-12]]
- `🟡 ASSESS` **Runlayer**. [[2026-10-21]]
- `🟡 ASSESS` **Skill plus plain command-line tools in place of an MCP server (leanrea)**. [[2026-10-21]]
- `◻️ WATCH` **MCP agent identity (Workload Identity Federation + DPoP)**. (was [[2026-09-14]]) [[2026-10-17]]
- `◻️ WATCH` **MCP Server Cards (SEP-2127)**. [[2026-10-08]]
- `◻️ WATCH` **Cymphony + agent/skill registry consolidation**. (was [[2026-09-09]]) [[2026-10-12]]
- `◻️ WATCH` **MCP Events extension (SEP-3415)**. [[2026-10-21]]
- `⚫ DROPPED` **Datamimic deterministic synthetic test data over MCP**. [[2026-09-16]], removed [[2026-10-17]]

## Related

[[Topics/Agentic SDLC Governance|Agentic SDLC Governance]] · [[Topics/Semantic Layer and Knowledge Graphs|Semantic Layer and Knowledge Graphs]] · [[Topics/Agent Memory and Context Engineering|Agent Memory and Context Engineering]] · [[Topics/Data Platform and Ingestion|Data Platform and Ingestion]] · [[Topics/Agent Supply Chain Security|Agent Supply Chain Security]] · [[Topics/Agent Sandboxing and Execution Policy|Agent Sandboxing and Execution Policy]]
