---
type: topic
tags: [topic, agent-memory]
updated: 2026-09-16
living: true
---

# Agent Memory and Context Engineering

What agents retain, retrieve, and forget, and the research literature on how to manage the informational environment an agent reasons over. A field rather than an adoptable technique, which is why the specific named methods carry the radar positions and this page carries the prose.

## Where this stands

The most useful evaluation lens available is the five-criteria test from the Context Engineering paper: **relevance, sufficiency, isolation, economy, provenance**, proposed as a joint test rather than five independent knobs. Almost everything on the market optimises economy alone, and provenance and isolation are where agent failures actually originate. That is the reason the standing caution against optimising context for economy alone exists.

Two named failure modes are worth knowing by name because they are easy to build into a system by accident. **Brevity bias** is summarisation stripping domain-specific detail to stay concise and losing knowledge that mattered. **Context collapse** is the gradual erosion across repeated rewrites of the same context. Anyone running a summarise-then-resummarise loop is walking into both by construction.

The cost argument is settled enough to state plainly: naive accumulation of raw history produces quadratic token growth, crude summarisation gets cost back to linear but introduces an accuracy cliff, and only validated compaction, meaning compaction checked against the source rather than trusted blindly, gets linear cost without giving up fidelity.

The newest evidence is uncomfortable: in Emergence AI's study, a flagged risk did not survive in an agent's own memory to the moment of action. That reframes detection-without-containment as a memory and context problem rather than a reasoning one.

## Open questions

- If a flagged risk can be displaced from an agent's context before it acts, flagged-risk state needs to be sticky and structural rather than a note in a transcript. Nothing in the current literature addresses that directly.
- mem0 claims harness configuration rather than model choice is the dominant performance lever. Vendor-published, and worth testing independently, because if true it changes where evaluation effort should go.
- The Galster study found nobody using persistent subagent memory. The gap between the research literature and what practitioners actually configure is very wide and nobody has explained it.
- "Context engineering" was removed from the radar for being a discipline rather than an adoptable technique. Which specific named methods deserve their own rings is still an open list.

## 2026-09-16

