---
type: topic
tags: [topic, ai-led-ai-development]
updated: 2026-09-21
living: true
---

# AI-Led AI Development

Models performing the research, engineering, and infrastructure work that produces the next model. Tracked as a measurement problem rather than as a prediction: what has been quantified, by whom, and against what method.

## Where this stands

This became its own page on 2026-09-18 because two independent, quantified accounts arrived in the same 48 hours, from labs on opposite sides of the chip-export line, saying the same thing from different directions. Before that the thread existed only as assertion: Amodei's essay claiming recursive self-improvement had accelerated "since roughly this summer," and Coxon's resignation claiming both his former employers were racing towards self-improving superintelligence. Neither came with a number.

Anthropic supplied the number and, more usefully, a method. Its R&D Automation Index decomposes the company's own engineering work into a task tree, scores each leaf on a published AL0-to-AL5 automation scale, and weights by person-time. As of Aug 2026, Claude leads 26 percent of Anthropic's AI research and development, where "leads" means completing most of a task end-to-end from a high-level prompt under human supervision. More than 90 percent of the work reaches collaborate-or-higher. Nothing is fully autonomous. The 26 percent figure was effectively zero in Feb 2026, which is the part that matters: a standing measurement is only interesting once it has a second reading, and this one already has a trajectory.

Z.ai's account is the same phenomenon in production rather than in research. It reports building a complete inference service for GLM-5.3-Flash on a cluster of more than 100,000 Chinese-made accelerators, going from model adaptation to production in under two weeks with end-to-end throughput rising 3.2x, and says much of the optimisation work normally done by senior infrastructure engineers was carried out by an "Infra Agent" powered by GLM-5.3 itself. All production inference for that model now runs on the result. The figures are Z.ai's own and unaudited.

The third data point is not from a lab at all, and it is the one that constrains how much comfort to take from the first two. In Hacktron's disclosed chain into OpenAI's internal repositories, Claude Opus 5 analysed an unfamiliar heap-overflow bug, produced a working ARM64 exploit in about three hours, adapted it to a different architecture and allocator, and operated in a goal-directed loop to reach remote code execution. That is the same capability class, exercised by outside researchers on a target that had not consented in advance, and nobody is publishing an automation index for it.

What this page cannot yet say is whether any of this is compounding. Two labs reporting that models do a lot of their engineering is not evidence that the models are getting better at doing it faster, and only Anthropic has committed to a method that could show the difference.

As of 2026-09-21 this thread has its first third-party measurement rather than a self-report. AI-generated code reached 17.25 percent of Linux kernel patches in September, on the Lunduke Journal's own counting, against roughly 8 percent in June and effectively zero in early February. The classification method is unpublished, so the level is soft, but the slope is the informative part and the venue is what makes it worth logging: a project with adversarial review, no deadline, no commercial reason to accept agent output, and maintainers who have publicly rejected agent-written patches.

That sharpens the gap already standing on this page. Anthropic's 26 percent and Z.ai's Infra Agent result both measure a lab's model working on the lab's own product. This measures uptake in a hostile venue. Neither measures whether the work was good, and nobody has paired any of the three with a revert, defect or rework rate.

## Open questions

- The Lunduke counts have no published classification method, so the 17.25 percent figure cannot be audited or reproduced. Whether "AI-generated" means a declared trailer, a maintainer's judgement, or a heuristic is unstated.
- Nobody has published an acceptance-to-revert ratio for AI-generated kernel patches, which is the one number that would separate uptake from churn in the clearest available venue.
- Anthropic's 26 percent went from effectively zero in six months. There is no stated republication cadence, so it is currently a trajectory of two points with no promise of a third.
- An automation level measures how much work a model leads, not whether the output was good. Nobody has paired an automation index with a rework, defect, or revert measure, which is what would distinguish acceleration from churn.
- Z.ai's Infra Agent result and Anthropic's index measure different things (production optimisation versus research task coverage) and neither maps onto the other. There is no shared unit for this thread.
- Both published accounts are self-reported by the lab whose model is the subject. No third party has independently measured how much of any lab's engineering work its own model performs.
- The Opus 5 exploit result shows the capability exists outside a lab's own oversight envelope. No lab has published what its monitoring does when that capability is exercised without a research pretext.
- If a model's contribution to its successor is mostly infrastructure and tooling rather than research insight, the ceiling is very different from the one the recursive-self-improvement framing implies. Nothing published separates the two.

