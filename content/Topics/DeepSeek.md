---
type: topic
tags: [topic, deepseek]
updated: 2026-10-05
living: true
---

# DeepSeek

DeepSeek's V4.1 Flash line, the architectural bet behind it, and the price-per-capability move that led the lab to deprecate its own flagship.

## Where this stands

V4.1 Flash stays at trial. The strongest evidence is still DeepSeek's own pricing move: it retired V4-Pro and rerouted that traffic to the Flash tier at Flash rates. This week the legacy `deepseek-v4-flash` model name began routing silently to a newer model at Flash pricing, so any pin on that name no longer holds. Independent evaluation of the Flash line is still missing.

Pricing power is the second thread. DeepSeek's chief executive disclosed an annualized revenue run rate near \$1B, roughly double the prior figure, after an August price increase of 2.3x to 4.5x with no measurable demand drop. That shows the opposite lever to the Flash-over-Pro cut also works. The figures are self-disclosed at an investor meeting and unaudited, ahead of a \$7.5B raise and a planned Shanghai listing.

Two complications remain. A joint US advisory from the National Security Agency, the Cybersecurity and Infrastructure Security Agency, and the Federal Bureau of Investigation named DeepSeek among six Chinese labs alleged to have run targeted distillation against US models. An OpenRouter analysis also found identical DeepSeek weights scoring between 58 and 81 percent on tool calling depending on the host, so any evaluation covers a model plus a host.

## Open questions

- No independent evaluation of the V4.1 Flash agentic and coding claims has been published.
- Nobody has written up why the Causal Encoder-Decoder design, with roughly 8B active input parameters and 16B active output parameters, works.
- Benchmark scores mean little without the host named, and nobody publishes the host beside the score.
- Does DeepSeek's pricing power hold as more open-weight competition arrives, or is the August increase a temporary window?
- Does the Shanghai listing bring audit requirements that test the \$1B run rate and the price-increase claims?
- Is the silent re-pointing of `deepseek-v4-flash` a one-off, or the lab's standard way to retire a model name?

## 2026-10-02

![[2026-10-02#^deepseek-flash-repoint]]

Source note: [[2026-10-02]]

## 2026-09-25

**DeepSeek's annualized revenue hits roughly \$1B, driven by API price hikes, ahead of a \$7.5B raise and a planned Shanghai listing.** CEO Liang Wenfeng disclosed at an investor meeting that DeepSeek's annualized revenue run rate doubled to roughly \$1B (from roughly \$500M), attributed to a price increase last month (August 2026) that raised API fees 2.3x to 4.5x with no measurable demand drop. The company is finalizing a \$7.5B funding round ahead of a planned Shanghai Stock Exchange listing. This is real evidence of pricing power in an ostensibly commodity, price-competitive open-weight-adjacent model business. DeepSeek was able to raise prices sharply without losing customers. ([Dealroom](https://dealroom.co/news/info-1jq5etc-deepseeks-annualized-revenue-hits-1-billion-as-startup-finalizes-7-5-bil/), [PYMNTS](https://www.pymnts.com/news/artificial-intelligence/2026/deepseek-doubles-annual-revenue-run-rate-to-1-billion-ahead-of-ipo/))

Source note: [[2026-09-25]]

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

[[Topics/Token Cost and Model Routing|Token Cost and Model Routing]] · [[Topics/GPT-6 Astra|GPT-6 Astra]] · [[Topics/AI Safety and Interpretability|AI Safety and Interpretability]] · [[Topics/Frontier Lab Economics|Frontier Lab Economics]]
