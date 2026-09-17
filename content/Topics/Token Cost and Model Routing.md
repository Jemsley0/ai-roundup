---
type: topic
tags: [topic, token-cost, model-routing]
updated: 2026-09-17
living: true
---

# Token Cost and Model Routing

What actually drives the cost of running agents, which interventions survive independent benchmarking, and the shift from cheap tokens to choosing how hard a model tries.

## Where this stands

There is now a general test for whether a cost intervention is credible: **it has to reduce calls, reduce output, or reduce re-sent context.** Reducing one input channel's bytes is not on that list, which is how terminal-output compression got dropped after independent benchmarking showed it made coding 1 to 17 percent *more* expensive.

The dominant cost driver is quadratic context accumulation, not per-token price. A 10-step agent loop costs roughly 23x a single pass, and a 20-step loop about 85x, because the whole message history is re-serialised at every step. Prompt caching is the largest single lever, at roughly 90 percent below uncached input. Cheap-model routing is the one behavioural pattern at adopt, because it changes the price of tokens you were going to send anyway.

The newest direction was the model deciding how hard to try, rather than a router deciding which model to call. Cognition's SWE-2 exposes selectable reasoning effort and cut average steps from 127 to 53 at medium. Snowflake now sells the routing decision as a managed feature with residency and capability as inputs alongside cost.

As of 2026-09-17 there is a third direction, and it passes the credibility test on the second clause more completely than anything else in this thread. TypeSafe's Jev does not generate text at all. It returns a typed value from a single parallel pass, prices input at \$0.042 per million tokens, and charges nothing for output because there is effectively none. Reducing output is one of the three things a credible cost intervention can do, and taking it to zero is the limit case. The vendor-reported multiples, 40x to 200x faster and 40x to 400x cheaper than frontier models at equivalent intelligence, are large enough to discount heavily and still matter. The routing question this raises is not which model is cheapest but which decisions in a workflow ever needed a text generator, and the honest answer for triage, classification, and branch selection is that most of them did not. Note the boundary: this replaces the cheap end of a routing table, it does not compete at the expensive end.

## Open questions

- Every routing efficiency number in this thread except Spotify's and Quesma's is vendor-reported. Snowflake's 3x and Cognition's 64 percent both need independent eval.
- Selectable reasoning effort and external routing solve overlapping problems. Nobody has published what happens when you use both.
- Prompt caching is the biggest lever and gets the least attention. There is no good public writeup of cache-hit-rate engineering for agent loops.
- Nobody has published an independent evaluation of a decision-only model against a frontier model on the same routing or triage task. Agreement rate matters far more than the speed multiple, and only the vendor has measured it.
- If output tokens go to zero for a whole class of calls, the cost model for an agent loop changes shape rather than scale, and none of the existing per-step cost estimates in this thread account for that.

## 2026-09-17

**TypeSafe's Jev prices input at \$0.042 per million tokens and charges nothing for output, because it generates no text.** Output is a typed value from one of three primitives: Choice (pick a category), Score (a number on a scale), or Noul (a probability from 0 to 1), each returned with a calibrated confidence figure from a single parallel pass rather than token by token. Vendor-reported performance: 70ms to 500ms end to end, 40x to 200x faster and 40x to 400x cheaper than frontier models at equivalent intelligence, and 193.6x faster and 444.6x cheaper on TypeSafe's own workflow evaluation. Early access, text input only, and a 255-choice cardinality ceiling above which it falls back to two-stage scoring.

