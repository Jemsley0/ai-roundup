---
type: topic
tags: [topic, evaluation-methodology]
updated: 2026-11-16
living: true
---

# Evaluation Methodology

How model and agent evaluations are built and how far their numbers can be trusted: judge noise, confidence intervals, benchmark reliability, saturation, and evaluator independence.

## Where this stands

Evaluation numbers are noisier and less independent than leaderboards imply, and this week added two vendor-claim checks and two attacks on the measuring instruments. A pinned, temperature-zero large language model (LLM) judge flips about 5% of verdicts on re-run, and about 40% of the close calls that decide leaderboard margins, because cloud serving is nondeterministic. Preprints report the same noise from other angles: TRACE found identical reruns flipped 15 to 36% of outcomes, one study found the most consistent judge agrees with ground truth 51% of the time, and Evalship saw 2.5% of passing evals fail on the next run. Xie and Alanwar say reshuffling batch composition flips 11% to 22% of verdicts. A preregistered study (arXiv 2610.13303) found that rewriting a judge's rubric raised agreement between judges but not agreement with humans, and Asgari and colleagues find rubric content moves the pass rate of correct outputs from 2% to 100% with the judge held fixed. None is replicated, and several are abstract-level reads. The radar holds the pinned-judge caution as a standing item.

The newest items add evidence that judges miss real failures and that leaderboards can be gamed. Sungbin Im says on tau2-bench an LLM judge agreed with native scoring 56.2% of the time and passed 10 to 11 of 11 forbidden database writes that a model-free boundary check caught (single author, abstract only). Fleisig and co-authors say strategic voting, prompting and nomination can lift a model up to 45 places on a Bradley-Terry arena leaderboard, and a second paper finds the "both are bad" share for unchanged pairs rose about 1.71 points a month across 1.26 million Chatbot Arena votes. Both are abstracts with no independent response. Earlier findings point the same way: CXBench's authors find 55.5% of 840 regulated customer-service agent runs are false passes, and a dermatologist's independent test showed a fine-tuned 2015 convolutional neural network wrongly discharging 18 of 30 melanomas at its preset threshold, against 3 and 4 for the frontier models, while looking worse on first-choice accuracy. IronBee shows each F2 interval on a code-review benchmark is 4 to 10 points wide, "wider than the gaps", and membership-inference attacks top out at an area under the curve of 0.68, so black-box contamination checks on closed models are weak evidence.

A vendor claim failed a first-party check this week. Google says Gemini 4 Hydrogen "ties for #1" on the Vals Legal Research Bench at 55.8%, but Vals's November 11 board lists it sixth at 53.85%, and the 55.77% figure belongs to Gemini 4 Carbon. Google's Vals Tax Agent Bench (52.3%) and Artificial Analysis (51 high, 54 extra high) figures check out. Other vendor figures keep arriving with no method. Databricks says agent-written Spark Declarative Pipelines used about 34 times less compute across 528 builds, yet its own table shows more silent wrong-output bugs (85 of 264 against 73 of 264) and 2.3 times higher token cost. Laminar says its flow-1 model "matches GPT-6-sol in detection quality while being 23x cheaper", while its own table shows a tie with Claude Sonnet 5 and a trail behind Claude Opus 5 on 523 traces Laminar chose. Graphify's "best recall of any system tested" covers only systems it chose, and the radar watches Laminar and holds the leanrea self-run benchmark at assess. A single placebo-controlled test found only 2 of 9 popular coding skills beat neutral text of the same length, and the radar moved it again on November 16.

Judge and evaluator independence remains the sharper problem. Arena says LLM judges pick their own answer 58% of the time against 34% for humans, and Arena sells human-preference data. The HealthBench Professional board shows the same shape: OpenAI built the benchmark and OpenAI models grade it, and Claude Opus 5.5 falls from first to sixth after the length adjustment. METR says Anthropic's covert-capability benchmarks are "a poor proxy" for evading Anthropic's own monitoring, found about ten gaps in OpenAI's internal misalignment monitor, and found an agent could alter the transcript a reviewer sees in the Inspect viewer, so evaluation tooling is itself security infrastructure. Strict credit and benchmark defects widen the same gap: ViBench 2.0 has top models passing up to 98% of test plans but delivering a working product in at most 65% of builds, and an audit found issues in about 30% of Terminal-Bench 2.0 tasks.