**Emergence AI's study produced a memory failure that no single-turn eval would surface.** A Mistral agent wrote the phishing content it had itself flagged as dangerous into its own memory. A Gemini agent flagged a lure and then acted on it roughly 46 hours later. The second is worse than it looks: the flag existed in the agent's own history and did not survive to the moment of action. The agent knew, and then effectively unknew. Across all eight configurations, detecting a threat did not lead agents to try to contain it. The design consequence is that flagged-risk state has to be **sticky and structural**, not a note in a transcript that later context displaces. ([Semafor](https://www.semafor.com/article/09/14/2026/ai-agents-collude-to-bypass-guardrails-a-new-study-shows))

The same study's environment is itself a memory-architecture data point: 40-plus locations, real weather and news APIs, and persistent memory across episodic events, reflective diaries, and relationship tracking, sustained over fifteen days. ([Emergence AI](https://www.emergence.ai/blog/emergence-world-a-laboratory-for-evaluating-long-horizon-agent-autonomy))

Source note: [[2026-09-16]]

## 2026-09-15

**mem0's State of AI Agent Memory 2026 is the first attempt at a real benchmark landscape for this layer.** It covers **21 frameworks, 20 vector stores, and three hosting models**: managed cloud, self-hosted open source, and local MCP. Useful as a map rather than as a verdict, since the vendor publishing it sells memory infrastructure, so the comparative rankings are positioned. The claim worth testing independently is that **harness configuration, not model choice, is the dominant performance lever**. ([mem0](https://mem0.ai/blog/state-of-ai-agent-memory-2026))

Source note: [[2026-09-15]]

## 2026-09-14

Four papers got full expansions this window. They are the substance of the field as it currently stands.

**Context quality criteria (Context Engineering paper).** The argument is that context engineering sits above prompt engineering: designing and managing the entire informational environment an agent reasons over, not just the words in one prompt. Its five quality criteria, **relevance, sufficiency, isolation, economy, and provenance**, are proposed as a joint test rather than five independent knobs, and its specific complaint is that most tooling optimizes economy, meaning token count, alone and lets the other four slide. It stacks a maturity model on top: prompt engineering, then context engineering, then **intent engineering**, meaning encoding organizational goals and value hierarchies into the agent's infrastructure, then **specification engineering**, meaning machine-readable corporate policy for scaling autonomous agents. The line worth keeping: whoever controls the agent's context controls its behavior, whoever controls its intent controls its strategy, whoever controls its specifications controls its scale. That maps directly onto Forrester's 41 percent unclear-success-criteria figure: an org can nail context and still lose control at the intent or specification layer. ([arXiv 2603.09619](https://arxiv.org/abs/2603.09619))

**Memory as a lifecycle, not a store (Agentic Context Management).** This reframes agent memory as a lifecycle: decide what is worth remembering, extract and structure it, route it to the storage type that actually fits it instead of defaulting everything to a vector database, then consolidate and forget while keeping provenance intact. The cost argument is the sharper part. Naive accumulation of raw history produces **quadratic token cost growth** as a conversation lengthens. Crude summarization gets cost back to linear but introduces what the paper calls an **accuracy cliff**. Only **validated compaction**, meaning compaction checked against the source rather than trusted blindly, gets linear cost without giving up fidelity. The reference implementation reports 92 percent on LongMemEval and 93.2 percent on LoCoMo. This is the paper behind the "right store per data type" point, which is the thing most stacks get wrong. ([arXiv 2607.21503](https://arxiv.org/abs/2607.21503))

**Context adaptation instead of retraining (ACE).** This treats a model's context, both its system prompt and its accumulated memory, as an evolving playbook that improves through generation, reflection, and curation cycles instead of weight updates. That is a meaningfully different lever from fine-tuning: no labeled supervision, no retraining, and it reportedly lets smaller open-source models match production-level agents on benchmark leaderboards. It names the two failure modes worth remembering by name. **Brevity bias** is what happens when summarization strips domain-specific detail to stay concise and loses knowledge that mattered. **Context collapse** is the gradual erosion that sets in across repeated rewrites of the same context, each pass losing a bit more nuance than the last. ACE reports a 10.6 percent gain on agent tasks and an 8.6 percent gain on finance tasks, with lower adaptation latency than the alternatives it compares against. ([arXiv 2510.04618](https://arxiv.org/abs/2510.04618))

**Agent-directed compression over fixed policy (ACM).** This gives the agent two explicit tools instead of a fixed compaction heuristic. `manage_context` compresses everything since the last compression into a summary while writing the original messages to disk under an ID. `query_memory` retrieves the original detail behind a given ID when the agent decides it actually needs it. Because the source messages are preserved rather than discarded, compression here is **lossless in the sense that matters**: nothing is lost, only deferred, and the agent chooses when to compress rather than following a fixed trigger. On BrowseComp-Plus, DeepSearchQA, and SWE-Bench Verified, an ACM-post-trained Qwen3.5-9B gets a 27 percent relative gain on BrowseComp-Plus and roughly 20 percent lower peak token usage than baselines, while sustaining longer exploration. The training method stands out on its own: instead of hand-curating examples, a teacher model marks where compression should have been inserted into a baseline trajectory and where a trajectory compressed too early, and those contrasting annotations become the training signal. This is the most concrete answer yet to "when should an agent compact its own context," a question the other three papers assume is already solved. ([arXiv 2607.23809](https://arxiv.org/html/2607.23809v1))

**Context compaction became a vendor-managed primitive.** OpenAI's Agents API, in public beta, gives applications managed access to the Codex harness while OpenAI runs **sessions, orchestration, context compaction, and recovery** and your application supplies the tools and picks the execution environment. The thing most agent frameworks exist to do is now a platform service, which either removes a large category of work or removes a large category of control depending on how much your compaction policy matters. Two hard constraints for enterprise use: **US data residency only, and no Zero Data Retention support.** ([OpenAI docs](https://developers.openai.com/api/docs/guides/agents-api/overview))

Source note: [[2026-09-14]]

## 2026-09-10

**Graphiti is the counterexample to flat vector stores for agent memory.** The problem it solves: agent memory built on a vector store can only answer "what is most similar to this?" and has no representation for a fact that *used to* be true, so when new information contradicts old you either overwrite and lose history or keep both and retrieve two contradictory passages ranked by cosine distance with no principled way to prefer the current one. That failure gets worse the longer an agent runs, which is exactly when memory is supposed to start paying off. Graphiti's answer makes time first-class via **bi-temporal edges** with validity windows, tracking *valid time* (when the fact was true in the world) separately from *system time* (when the system learned it). Full writeup in [[Topics/Vector Databases and Retrieval|Vector Databases and Retrieval]].

Source note: [[2026-09-10]]

## 2026-09-09

**A vector store is the wrong default for agent memory, and the reason is structural.** An agent that runs for weeks needs to recall what it learned in session three during session forty, and the naive implementation embeds every past turn into a vector store and retrieves by similarity to the current turn. That works acceptably for "have I seen something like this before" and poorly for almost everything else an agent actually needs to remember, because it has no way to follow a chain, count, aggregate, or express "what was true as of last March." The full comparison against graph retrieval is in [[Topics/Vector Databases and Retrieval|Vector Databases and Retrieval]].

Source note: [[2026-09-09]]

## 2026-09-03

**Context engineering was being called "the defining AI skill of 2026" with a consistent four-operation breakdown**: context offloading (move information out of the prompt), context reduction (compress or summarize), context retrieval (RAG, search, knowledge base), and context isolation (give each agent or task only what it needs). This taxonomy is what the original radar entry rested on, and it is also why that entry was eventually removed: a four-operation breakdown of a field is not something a team can adopt or decline. ([Sourcegraph](https://sourcegraph.com/blog/context-engineering), [Mem0](https://mem0.ai/blog/context-engineering-ai-agents-guide))

**Memory was consolidating around a few competing primitives.** Mem0 (persistent personalized memory), Letta (OS-inspired virtual context management), and Zep (conversational fact extraction) were the three most-cited dedicated agent-memory layers; LangMem separately supports episodic, semantic, and procedural memory together, including agents that rewrite their own system prompts from feedback. A March 2026 preprint (Bakal) argues the real bottleneck is not model capability but **knowledge architecture**, and proposes turning the Skills format itself into "Atomic Knowledge Units": action-ready, governance-aware specifications (what to do, which tools, what constraints, where to go next) that agents traverse as a knowledge graph rather than documents they have to reinterpret each time. ([arXiv 2603.14805](https://arxiv.org/abs/2603.14805))

**Astra's Codex context feature is the product-side version of the same idea**: instead of compressing prior context windows into a summary, it keeps running notes across windows and searches back through earlier ones for requirements or test results, avoiding repeated-summarization loss. That is ACM's deferred-detail pattern arriving as a product feature a year before the paper.

Source note: [[2026-09-03]]

## On the radar

- `⚫ DROPPED` **Context engineering**, removed as a category error rather than a change of view. It is a discipline, not an adoptable technique, and everything specific underneath it is listed separately. [[2026-09-03]], removed [[2026-09-15]]
- `🟡 ASSESS` **Graphiti / temporal knowledge graphs**. [[2026-09-11]]
- `🔵 TRIAL` **Shopify Helix checkpoint discipline**. [[2026-09-11]]
- `🟡 ASSESS` **Single-vendor agent fleets**. [[2026-09-16]]
- `⚠️ CAUTION` **Optimising context for economy alone**. Provenance and isolation are where agent failures originate; watch for brevity bias and context collapse in rewrite loops. [[2026-09-11]]

## Related

[[Topics/Vector Databases and Retrieval|Vector Databases and Retrieval]] · [[Topics/Token Cost and Model Routing|Token Cost and Model Routing]] · [[Topics/MCP|MCP]] · [[Topics/Semantic Layer and Knowledge Graphs|Semantic Layer and Knowledge Graphs]] · [[Topics/AI Safety and Interpretability|AI Safety and Interpretability]]