## 2026-09-21

**AI-generated code reached 17.25 percent of all Linux kernel patches in September, with 1,634 AI-written submissions in a single week.** The figures are the Lunduke Journal's own counts drawn from submission metadata, posted Sep 20. The same source recorded roughly 8 percent in June 2026 and effectively zero in the first week of February 2026, which is a trajectory rather than a snapshot. The absolute percentage depends entirely on how a patch is classified as AI-generated and the source has not published that method, so treat the level as soft and the slope as the finding.

The reason it belongs on this page rather than in general practitioner coverage is what the kernel is as a test case. Every other data point in this thread is a lab measuring its own model's contribution to its own work: Anthropic's 26 percent, Z.ai's Infra Agent result. This is a third-party count against a project with adversarial review, no product deadline, no commercial incentive to accept agent output, and maintainers who have publicly rejected agent-written patches. The share still moved from nothing to roughly a sixth of all submissions in seven months. What it does not measure is whether the patches were good, which is the same gap that sits under every other measurement here: an acceptance count is not a quality measure, and nobody is pairing either one with a revert or defect rate. ([Lunduke Journal](https://lunduke.substack.com/p/ai-generated-patches-to-linux-kernel))

Source note: [[2026-09-21]]

## 2026-09-18

**Anthropic published real internal numbers on how much of its own research Claude runs, with the methodology attached.** Three measurements are proposed for tracking development pace inside frontier labs: how much AI research and development is performed by AI itself, how well the actions of AI agents are overseen, and how compute is allocated.

The first is an R&D Automation Index. Researchers sampled 20 percent of staff weekly through Jul 2026 and used Slack and internal documentation to identify roughly 15,000 granular tasks, organised into a hierarchical tree of 542 nodes and 378 leaf categories. Each task is scored on an automation level from AL0 (no AI involvement) to AL5 (fully autonomous), where AL3 means the model collaborates and AL4 means the model leads while a human supervises. Scores are weighted by person-time, so categories consuming more staff hours count for more. As of Aug 2026, Claude leads 26 percent of Anthropic's AI research and development, more than 90 percent of the work reaches collaborate-or-higher, and nothing is at AL5. The 26 percent figure was effectively zero in Feb 2026.

The oversight measurement: 100 percent of roughly 30,000 agents' actions are monitored both in real time and after the fact, 0.002 percent of decisions are blocked (about 1 in 47,000), and 1 to 2 transcripts per 1,000 are escalated for human review. On compute, for the week of Jul 13 to Jul 20, roughly 6 percent of AI research and development compute went to safety work, rising to 12 percent within AI-driven research specifically.

