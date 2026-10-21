---
type: topic
tags: [topic, cognition]
updated: 2026-10-17
living: true
---

# Cognition

The coding-agent company behind Devin, tracked because it is the one agent category with unambiguous enterprise revenue attached and because its technical output keeps landing in other threads here.

## Where this stands

Cognition is the cleanest financial evidence that coding agents are a real business: run-rate revenue went from \$492M in May to nearly \$900M by September, and the company raised \$2B at a \$48B valuation, nearly double its \$26B mark four months earlier. Every performance figure in this topic is Cognition's own, the revenue is reported to investors and unaudited, and independent evaluation has not been published for any of it.

Technically it shows up in three places. The SWE-2 selectable reasoning effort claim, which cut average steps from 127 to 53 at medium effort, was the strongest data point for the cheap-model-routing thesis, and the radar dropped it on October 17, 2026 after 33 days with no independent measurement. The RSA-260 factorization is a genuine milestone with an asterisk Cognition raises itself: Devin agents did much of the optimization work, which raises real questions about human understanding of the underlying mathematics. The newest thread is agent memory. Cognition's Agent Memory Repo, published on October 4, 2026, stores memory as a git repository of linked Markdown loaded through a short `MEMORY.md`, with a periodic "Dreaming" agent that merges duplicates and removes stale entries. It grew from 664 GitHub stars on October 9 to 755 on October 12, and supermemory shipped an implementation on Cloudflare Durable Objects on October 6. Victor Taelin's OptChat summary tree reached at least five ports in eight days, and neither design has a task-quality measurement.

Cognition also sits inside the evaluation layer. Artificial Analysis's FrontierCode 1.1 (October 12) is a private 100-task board built with Cognition that grades whether a maintainer would merge the change, and Claude Opus 5.5 leads at 52%, with nine models between 43% and 52% and an LLM review inside the verifier. A board built with a company that sells coding agents is a relationship worth reading beside the result. The memory repo still has no figure at all, only stars.

## Open questions

- With SWE-2 dropped from the radar, does Cognition or anyone else publish an independent eval of its cost or FrontierCode parity claims?
- The RSA-260 asterisk is unresolved: if agents did the optimization and humans do not fully understand it, what is the status of the result as mathematics rather than as a computation?
- Revenue nearly doubled in four months on figures the company reports to investors. Nothing here is audited.
- Does anyone publish a benchmark of the Agent Memory Repo? The October 9, 2026 note says nothing shows the Dreaming cleaner works.
- Do the Agent Memory Repo and the OptChat summary tree outperform compaction on task quality, or do they win only on adoption?
- Does the git merge-conflict rule, where "git rejects the second push", hold up when several agents write the same repository?
- What was Cognition's role in building FrontierCode 1.1, and does Artificial Analysis publish how much of the verifier is LLM review?

## 2026-10-17

![[2026-10-17#^evals-frontiercode]]

![[2026-10-17#^radar-swe2-dropped]]

Source note: [[2026-10-17]]

## 2026-10-12

![[2026-10-12#^agent-optchat-memory]]

Source note: [[2026-10-12]]

## 2026-10-09

![[2026-10-09#^agent-memory-repo]]

![[2026-10-09#^radar-agent-memory-repo]]

Source note: [[2026-10-09]]

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

- `🟡 ASSESS` **Agent Memory Repo (Cognition)**, agent memory as a git repository of linked Markdown with a periodic merge-and-prune agent; no benchmark yet. [[2026-10-09]]
- `🟡 ASSESS` **Summary-tree memory view (OptChat recipe)**, one endless chat remembered through a binary tree of summaries, no task-quality measurement. [[2026-10-12]]
- `⚫ DROPPED` **Cognition SWE-2 selectable reasoning effort**, vendor-reported figures only, no independent measurement in 33 days. [[2026-09-14]], removed [[2026-10-17]]

## Related

[[Topics/Token Cost and Model Routing|Token Cost and Model Routing]] · [[Topics/Agentic SDLC Governance|Agentic SDLC Governance]] · [[Topics/AI Research Provenance Disputes|AI Research Provenance Disputes]]
