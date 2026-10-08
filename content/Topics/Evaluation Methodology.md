---
type: topic
tags: [topic, evaluation-methodology]
updated: 2026-10-08
living: true
---

# Evaluation Methodology

How model and agent evaluations are built and how far their numbers can be trusted: judge noise, confidence intervals, benchmark reliability, saturation, and evaluator independence.

## Where this stands

Evaluation numbers are noisier and less independent than leaderboards imply, and this week added more evidence from several directions. A pinned, temperature-zero large language model (LLM) judge flips about 5% of verdicts on re-run, and about 40% of the close calls that decide leaderboard margins, because cloud serving is nondeterministic. A related artifact: reading a judge's first token inflates its measured position bias, flipping verdicts on swapped responses 89.7% of the time against 47.5% when read after generation, while accuracy barely moves. A new study of 17 open-weight judges also found that agreement with humans on summary quality hides which cases each side finds hard.

Interval and benchmark problems compound this. Two groups argue agent-leaderboard confidence intervals are too narrow, and correcting for shared entries more than doubled the width on a SWE-bench Verified snapshot. A preprint found membership-inference attacks top out at an area under the curve of 0.68 on a confounder-controlled benchmark, so black-box contamination checks on closed models are weak evidence. A practitioner essay haircuts the top finance-agent score from 82% to about 57%, since pre-parsed inputs alone inflate one benchmark by 19 to 29 points. In an 18,000-trajectory study, about 54% of outcome variance came from re-running identical configurations, so single runs say little.

Vendor-reported figures keep failing independent checks. Artificial Analysis contradicted Anthropic's claim that Claude Sonnet 5.5 is cheaper per task and scored Terminal-Bench 4.0 at 64% against Anthropic's 70.6%. Red Hat's guardrail benchmark found Jev, a small decision model, no more accurate than ordinary classifiers. Some lab-sourced figures arrive with no method: METR's Senate testimony relays lab self-reports, including a claim that internal frontier runs lead public ones by two months. Arena's text-to-image post trains on its own leaderboard data and reports gains on that leaderboard. Evaluator independence remains the hardest layer, since a credit line shows who looked and not who funded them.

## Open questions

- Will re-judging with several judge families and repeated runs become standard practice, or stay a research finding?
- Does a genuinely independent evaluator, free of lab funding and training data, exist yet?
- Do typed evaluators such as `jevals` reduce judge noise, or move it into unaudited schema and training-data choices?
- Will fixes for saturation, such as hidden-knowledge axes, process scoring and harness-validity checks, spread fast enough to keep leaderboards meaningful?
- Does the first-token artifact in judge models appear outside the Qwen3 family?
- What method produced METR's two-month lead figure for internal frontier runs?
- With membership inference this weak, what replaces black-box contamination checks for closed models?

## 2026-10-08

![[2026-10-08#^epoch-innovationeval]]

![[2026-10-08#^arena-self-preference]]

![[2026-10-08#^openai-math-withdrawals]]

![[2026-10-08#^metr-inspect-viewer]]

![[2026-10-08#^skill-placebo]]

![[2026-10-08#^tool-failure-studies]]

Source note: [[2026-10-08]]

## 2026-10-05

![[2026-10-05#^olmo-detect-mia]]

![[2026-10-05#^judge-hardness]]

![[2026-10-05#^evals-cautions]]

Source note: [[2026-10-05]]

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
