---
type: topic
tags: [topic, cognition]
updated: 2026-09-16
living: true
---

# Cognition

The coding-agent company behind Devin, tracked because it is the one agent category with unambiguous enterprise revenue attached and because its technical output keeps landing in other threads here.

## Where this stands

Cognition is the cleanest financial evidence that coding agents are a real business: run-rate revenue went from \$492M in May to nearly \$900M by September, and the company raised \$2B at a \$48B valuation, nearly double its \$26B mark four months earlier.

Technically it shows up in two places. SWE-2 is the strongest data point for the cheap-model-routing thesis, with selectable reasoning effort cutting average steps from 127 to 53 at medium effort. And the RSA-260 factorization is a genuine milestone with an asterisk Cognition raises itself: Devin agents did much of the optimization work, which raises real questions about human understanding of the underlying mathematics.

Every performance figure in this topic is Cognition's own. Independent evaluation has not been published for any of it.

## Open questions

- No independent eval of SWE-2's FrontierCode parity or cost claims exists.
- The RSA-260 asterisk is unresolved: if agents did the optimization and humans do not fully understand it, what is the status of the result as mathematics rather than as a computation?
- Revenue nearly doubled in four months on figures the company reports to investors. Nothing here is audited.

## 2026-09-14

**SWE-2 is the strongest data point yet for the cheap-model-routing thesis, and it comes from a vendor with skin in the game rather than a benchmark shop.** Released Sep 10, post-trained from Moonshot's Kimi K3 (2.8T parameters), scoring **50.0 percent on FrontierCode 1.1 Main**. Cognition claims parity with Fable 5.1 at **64 percent lower cost**, and roughly a quarter the cost of GPT-6 Astra. The mechanism is the part that matters: it is Cognition's first model with **selectable reasoning-effort levels** (medium, high, max), all trained in a single RL run, and medium effort cut average FrontierCode steps from **127 to 53** while costing 81 percent less than SWE-1.7. Fewer steps at lower cost with held accuracy is a different claim from "cheaper tokens." It is the model deciding how hard to try, which is the same proposer-delegator split showing up as a knob instead of an architecture. All figures are Cognition's own. Available in Devin Desktop and CLI, rolling into Devin Web and Fusion. ([MarkTechPost](https://www.marktechpost.com/2026/09/12/cognition-releases-swe-2-a-kimi-k3-post-trained-coding-model-that-matches-fable-5-1-on-frontiercode-at-64-lower-cost/), [AlphaSignal](https://alphasignal.ai/news/cognition-s-swe-2-beats-gpt-5-6-sol-at-64-lower-cost))

Source note: [[2026-09-14]]

## 2026-09-10

**Cognition published the full writeup of its RSA-260 factorization, a genuine milestone with a real asterisk.** Eric Lu factored the 260-digit (862-bit) RSA Challenge number that had stood since 1991, the largest ever cracked, beating RSA-250 (829-bit, February 2020). The method was a new GPU implementation of the general number field sieve: **Devin agents rewrote most of CADO-NFS for GPUs**, including a new lattice siever called `glas`. Total cost was about **4,900 GPU-days** (13.5 GPU-years, roughly \$400k at market rates), **10x cheaper than prior state of the art**, run on spare cluster capacity as a side project with up to 18 concurrent Devin sessions over three weeks.

The crypto implications are deliberately undramatic and stated so in the post: hyperscalers could plausibly do RSA-1024 at about \$30M per number, but RSA-1024 has been considered insecure since the mid-2000s, and RSA-2048 remains roughly a billion times harder and is not meaningfully affected. **The asterisk is Cognition's own:** Devin did much of the optimization work, which raises real questions about human understanding of the underlying mathematics. The initial single-factor announcement was Sep 3; this was the detailed writeup. 118 points on Hacker News. ([Cognition](https://cognition.com/blog/factoring-rsa-260), [Scientific American](https://www.scientificamerican.com/article/whats-the-tech-behind-the-record-breaking-rsa-260-crack/))

Source note: [[2026-09-10]]

## 2026-09-09

**Cognition closed \$2B at a \$48B valuation**, led by a16z with Accel, Founders Fund, General Catalyst, and Avenir. That is nearly double the \$26B mark from four months earlier, and the company reportedly saw about \$10B of investor interest for the round. The number that actually justifies it: **run-rate revenue went from \$492M in May to nearly \$900M** by this announcement. Coding agents are the one agent category with unambiguous enterprise revenue attached, and this is the cleanest evidence of it. ([Bloomberg](https://www.bloomberg.com/news/articles/2026-09-08/ai-startup-cognition-raises-2-billion-at-a-48-billion-value))

Source note: [[2026-09-09]]

## On the radar

- `🔵 TRIAL` `⚠️` **Cognition SWE-2 selectable reasoning effort**, vendor-reported figures only. [[2026-09-14]]

## Related

[[Topics/Token Cost and Model Routing|Token Cost and Model Routing]] · [[Topics/Agentic SDLC Governance|Agentic SDLC Governance]] · [[Topics/AI Research Provenance Disputes|AI Research Provenance Disputes]]