Against the general test this page uses, Jev reduces output rather than reducing bytes on one input channel, which is why it is worth taking seriously where terminal-output compression was not. The genuine secondary saving is that it removes the retry-and-parse wrapper a caller needs around a frontier model asked for structured output, because the model cannot emit a value outside the declared schema. That is also the claim most likely to be repeated wrongly. TypeSafe lists a 0 percent hallucination rate, and that is a statement about types, not facts: Jev cannot return a malformed answer and can still return a confidently wrong one. ([TypeSafe announcement](https://typesafe.ai/blog/introducing-system-one-models-and-jev), [System One docs](https://docs.typesafe.ai/concepts/system-one))

**A ternary-weight compression paper beat the apparent information-theoretic bound by measuring the weights instead of assuming them.** "Breaking the 1.58-bit Barrier for Ternary LLMs" introduces BITCOS, compressing ternary weights from 1.58 to 1.48 bits each. The 1.58 figure is log base 2 of 3, the entropy of three states under a uniform distribution, and the authors' observation is that the distribution is not uniform: across 29 ternary models, zeros account for up to 51.5 percent of all weights, so they design distribution-adaptive encoding layouts to match. Ternary weights make each multiply an add, a subtract, or a no-op, so inference gets cheap on ordinary processors, and memory bandwidth is usually the binding constraint anyway. This is the same axis as "Intelligence per Watt" from the previous cycle, which is still climbing at 159 points: cost per unit of capability measured in hardware terms rather than in vendor pricing. 128 points. ([arXiv 2609.16338](https://arxiv.org/abs/2609.16338), [HN](https://news.ycombinator.com/item?id=49732931))

**A free frontier-class endpoint appeared and burned 2 billion tokens in a day.** Union Alpha is an anonymous stealth model on OpenRouter as `stealth/union-alpha`, multimodal, 262,144-token context, up to 131,072 completion tokens, tool calling and structured output, priced at zero for both prompt and completion during a preview of about a week. No named lab, no parameter count, no architecture paper, no weights. Relevant here only as a distortion: for one week the marginal cost of a frontier-class coding call is zero, which is long enough to change how people evaluate and short enough that nothing built on it survives. ([OpenRouter listing](https://openrouter.ai/stealth/union-alpha))

Source note: [[2026-09-17]]

## 2026-09-16

**Google's Gemini 3.8 Live undercut GPT-Live-1 by roughly half.** Pricing is \$3/1M input and \$12/1M output tokens, which works out to about \$0.005 per minute of audio in and \$0.018 per minute out, against \$3-plus per hour for GPT-Live-1. Gemini 3.8 Live Extended Thinking takes first place on Artificial Analysis' Speech-to-Speech Quality Index at 82.6, with 68.6 percent on τ-Voice, 35.1 percent on Sierra's τ-Voice-banking, and 97.7 percent on Big Bench Audio. The banking number is the honest one: a first-place speech model still fails two thirds of a realistic domain task, so size expectations by that rather than the leaderboard position. ([MarkTechPost](https://www.marktechpost.com/2026/09/15/google-releases-gemini-3-8-live-and-3-8-live-extended-thinking-for-production-grade-voice-agents/))

**Snowflake shipped dynamic model routing as a managed feature of Cortex AI Gateway.** It routes each request on cost, latency, capability, and **data residency**, sending simple or repetitive work to efficient models and reasoning-heavy work to frontier ones, and re-adapting when model pricing changes without an application rebuild. Administrators still control which models and providers are available. Snowflake's internal testing claims agents building data pipelines with dynamic routing hit up to **3x greater token efficiency** than a frontier-only route, and engineering teams completed identical work at **25 percent greater token efficiency** on a mixed-model approach. Both vendor-reported. The reason to take the mechanism seriously despite discounting the multiplier is that it matches the independently-measured Spotify Portal result. Available in the gateway, CoCo, CoWork, and third-party agents using the gateway. Data residency as a routing input is the novel part; nothing else in this thread treats geography as a routing dimension. ([Techzine](https://www.techzine.eu/news/analytics/143712/snowflake-lets-cortex-ai-gateway-choose-models-itself/))

**"Intelligence per Watt" resurfaced at 103 points on Hacker News, and it is a November 2025 paper rather than a new one.** Stanford and Together AI propose intelligence per watt, meaning task accuracy per unit of power, as a single metric spanning capability and efficiency across model-accelerator pairs, measured over a million-plus queries, 20-plus local models, and consumer through data-centre accelerators. Local models answer 88.7 percent of single-turn chat and reasoning queries accurately, and local intelligence efficiency improved 5.3x from 2023 to 2025, decomposing into 3.1x from models and 1.7x from accelerators. It also covers hybrid routing, easy queries local and hard queries to cloud, which is the same shape as cheap-model routing with a power budget attached instead of a token budget. ([arXiv 2511.07885](https://arxiv.org/abs/2511.07885), [Stanford Scaling Intelligence](https://scalingintelligence.stanford.edu/blogs/ipw))

Source note: [[2026-09-16]]

## 2026-09-15

**mem0's State of AI Agent Memory 2026 makes a claim worth testing independently: harness configuration, not model choice, is the dominant performance lever.** The report covers 21 frameworks, 20 vector stores, and three hosting models, managed cloud, self-hosted open source, and local MCP. Useful as a map rather than a verdict, since the vendor publishing it sells memory infrastructure, so the comparative rankings are positioned. ([mem0](https://mem0.ai/blog/state-of-ai-agent-memory-2026))

**SemiAnalysis measured Vera Rubin NVL72 at 59.4M tokens/sec/MW against 28.5M for GB300 on DeepSeek V4 Pro**, roughly 2x rather than the 7x that got repeated in headlines. Read the methodology before quoting it. MediaTek launched the 2nm Dimensity 9600 Pro, which runs 30B-parameter models on-device with 51 percent faster prefill. ([SemiAnalysis](https://newsletter.semianalysis.com/p/vera-rubin-nvl72-agentic-inference))

Source note: [[2026-09-15]]

## 2026-09-14

**Cognition's SWE-2 is the strongest data point yet for the cheap-model-routing thesis, and it comes from a vendor with skin in the game rather than a benchmark shop.** Released Sep 10, post-trained from Moonshot's Kimi K3 (2.8T parameters), scoring 50.0 percent on FrontierCode 1.1 Main. Cognition claims parity with Fable 5.1 at **64 percent lower cost**, and roughly a quarter the cost of GPT-6 Astra. The mechanism is the part that matters: it is Cognition's first model with **selectable reasoning-effort levels** (medium, high, max), all trained in a single RL run, and medium effort cut average FrontierCode steps from **127 to 53** while costing 81 percent less than SWE-1.7. Fewer steps at lower cost with held accuracy is a different claim from "cheaper tokens." It is the model deciding how hard to try, which is the same proposer-delegator split showing up as a knob instead of an architecture. All figures are Cognition's own. ([MarkTechPost](https://www.marktechpost.com/2026/09/12/cognition-releases-swe-2-a-kimi-k3-post-trained-coding-model-that-matches-fable-5-1-on-frontiercode-at-64-lower-cost/))

**Anthropic cut Claude Code's weekly limits by 17 percent, announced as a permanent 25 percent increase.** Both numbers are true against different baselines. The temporary 50 percent boost that had run since May, extended four times, expired Sep 13. The new permanent limits sit 25 percent above the pre-promotion baseline, which Anthropic's own follow-up post concedes is "a 17 percent reduction" against what was available the day before. Directly relevant if you have been sizing agent workloads against the boosted ceiling. ([BleepingComputer](https://www.bleepingcomputer.com/news/artificial-intelligence/anthropic-is-cutting-claude-codes-current-weekly-limits-by-17-percent/))

**Cursor Projects is a second data point for the coordinator-plus-subagents bet.** A single coordinator agent plans extended work such as migrations or multi-week maintenance and delegates tasks to cloud subagents while holding shared context across the whole span. The practical constraint is the cost shape: parallel subagents multiply token cost roughly linearly, so five subagents use about five times one agent's usage, making it suited to long-lived work with disciplined PR review rather than quick fixes. Cursor's own framing, "the model is a commodity, the workflow is the moat," is the tell that persistent-context orchestration rather than model choice is where coding-agent vendors now compete. ([eesel.ai](https://www.eesel.ai/blog/cursor-projects-review))

Source note: [[2026-09-14]]

## 2026-09-11

**Correction: the RTK token-savings claim does not hold up under independent benchmarking, and the 09-10 note flagged it too favourably.** Quesma ran RTK on Terminal-Bench 2.1 across 1,740 attempts, five runs each with and without RTK, on 85 Fable tasks and 89 DeepSeek tasks, measuring actual token spend rather than terminal-output reduction, with task-level weighting so expensive outliers could not skew the result. Findings: Claude Code on Fable 5.0 came out **1 percent more expensive** per task on average, OpenCode on DeepSeek **17 percent more expensive**, and pass rates were 1 to 2 percent *lower* with RTK enabled. The mechanism matters more than the numbers. Terminal output is only about 7 percent of context in modern models, which already compress their own output; the extra agent turns RTK's filtering induces eat whatever compression saves; and RTK's self-reported "rtk gain" metric measures output reduction, not cost. Their conclusion is flat: "RTK does not make AI coding cheaper." ([Quesma](https://quesma.com/blog/does-rtk-make-ai-coding-cheaper/))

**The useful generalisation: terminal-output compression and cheap-model routing are different bets and should stop being lumped together.** Spotify's Portal result came from routing low-stakes calls to a cheaper model, which changes the price of the tokens. RTK-style tools shrink one input channel that turns out to be about 7 percent of context, and pay for it in extra turns. The first mechanism has a plausible theory of savings; the second does not, and now has evidence against it.

**What actually drives token cost.** The dominant cost driver in agentic workloads is **quadratic context accumulation**, not the size of any individual input. In a naive agent loop the entire message history is re-serialised and re-injected at every step, so while history grows linearly with iterations, billed input tokens grow quadratically. The published rule of thumb: a 10-step loop costs roughly 23x a single pass rather than 10x, and a 20-step loop about 85x. Four things actually move the number. **Call volume beats per-token price**, since per-token rates have fallen steadily but agentic products now make dozens to hundreds of calls per task. **Output costs 4 to 6x input** across every major provider, which makes verbose generation far more expensive than verbose input. **Idle context** is the silent tax: step one's planning output is still sitting in the window at step ten whether or not it is relevant, and without explicit pruning policies, rejected approaches, superseded plans, and stale tool output ride along for the whole workflow. **Redundant retrieval** compounds it, since agents without memory management re-read documents they have already loaded. Against that, the interventions rank clearly: prompt caching is the largest single lever, with cache reads roughly 90 percent below uncached input, which is why Fable 5.1 dropping cache reads to \$0.25 mattered more than it looked. ([Augment Code](https://www.augmentcode.com/guides/ai-agent-loop-token-cost-context-constraints), [prompt caching evaluation](https://arxiv.org/pdf/2601.06007))

**An operational writeup on OpenRouter hit 290 points, from the author of Olly, an assistant that has run 18M-plus messages partly through it.** The core finding is that identical model weights perform materially differently by host: DeepSeek V4 Flash ranged from 90 percent down to 75 percent on knowledge benchmarks and 81 percent down to 58 percent on tool-calling depending on which provider served it. The failure modes are mostly silent, which is the real hazard: providers dropping images while returning 200 OK, ignoring `reasoning.effort` entirely, leaving raw tool-call markup unparsed, and returning null content with null reasoning and missing usage data as an apparent success. Quantization labels turn out not to predict quality reliably in either direction. His recommendations: check benchmark boards before picking providers, test from production infrastructure rather than a dev machine since IP-based rate limiting makes them behave differently, handle these failures client-side, and never pin a single provider. ([mmoustafa.com](https://mmoustafa.com/blog/so-you-want-to-use-openrouter/))

**OpenAI shipped GPT-Live-1 in the API**, a full-duplex voice model that listens and speaks simultaneously and explicitly delegates deeper reasoning and actions to whatever models and tools you pair it with. Pricing is \$0.05 per minute for the voice layer, billed per second, with backend model and tool usage billed separately, so the headline rate is a floor rather than a total. The architectural choice is the interesting part: rather than one model doing conversation and reasoning, the voice layer is deliberately thin and stateless about the hard work. Same proposer-delegator split showing up as a product boundary.

Source note: [[2026-09-11]]

## 2026-09-10

**A context-efficiency tooling cluster appeared on GitHub trending.** `mksglu/context-mode` (+379 stars) cuts tool output by about 98 percent via MCP, `rtk-ai/rtk` (+192) is a CLI proxy claiming 60 to 90 percent token reduction, `experientiallabs/experiential` (+686) is a multi-model gateway that routes on traffic analysis, and the day's breakout `ayghri/i-have-adhd` (+4,650) exists purely to stop coding agents burying the answer in verbose output. All self-reported numbers. The RTK entry in this cluster was benchmarked the following day and came back negative, which is the reason this whole thread now runs on the calls-output-context test rather than on reduction claims. ([GitHub trending digest](https://startupcorners.com/digest/devtools-digest-2026-09-10))

**DeepSeek retired V4-Pro outright**, rerouting all V4-Pro requests to V4.1-Flash at Flash rates from Sep 14. A lab deprecating its own flagship because the cheap tier beat it is the strongest possible version of the price-per-capability claim.

Source note: [[2026-09-10]]

## 2026-09-08

**Spotify's Portal team published how they cut their own Claude Code token usage by 90 percent**, at 274 points on Hacker News. A Claude Code plugin called "shunt" routes routine reads and predictable code generation to Gemini 2.5 Flash running in two declarative Backstage/Portal modes, bulk-reader and code-writer, enforcing a hard 30-second delegation timeout and explicitly keeping debugging, architecture, and mission-critical reasoning on the frontier model. No new infrastructure, no platform team, just cheap-model routing for the low-stakes 90 percent of calls. Both modes are public via AiKA. A broader search for other cheap-model-routing writeups turned up only generic undated explainer content, so this stands alone rather than being part of a cluster. It is the independently-grounded anchor the whole routing thesis rests on. ([Spotify Engineering](https://engineering.atspotify.com/2026/9/portal-by-spotify-cut-my-claude-code-token-usage-by-90))

Source note: [[2026-09-08]]

## On the radar

- `🟢 ADOPT` **Cheap-model routing (Spotify Portal)**. [[2026-09-11]]
- `🔵 TRIAL` `⚠️` **TypeSafe Jev and the System One decision-model class**, free output because there is none; the advertised 0 percent hallucination rate is schema enforcement, not factual accuracy. [[2026-09-17]]
- `🔵 TRIAL` **Snowflake dynamic model routing**. [[2026-09-16]]
- `🔵 TRIAL` `⚠️` **Cognition SWE-2 selectable reasoning effort**, vendor-reported figures only. [[2026-09-14]]
- `🔵 TRIAL` **Gemini 3.8 Live Extended Thinking**. [[2026-09-16]]
- `⚫ DROPPED` **Terminal-output compression (RTK et al.)**. [[2026-09-11]]
- `⚠️ CAUTION` **Optimising context for economy alone**. [[2026-09-11]]

## Related

[[Topics/Agent Memory and Context Engineering|Agent Memory and Context Engineering]] · [[Topics/Data Platform and Ingestion|Data Platform and Ingestion]] · [[Topics/Cognition|Cognition]] · [[Topics/DeepSeek|DeepSeek]]
