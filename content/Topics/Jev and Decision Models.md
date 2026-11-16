---
type: topic
tags: [topic, jev-and-decision-models]
updated: 2026-11-16
living: true
---

# Jev and Decision Models

Small, fast decision and classification models, most prominently TypeSafe AI's Jev and its open reproductions, tracked as a distinct model class from general-purpose text-generating LLMs.

## Where this stands

Jev sits at assess with the caution flag kept, and the class around it is crowded and now reaching production claims. Red Hat's independent guardrail test found Jev led on content safety, 86.2% against 80.3% for a 125M-parameter classifier, but did not reliably beat a model judge or small pre-trained classifiers. It also took 348 to 360 milliseconds against 33 to 54. That removes the case for a default pilot, so test a small classifier first. Artificial Analysis's Decision Index (October 13) adds a class-wide finding: "accuracy falls below that probability for all decision models", so every model tested was overconfident. Index v2 (November 8) is 45% private datasets, which should make it harder to tune against. Perplexity's Decider v1.3 names the index but reports no score on it.

The class is no longer proprietary or single-vendor, and two more entrants arrived this week. Amazon says replacing Claude Sonnet 4.6 with its Strands Decider model on a 20-label ticket-routing job "performed just as well at 98% less cost", at about \$0.0222 a ticket against \$0.0005, but gives no volume and no accuracy figure. Its live three-way switch with a 45-second rollback is the method worth copying. Google shipped a Gemini Decisions API two days later at \$0.10 per million input tokens, with accuracy only in charts. Both are vendor numbers. They join OpenAI's Decisions API (beta since October 6), Microsoft-Decision-1, Cloudflare Clef-Omni, Databricks `ai_decide` (beta), Snowflake Decision (private preview), Jared Palmer's open Kev (within 3.5 points of Jev) and Pydantic AI's `OpenAIDecisionsModel`. The radar dropped the CLM-8B dual-encoder on October 26 after 31 days with no follow-up. TypeSafe's reported raise of \$870 million at about \$7.5 billion rests on a Techmeme headline with Bloomberg unreachable, so it is unverified.

Use-case evidence is thin and conditional. A preprint (JevAgentHarness, arXiv 2610.21412) hands frequent multiple-choice agent decisions to 4B decision models, gated by a confidence threshold fitted on the agent's own trajectories. It reports agents 81.1 to 89.0 percent cheaper and up to 2.5 times faster with under 3 points of success lost, and unfitted delegation cost 19.0 points. The figures come from the abstract, are unreproduced and sit under a non-commercial licence. Amazon's production claim now sits beside it, and the pattern is the same: the saving is real only where the option list is closed and a threshold or shadow period was set first. Pilot in shadow mode on a closed catalog.

Robustness and calibration remain the standing weaknesses. JevOut flipped 61.4% of correct Jev decisions with natural-sounding added context, and three other decision systems showed flip rates of 64.9% to 73.2%. Zach Landes ran Jev through 5,240 trolley-problem setups and in 16 of 48 wordings it saved its own server over twenty people. Reordering options changed OpenAI's probabilities, and first-option bias for Strands was reproduced. A preprint (arXiv 2610.12292, author-reported, models unnamed) found typed decision gates fail open, with fail-open rates rising from 0% to 63% after six lines of irrelevant log text. A companion preprint, NOMOS, compiles written policy into deterministic gates and reports violations falling from 66.3% to 2.6% on one airline test. The radar now holds deterministic compiled gates at assess on three single preprints or assertions, none replicated. TypeSafe's hosted Jev still has no paper, no published weights and an unresolved priority dispute. Do not use any decision model as the only gate on a tool call.

## Open questions

- Does Amazon publish volume and an accuracy figure for the Strands Decider ticket-routing switch, and does anyone reproduce the 98% saving on another 20-label job?
- Does Google publish accuracy as numbers, not charts, for the Gemini Decisions API, and does it show first-option bias like OpenAI and Strands?
- Does Perplexity report a Decision Index v2 score for Decider v1.3, and does the private 45% change the class ranking?
- Has anyone compared a decision-only model with a frontier model on the same routing or triage task, measuring agreement rate and not only speed?
- Is Jev's calibration failure a training artifact or a property of its architecture? The Decision Index says every decision model tested was overconfident, which points to the class.
- Does the fitted-threshold result in JevAgentHarness replicate outside its authors, and under a licence that allows commercial use?
- TypeSafe's 0 percent hallucination claim concerns types, not facts, and no factual-accuracy number exists beside the calibration critique.
- Who holds priority on the underlying method? The dispute is unresolved.
- Will any robustness hardening appear, given flip rates of 61.4% to 73.2% look class-wide?
- Which models did the fail-open preprint test, and do OpenAI's Decisions API, Strands Decider, the Gemini API and Jev fail open in the same way?
- Does a second team replicate the compiled-gate results beyond one airline test?
- No single table compares Kev, Microsoft-Decision-1, Clef-Omni, Strands Decider and the Gemini and OpenAI APIs on the same benchmarks.
- Does the TypeSafe raise get confirmed by a source other than a Techmeme headline?

