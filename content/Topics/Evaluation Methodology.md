---
type: topic
tags: [topic, evaluation-methodology]
updated: 2026-10-02
living: true
---

# Evaluation Methodology

How model and agent evaluations are built and how far their numbers can be trusted: judge noise, confidence intervals, benchmark reliability, saturation, and evaluator independence.

## Where this stands

The sharpest recent finding is that even a single large language model (LLM) judge pinned to temperature zero is not the reproducible instrument it is treated as. Re-running identical inputs flips about 5% of verdicts on average and about 40% of the close calls that decide leaderboard margins. Two independent groups reached a related conclusion about confidence intervals in the same window: all-pairs leaderboards treat every model comparison as independent evidence when pairs sharing an entry are correlated, and correcting for that on a SWE-bench Verified snapshot more than doubled the interval width. A third paper, BSDProbe, found some widely used benchmarks carry far weaker per-item signal than others, though it tested mostly Qwen models and the finding may not transfer.

That instability is not confined to judges. A self-audit of one author's own evaluation instrument found a ranked leaderboard reliable at the bottom, identifying the worst model consistently, but not at the top, where the middle of the pack reshuffled across most resampled runs. Saturation compounds the problem in the other direction: a benchmark that looks solved can still hide a real gap, as Era by Eon showed by adding one axis of hidden knowledge to an already-saturated question set and reopening a wide gap between nearly-tied models. And the instruments themselves carry demographic bias that looks incidental until measured: Chatbot Arena and OpenAI's SimpleQA both score heavily toward English-speaking, United States (US) and European-weighted knowledge, which one audit frames as a structural validity failure rather than a sampling accident.

Evaluator independence is the harder problem underneath all of this: a credit line naming who ran an evaluation answers whether anyone looked, not whether they were free of the labs' own funding and training data. `jevals` is the one concrete counter-move logged here, replacing a generative judge with a typed, calibrated decision, removing generative variance as a source of noise, though it shipped into a live priority dispute over whether its own mechanism was adequately disclosed. The wider pattern is several independent groups landing on the same conclusions in the same short window: narrow intervals, saturated benchmarks, and judge instability are all more common than assumed, a methodological correction underway rather than one paper's alarm.

## Open questions

- Whether re-judging with multiple judge families and repeated runs becomes standard practice, or stays a research finding nobody operationalizes.
- Whether a genuinely independent evaluator, free of the labs' own funding and training data, exists yet.
- Whether typed evaluators like `jevals` reduce judge noise, or just relocate it into unaudited schema and training-data choices.
- Whether saturation fixes, hidden-knowledge axes, process scoring, harness-validity checks, spread fast enough to keep leaderboards meaningful.

## 2026-10-02