Anthropic states its own limitations plainly: judge models can replicate their own errors, agent monitoring only spans months rather than years, classifying safety versus capability work is inherently ambiguous, the figures are one-week snapshots, and the compute numbers track efficiency gains as much as effort. It also commits to embedding independent third-party evaluators from multiple organisations with access comparable to internal risk teams, with no date attached. [Anthropic](https://www.anthropic.com/institute/measuring-pace-of-ai-development)

**Z.ai published a technical account of building a production inference stack on more than 100,000 Chinese-made accelerators, largely by agent.** The build went from initial model adaptation to production readiness in under two weeks, with end-to-end throughput rising 3.2x from the initial baseline, reaching hardware utilisation and per-token cost the company describes as comparable to mainstream NVIDIA GPUs. Z.ai says no one had previously run a cluster of Chinese-made accelerators at this scale. The obstacles it names are specific: limited on-chip memory capacity and bandwidth, a new model architecture, a 1M-token context window, multimodal requests, and an immature ecosystem where kernel support was incomplete and engineers had to guess at undocumented behaviour. Much of the optimisation work normally done by senior infrastructure engineers was carried out by an "Infra Agent" powered by GLM-5.3, and all production inference for GLM-5.3-Flash now runs on the result. All figures are Z.ai's own. Two claims in one post, and they should be assessed separately: the compute-independence claim belongs to [[Topics/Sovereign AI Compute|Sovereign AI Compute]], and the agent claim belongs here. [Z.ai](https://z.ai/blog/glm-built-its-inference-infrastructure)

**Claude Opus 5 wrote a working exploit for an unfamiliar target in about three hours, in Hacktron's disclosed chain into OpenAI's internal repositories.** Opus 4.8 analysed the vulnerable libheif code first; Opus 5, released mid-investigation, produced a working ARM64 exploit for a local Mac within three hours, then adapted it to the target's x86-64 environment with jemalloc, and operated autonomously in a goal-directed loop to reach remote code execution. Discovery to proof-of-concept repository access took under 72 hours. Why it belongs on this page: it is the only quantified capability data point in this thread measured by someone other than the model's own vendor. [Hacktron](https://www.hacktron.ai/blog/hacking-openai)

Source note: [[2026-09-18]]

## 2026-09-14

**Amodei's "We Must Pace the Frontier" named recursive self-improvement as one of two things that changed his position.** The essay states that recursive self-improvement has accelerated "since roughly this summer," with models materially helping build their successors faster than humans can monitor. The second factor was the OpenAI and Hugging Face agent-swarm incident, which he treats as an industry-wide warning rather than a competitor's problem. The quotable line: "in 6-12 months such a swarm could be capable of taking over the entire internet with a persistent botnet (potentially causing hundreds of billions of dollars in damage)." He also inverts his own prior position, arguing that slowing down used to look pointless to him but that current models are "an almost endless gold mine of insight" for safety research, so there is something to do with the time. No measurement accompanied the claim, which is what makes the Sep 17 index publication a change in kind rather than degree. [darioamodei.com](https://darioamodei.com/post/we-must-pace-the-frontier)

Source note: [[2026-09-14]]

## 2026-09-09

**A pretraining researcher resigned publicly over self-improving AI and said the industry is "gambling with our lives."** Jacob Coxon, who spent three years across OpenAI and Anthropic, made a specific claim rather than an atmospheric one: both labs are racing to self-improving superintelligence, the people building it "earnestly believe it could kill us all by the end of the decade," and he told the Wall Street Journal "by the end of next year things could be out of control already." He described Anthropic's safety efforts as earnest but concluded no company can responsibly build artificial general intelligence absent government intervention or a coordinated industry slowdown, and called for a temporary capability freeze plus inter-lab pacing agreements. Separately, Anthropic alignment lead Evan Hubinger put his personal extinction estimate above 10 percent within the decade. [TechCrunch](https://techcrunch.com/2026/09/09/gambling-with-our-lives-anthropic-researcher-quits-warns-against-self-improving-ai/)

Source note: [[2026-09-09]]

## On the radar

- `🔵 TRIAL` **Anthropic R&D Automation Index**, a task tree scored on an AL0 to AL5 automation scale and weighted by person-time. [[2026-09-18]]
- `🟡 ASSESS` **Interpretability lagging capability**, one cumulative entry, eleven data points. [[2026-09-21]]

## Related

[[Topics/AI Safety and Interpretability|AI Safety and Interpretability]] · [[Topics/Agentic SDLC Governance|Agentic SDLC Governance]] · [[Topics/Sovereign AI Compute|Sovereign AI Compute]]