## 2026-11-16

![[2026-11-16#^ac-decision-models]]

![[2026-11-16#^ev-decision-index]]

Source note: [[2026-11-16]]

## 2026-10-17

![[2026-10-17#^agent-decision-delegation]]

![[2026-10-17#^evals-decision-index]]

![[2026-10-17#^zaney-jev-trolley]]

![[2026-10-17#^radar-decision-class]]

![[2026-10-17#^radar-decision-delegation]]

Source note: [[2026-10-17]]

## 2026-10-12

![[2026-10-12#^agent-decision-models]]

![[2026-10-12#^ep-litellm-1105]]

![[2026-10-12#^rn-litellm-follow-ons]]

![[2026-10-12#^rn-pydantic-ai]]

![[2026-10-12#^ep-unity-gateway-beta]]

![[2026-10-12#^rn-db-gateway-beta]]

![[2026-10-12#^radar-decision-class]]

Source note: [[2026-10-12]]

## 2026-10-09

![[2026-10-09#^agent-decision-model-fail-open]]

![[2026-10-09#^biz-typesafe-raise]]

![[2026-10-09#^rn-sf-decision]]

![[2026-10-09#^radar-decision-models]]

Source note: [[2026-10-09]]

## 2026-10-08

![[2026-10-08#^decision-models-position-bias]]

![[2026-10-08#^radar-decision-models]]

![[2026-10-08#^rn-sf-decision]]

Source note: [[2026-10-08]]

## 2026-10-02

![[2026-10-02#^redhat-jev-guardrails]]

![[2026-10-02#^radar-jev-assess]]

Source note: [[2026-10-02]]

## 2026-09-29

![[2026-09-29#^jev-reproductions]]

![[2026-09-29#^radar-jev-class]]

Source note: [[2026-09-29]]

## 2026-09-25

**JevOut is the first adversarial-robustness measurement on this decision-model class.** An optimizer inserts short, natural-sounding context additions that preserve the source, question, and correct answer, but redirect Jev toward a fixed wrong option. Within 64 accepted attempts, it flipped 312 of 508 originally correct decisions (61.4%), with 229 of those flips landing at 70%+ confidence in the wrong answer. Three other decision systems tested the same way, across seven datasets, showed targeted flip rates of 64.9% to 73.2%. Roughly six in ten correct decisions in this class can be flipped by context that reads as ordinary padding. Source: https://arxiv.org/abs/2609.30243

**Jev-Mobile decouples slow vision-language-model planning from fast typed-decision execution for mobile GUI agents.** A vision-language model sets local goals; Jev repeatedly selects the concrete action within a structured, accessibility-tree-defined action space. On the full AndroidWorld suite it reached 79% task success against 84% for the strongest step-wise vision-language-model baseline, while cutting mean execution time 32.7% and mean model API cost 73.4% on successful runs. Source: https://arxiv.org/abs/2609.30186

**CLM-8B is a second, architecturally distinct open path into the same decision-model class as Jev and Kev.** Instead of Jev's generative typed-decision approach, it uses two frozen-backbone encoders with small trainable projection heads, trained with a contrastive loss, so inference at serving time is a cached embedding and a dot product rather than a full forward pass. It matches Jev's accuracy on computer-use, gaming, and tool-calling tasks while running up to 9x faster, and as a verifier reaches 81.6% on DeepSWE and 87.6% on Terminal-Bench 2.1 at 4.1 to 5.7x Jev's speed. Apache 2.0, code and weights both released. Source: https://github.com/Contrastive-LM/CLM

Source note: [[2026-09-25]]

## 2026-09-23

**Three independent practitioner posts landed on the Jev/decision-model class the same day.** One is a technical critique arguing Jev's confidence scores aren't properly calibrated, citing an example where it predicted a fair coin landing heads at 0.92 probability even with the correct answer stated in the prompt, and recommending teams treat its output as a ranking score and apply their own lightweight recalibration (Platt scaling on a few hundred labeled examples) rather than trust the raw probability: "A model is calibrated when for any predicted probability p the true probability of the positive class given that prediction is p." A second is a deliberately labeled parody, a 25-line local reproduction using an open GGUF model's own logits instead of an API call: "We didn't call an API. We didn't create a bunch of synthetic data. We didn't train a model with Reinforcement Learning for Calibrated Decisions (RLCD)." A third, thinner post covers using Jev-style typed decisions with scoped tool authority in production. Read together, a hyped decision-model category is now being reproduced and picked apart by practitioners faster than the vendor is responding to either. ([calibration critique](https://alexmolas.com/2026/09/23/jev-cant-be-calibrated.html), [parody reproduction](https://www.nobodywho.ai/posts/jev-in-25-lines/))

**A same-day Claude Code plugin, fast-jev-compaction, made Jev a consumer rather than only a benchmarking target.** It replaces Claude Code's default context-compaction summarization with Jev-scored selective tool-call pruning: conversational text stays verbatim, and only tool calls and results are sent to Jev, which scores each one on whether it is worth keeping and whether its result needs to stay verbatim. No published benchmark yet compares this against default compaction. Full coverage in [[Topics/Agent Memory and Context Engineering|Agent Memory and Context Engineering]].

Source note: [[2026-09-23]]

## 2026-09-22

**Kev is now a named Apache-2.0 reproduction of Jev, and the gap between them has narrowed to a number worth stating precisely.** Jared Palmer released Kev, a decision-model family built on Qwen3.5 bases, in 0.8B, 4B and 9B sizes with training code and evaluation data, running on CUDA, ROCm and Apple Silicon. Kev-9B scores 0.822 on a new-source development set against 0.857 for TypeSafe AI's hosted Jev, a 3.5-point gap. The comparison is run by the Kev team against Jev's hosted interface, and the README says plainly that because Jev's training data is unknown, "this isn't a controlled comparison of the two architectures." Why it matters: Jev has been on this radar as a disputed, paper-free, weights-free commercial product since 2026-09-17. An Apache-2.0 reproduction that closes most of the gap and that anyone can audit changes the adoption question from whether to trust the claim to whether the remaining 3.5 points are worth a dependency.

**The radar position moved to reflect that: Kev is now the default path into this model class, and Jev is the thing you benchmark against.** The remaining gap to the hosted product is 3.5 points of accuracy on one development set, by the challenger's own uncontrolled measurement, and the hosted product still has no paper, no weights and a live priority dispute. When an auditable open implementation lands within a few points, the case for carrying the disputed dependency is mostly gone.

Source note: [[2026-09-22]]

## 2026-09-17

**TypeSafe's Jev prices input at \$0.042 per million tokens and charges nothing for output, because it generates no text.** Output is a typed value from one of three primitives: Choice (pick a category), Score (a number on a scale), or Noul (a probability from 0 to 1), each returned with a calibrated confidence figure from a single parallel pass rather than token by token. Vendor-reported performance: 70ms to 500ms end to end, 40x to 200x faster and 40x to 400x cheaper than frontier models at equivalent intelligence, and 193.6x faster and 444.6x cheaper on TypeSafe's own workflow evaluation. Early access, text input only, and a 255-choice cardinality ceiling above which it falls back to two-stage scoring.

Jev reduces output rather than reducing bytes on one input channel, which is why it was worth taking seriously from the start. The genuine secondary saving is that it removes the retry-and-parse wrapper a caller needs around a frontier model asked for structured output, because the model cannot emit a value outside the declared schema. That is also the claim most likely to be repeated wrongly: TypeSafe lists a 0 percent hallucination rate, and that is a statement about types, not facts. Jev cannot return a malformed answer and can still return a confidently wrong one, a point the 2026-09-23 calibration critique makes concrete. ([TypeSafe announcement](https://typesafe.ai/blog/introducing-system-one-models-and-jev), [System One docs](https://docs.typesafe.ai/concepts/system-one))

Source note: [[2026-09-17]]

## On the radar

- `🟡 ASSESS` `⚠️` **TypeSafe Jev and the System One decision-model class**, typed calibrated output in one parallel pass, now reproduced many times over; an independent guardrail benchmark found no reliable accuracy edge over small classifiers or a model judge, at several times the latency. Benchmark per task against a small classifier first; OpenAI's Decisions API and Strands Decider add two entrants, with first-option bias reproduced; a preprint found typed decision gates fail open, models unnamed; Artificial Analysis found every decision model overconfident; Amazon's first production claim gives no accuracy figure, and Google shipped a Decisions API. (was [[2026-10-17]]) [[2026-11-16]]
- `🟡 ASSESS` **Deterministic compiled tool-call gates in place of a model-decided gate**, three single preprints or assertions, none replicated. (was [[2026-10-09]]) [[2026-11-16]]
- `🟡 ASSESS` **Fitted-threshold delegation to a decision model inside an agent loop (Strands DecisionModel, JevAgentHarness)**, single preprint; unfitted delegation cost 19 points. [[2026-10-17]]
- `⚫ DROPPED` **CLM-8B contrastive dual-encoder decision model**, no follow-up in 31 days. [[2026-09-25]], removed [[2026-10-26]]

## Related

[[Topics/Token Cost and Model Routing|Token Cost and Model Routing]] · [[Topics/Agent Memory and Context Engineering|Agent Memory and Context Engineering]] · [[Topics/Open Weights and Licensing|Open Weights and Licensing]] · [[Topics/Evaluation Methodology|Evaluation Methodology]]