![[2026-10-02#^aa-sonnet-55-cost]]

![[2026-10-02#^judge-first-token]]

![[2026-10-02#^honeybench]]

![[2026-10-02#^redhat-jev-guardrails]]

![[2026-10-02#^metr-testimony]]

![[2026-10-02#^finance-benchmark-haircut]]

![[2026-10-02#^agents-are-systems]]

Source note: [[2026-10-02]]

## 2026-09-29

![[2026-09-29#^pinned-judge-unstable]]

![[2026-09-29#^all-pairs-intervals]]

![[2026-09-29#^bsdprobe]]

![[2026-09-29#^embedded-evaluators]]

![[2026-09-29#^claude-sonnet-55]]

Source note: [[2026-09-29]]

## 2026-09-25

**A self-audit of one author's own evaluation instrument found a leaderboard reliable at the bottom, not at the top.** Testing LLM-based prompt-structure inference across 8 open models from 5 families with caching disabled, mean reproducibility across repeated calls ranged from 0.39 to 0.96, and 72% of model-prompt combinations never produced an identical result twice. A bootstrap resample held the two worst models' rank in 99% and 86% of replicates, but held the middle four models' rank in only 27% to 48%. Four of the eight application programming interface (API) endpoints used were withdrawn within ten weeks, so the study cannot even be rerun as specified. As the author put it: the table identifies the worst model reliably but not the best. [arXiv 2609.30074](https://arxiv.org/abs/2609.30074)

**Era by Eon showed that adding one hidden-knowledge axis reopens a benchmark that looked saturated.** On 27 rule-stated, code-computable questions, the four strongest models with code execution each answered 22 to 25 of 27, barely separating them. Eight added templates instead required facts not explicitly stated in the source documents, and the hardest category, selecting among similar records, produced 1 correct answer out of 84 attempts across every model combined. A saturated score measures what the benchmark was built to separate, not capability in general. [arXiv 2609.30055](https://arxiv.org/abs/2609.30055)

EnigmaForge separated "recognizing the question" from "answering it" as distinct skills and found they barely correlate: across 25 frontier models, scores for solving without being told the question spread 22-fold, while scores for recovering the same puzzles' underlying facts spread only 1.6-fold. Each puzzle's solution is proven unique by a Boolean satisfiability (SAT) solver at generation time, so the set regenerates indefinitely instead of getting memorized. [arXiv 2609.30144](https://arxiv.org/abs/2609.30144)

Source note: [[2026-09-25]]

## 2026-09-23

**"Whose Facts Count?" audited two of the field's most-cited evaluation instruments and found a structural, not incidental, bias.** Chatbot Arena's conversations run 76.3% English against an estimated 25.9% English share of the global internet population. The paper's own 50-item cultural-responsiveness benchmark scored roughly three times better on cultural-responsiveness metrics than OpenAI's SimpleQA. A leaderboard rank built on either instrument is a rank on English-speaking, US- and European-weighted knowledge, not general knowledge. [source](https://arxiv.org/abs/2609.24934v1)

**OSWorld-Pro showed how much of a computer-use score comes from grading only the ending.** It scores more than 2,800 subgoals across 300-plus tasks against human annotations instead of one pass/fail outcome. The same model, Claude Opus 5, dropped from 83.4% on the original outcome-only OSWorld to 75.7% under process scoring, a 7.7-point gap on identical runs. Any score quoted without saying which OSWorld now needs a caveat. [source](https://arxiv.org/abs/2609.24890v1)

GameLogicBench needed deliberately broken reference implementations just to confirm its own grader failed bad submissions, since without them incorrect agent code passed. A harness's own validity has to be checked before its score means anything. [source](https://arxiv.org/abs/2609.21562v2)

**DolphinBench is a framework, not yet a leaderboard, but its design principle travels on its own.** It targets agent memory, scoring a frontier of accuracy, cost and latency together instead of accuracy alone. Its validity rule, running an agent with and without the relevant history and requiring success with it and failure without it, is reusable for anyone building a memory evaluation in-house. [source](https://arxiv.org/abs/2609.24971v1)

Source note: [[2026-09-23]]

## 2026-09-21

**A survey of 14,767 evaluation papers turned judge-model dependence from an anecdote into a measured, four-and-a-half-year trend.** Chao Wang coded every arXiv submission introducing or updating an evaluation resource from January 2022 through August 2026 by staged screening and automated full-text coding. Model-based scoring is growing inside both agent and non-agent benchmark groups, sharpening the question of whether expanding evaluation produces independent evidence or reproduces the preferences of the models doing the judging. [arXiv 2609.19182](https://arxiv.org/abs/2609.19182)

`jevals` answers that dependence directly: it replaces an LLM judge with a typed, calibrated decision, shipped the same weekend a priority dispute broke out over the underlying decision-model mechanism. A researcher published a March 2025 paper making a similar non-autoregressive, reinforcement-learning-trained claim, objecting as much to the vendor's lack of a technical paper, open weights, or open training data as to priority itself. A typed decision removes generative variance as a source of judge noise, but only if its own training and evaluation are disclosed, which this dispute says did not happen.

Source note: [[2026-09-21]]

## On the radar

- `⚠️ CAUTION` **A pinned, temperature-zero LLM judge treated as a reproducible instrument**, cloud-serving nondeterminism flips verdicts on re-run, so one- or two-place leaderboard gaps from a single judged run are noise. [[2026-09-29]]
- `⚠️ CAUTION` **Unverified lab capability claims**, "check what the claimant checked against," not just whether the answer verifies internally. The Cyphral Distich refutation is the worked example; TypeSafe AI's Jev carries a prior-art claim, and MiMo-V2.6's entire benchmark table is the vendor's own with no third-party citation, where an independent measurement arrived within a day and is the fix. [[2026-09-11]], escalated [[2026-09-15]], third instance [[2026-09-21]], fourth instance [[2026-09-22]]

## Related

[[Topics/AI Research Provenance Disputes|AI Research Provenance Disputes]] · [[Topics/Jev and Decision Models|Jev and Decision Models]] · [[Topics/AI Safety and Interpretability|AI Safety and Interpretability]]
