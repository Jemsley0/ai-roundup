---
type: topic
tags: [topic, deepseek]
updated: 2026-09-16
living: true
---

# DeepSeek

DeepSeek's V4.1 Flash line, the architectural bet behind it, and the price-per-capability move that led the lab to deprecate its own flagship.

## Where this stands

V4.1 Flash is at trial on the radar and has been since it went GA on Sep 10. The corroborating fact is stronger than any benchmark: DeepSeek retired V4-Pro and rerouted its traffic to the Flash tier at Flash rates, which is a lab saying its cheap model beat its expensive one with its own pricing rather than a press release. Independent evaluation is still wanted before anything stronger.

Two things complicate the picture. A joint NSA, CISA, and FBI advisory named DeepSeek among six Chinese labs alleged to have conducted targeted distillation against US frontier models since late 2024, which moves distillation from a terms-of-service dispute to a state-attributed activity. And separately, the OpenRouter analysis found identical DeepSeek weights performing between 81 percent and 58 percent on tool-calling depending on which provider served them, so a DeepSeek evaluation is really an evaluation of a model plus a host.

## Open questions

- No independent eval of the V4.1 Flash agentic and coding claims has been published.
- The Causal Encoder-Decoder design with roughly 8B active input parameters and 16B active output parameters is unusual and undiscussed outside DeepSeek's own materials. Nobody has written up why it works.
- Provider variance means benchmark numbers are close to meaningless without naming the host. Nobody publishes host alongside score.

## 2026-09-10

**DeepSeek shipped V4.1 Flash to GA, and the architecture is more interesting than the beta coverage suggested.** It is a **552B-parameter MoE on a new Causal Encoder-Decoder design** with only about **8B active parameters for input and 16B for output**, and it is DeepSeek's first natively multimodal model, with text and image in and out from the factory rather than adapters bolted on. Throughput hit **420 tok/s peak** on long-text reasoning, 409.5 end-to-end. On several agentic and coding benchmarks it lands ahead of or near GPT-5.6 Sol and Claude Opus 5.

**DeepSeek retired V4-Pro outright.** From Sep 14, all V4-Pro requests reroute to V4.1-Flash at Flash rates. A lab deprecating its own flagship because the cheap tier beat it is the strongest possible version of the price-per-capability claim, and it is a shipped fact rather than a beta assertion. ([Neowin](https://www.neowin.net/news/deepseek-launches-v41-flash-multimodal-reasoning-model/), [benchmarks and pricing](https://officechai.com/ai/deepseek-v4-1-flash-benchmarks-pricing/), [DeepSeek changelog](https://api-docs.deepseek.com/updates/))

Source note: [[2026-09-10]]

## 2026-09-09

**DeepSeek opened a two-day internal beta for V4.1 Flash ahead of the Sep 10 launch, claiming it beats V4 *Pro* while priced as a Flash model.** The interesting part was architectural rather than the benchmark: a ground-up restructure with native multimodal support, text, image, and audio processed in a unified way, rather than bolted-on adapters. New Flash pricing from Sep 10: **\$0.15/M input on cache miss, \$0.003/M on cache hit, \$0.60/M output off-peak, double at peak.** 280 points on Hacker News. ([HN](https://news.ycombinator.com/item?id=49624603))

**NSA, CISA, and the FBI issued joint advisory AA26-251A** alleging DeepSeek, Moonshot AI, Alibaba, MiniMax, StepFun, and Z.AI have conducted aggressive, targeted model distillation against US frontier models since late 2024, extracting billions of tokens. Naming six Chinese labs in a formal US cyber advisory is an escalation in kind rather than degree, moving distillation from a terms-of-service dispute to a state-attributed activity. Read directly against the V4.1 Flash item above. ([CISA](https://www.cisa.gov/news-events/cybersecurity-advisories/aa26-251a))

Source note: [[2026-09-09]]

## Also mentioned

- **[[2026-09-16]]** and **[[2026-09-15]]**: V4.1 Flash (Sep 10) remains one of the two most recent text-model entries on llm-stats, which has logged nothing since Sep 11. SemiAnalysis used DeepSeek V4 Pro as the workload for its Vera Rubin NVL72 efficiency measurement.
- **[[2026-09-11]]**: the OpenRouter writeup found DeepSeek V4 Flash ranging from 90 percent down to 75 percent on knowledge benchmarks and 81 percent down to 58 percent on tool-calling depending on the serving provider.
- **[[2026-09-16]]**: DeepSeek was among the six model families tested in Emergence AI's eight-world multi-agent containment study, all of which failed.

## On the radar

- `🔵 TRIAL` **DeepSeek V4.1 Flash**. [[2026-09-10]]

## Related

[[Topics/Token Cost and Model Routing|Token Cost and Model Routing]] · [[Topics/GPT-6 Astra|GPT-6 Astra]] · [[Topics/AI Safety and Interpretability|AI Safety and Interpretability]]