Leaderboard method now moves ranks as much as models do. Artificial Analysis Intelligence Index v5 (October 27) is 60% private-test evaluations and widened the open-weights gap from 3 to 12 points on a method change, so the radar holds a composite rank as an unstable selection signal. Its Decision Index v2 (November 8) is 45% private datasets, which should make it harder to tune against, though Perplexity's Decider v1.3 names the index and reports no score. Nathan Lambert, who builds open models, says private sets end community bug-finding and notes that Artificial Analysis earns revenue from the labs it evaluates. Epoch AI moved its Capabilities Index to a Bayesian model and says GPT-6 Astra has a 72% chance of beating Claude Opus 5.5, with the 90% interval on the gap running from -0.9 to +2.1. Anthropic's cut-off of live internet for internal evaluations means new BrowseComp, DeepSearchQA and OSWorld numbers may not compare with old ones.

## Open questions

- Does Artificial Analysis publish which evaluations make up the private 60% of Intelligence Index v5 and 45% of Decision Index v2, so a rank change traces to a model or to the weighting?
- Does Google correct its Gemini 4 Hydrogen legal-bench claim, and do vendors check a score against the benchmark's own board before publishing?
- Does anyone replicate the Fleisig result that strategic voting can lift a model up to 45 places, and do arena operators publish a manipulation defence?
- Does Sungbin Im's tau2-bench result hold in the full paper, and do model-free boundary checks become standard beside LLM judges for agent write actions?
- Do the Terminal-Bench 2.0 repairs hold once the full audit is read, and does the ranking stay stable on the fixed tasks?
- Does any benchmark report strict credit beside partial credit by default, given the gaps in ViBench 2.0 and VIALS-AA?
- Does the batch-composition flip rate of 11% to 22% hold for larger judge models?
- Does Databricks, or anyone else, rerun the Spark Declarative Pipelines comparison on a shared task set, priced in dollars and counting silent wrong-output bugs?
- Does METR evaluate OpenAI's later monitor changes, and does anyone else audit a lab's monitor from outside?
- Do outcome-only pass rates get replaced by process checks in agent benchmarks, given that CXBench found most passes false?
- Does the skin-lesion result replicate with repeated runs and a larger melanoma set?
- Will re-judging with several judge families and repeated runs become standard practice, or stay a research finding?
- Does a genuinely independent evaluator, free of lab funding and training data, exist yet?
- Does rubric content, not judge choice, drive most of the variance, and does the Asgari result hold once the full paper is read?
- Do typed evaluators such as `jevals` reduce judge noise, or move it into unaudited schema and training-data choices?
- With membership inference this weak, what replaces black-box contamination checks for closed models?
- Does Anthropic say which evaluations now run offline and which it rebuilt, so old and new scores can be compared?
- Does Arena's Alignment Index, or the HealthBench Professional ranking, hold up when scored by a non-OpenAI judge?
- Does Laminar publish the traces and labels behind flow-1, so its trace-error detection can be run by someone else?
- Does the placebo-arm test of coding skills replicate on a second model, given the author's own limit of one model and tasks mostly at ceiling?

## 2026-11-16

![[2026-11-16#^ev-hydrogen-vals]]

![[2026-11-16#^ev-arena-papers]]

![[2026-11-16#^ev-tau2-judge]]

![[2026-11-16#^ev-decision-index]]

Source note: [[2026-11-16]]

## 2026-11-06

![[2026-11-06#^evals-terminal-bench-audit]]

![[2026-11-06#^evals-epoch-eci]]

![[2026-11-06#^evals-strict-credit]]

![[2026-11-06#^evals-metr-review]]

Source note: [[2026-11-06]]

## 2026-10-30

![[2026-10-30#^headline-aa-v5]]

![[2026-10-30#^evals-aa-v5]]

![[2026-10-30#^evals-carbon-table]]

![[2026-10-30#^evals-judge-instability]]

![[2026-10-30#^radar-judge-caution]]

![[2026-10-30#^radar-composite-index-caution]]

Source note: [[2026-10-30]]

## 2026-10-26

![[2026-10-26#^evals-metr-openai-monitor]]

![[2026-10-26#^evals-lynch-cnn-skin]]

![[2026-10-26#^prac-bbtree]]

![[2026-10-26#^radar-unverified-claims]]

![[2026-10-26#^de-databricks-sdp]]

Source note: [[2026-10-26]]

## 2026-10-21

![[2026-10-21#^eval-metr-anthropic]]

![[2026-10-21#^eval-healthbench]]

![[2026-10-21#^eval-rubric-content]]

![[2026-10-21#^eval-cxbench]]

![[2026-10-21#^eval-ironbee]]

![[2026-10-21#^spotlight-laminar]]

![[2026-10-21#^agent-leanrea]]

![[2026-10-21#^radar-laminar-flow1]]

Source note: [[2026-10-21]]

## 2026-10-17

![[2026-10-17#^evals-mercor-map]]

![[2026-10-17#^evals-frontiercode]]

![[2026-10-17#^evals-decision-index]]

![[2026-10-17#^evals-spireclimb]]

![[2026-10-17#^evals-gemini-argon]]

![[2026-10-17#^zaney-jev-trolley]]

Source note: [[2026-10-17]]

## 2026-10-12

![[2026-10-12#^evals-anthropic-offline]]

![[2026-10-12#^evals-rubric-consensus]]

![[2026-10-12#^evals-self-scaling-benchmarks]]

![[2026-10-12#^agent-decision-models]]

Source note: [[2026-10-12]]

## 2026-10-09

![[2026-10-09#^evals-arena-alignment]]

![[2026-10-09#^evals-harvey-gate]]

![[2026-10-09#^evals-judge-noise]]

![[2026-10-09#^headline-arena-alignment]]

Source note: [[2026-10-09]]

## 2026-10-08

![[2026-10-08#^epoch-innovationeval]]

![[2026-10-08#^arena-self-preference]]

![[2026-10-08#^openai-math-withdrawals]]

![[2026-10-08#^metr-inspect-viewer]]

![[2026-10-08#^skill-placebo]]

![[2026-10-08#^tool-failure-studies]]

![[2026-10-08#^expanded-bo-evidence]]

![[2026-10-08#^expanded-gw-numbers]]

![[2026-10-08#^expanded-gw-musique]]

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

- `🟡 ASSESS` **Placebo-controlled skill evaluation**. (was [[2026-10-08]]) [[2026-11-16]]
- `🟡 ASSESS` **Skill plus plain command-line tools in place of an MCP server (leanrea)**. [[2026-10-21]]
- `◻️ WATCH` **Laminar flow-1 trace-error detection**. [[2026-10-21]]
- `⚠️ CAUTION` **A pinned, temperature-zero LLM judge treated as a reproducible instrument**. (was [[2026-09-29]]) [[2026-10-30]]
- `⚠️ CAUTION` **A composite leaderboard rank as a stable model-selection signal**. [[2026-10-30]]
- `⚠️ CAUTION` **Unverified lab capability claims**. [[2026-09-11]], escalated [[2026-09-15]], third instance [[2026-09-21]], fourth instance [[2026-09-22]], re-argued [[2026-10-26]]
- `⚫ DROPPED` **Step-at-a-time standard-operating-procedure delivery over MCP**. [[2026-10-08]], removed [[2026-11-16]]

## Related

[[Topics/AI Research Provenance Disputes|AI Research Provenance Disputes]] · [[Topics/Jev and Decision Models|Jev and Decision Models]] · [[Topics/AI Safety and Interpretability|AI Safety and Interpretability]]
