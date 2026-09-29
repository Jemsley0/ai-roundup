---
type: topic
tags: [topic, jev-and-decision-models]
updated: 2026-09-29
living: true
---

# Jev and Decision Models

Small, fast decision and classification models, most prominently TypeSafe AI's Jev and its open reproductions, tracked as a distinct model class from general-purpose text-generating LLMs.

## Where this stands

As of September 29, 2026, TypeSafe AI's Jev anchors a decision-model class with open reproductions on two distinct architectures and, now, its first outside benchmark on a domain the vendor has not itself published on. Kev (Jared Palmer's Apache-2.0 release on Qwen3.5 bases) reproduces Jev's generative typed-decision mechanic and scores within 3.5 accuracy points of Jev on a development set. CLM-8B reaches the same accuracy on computer-use, gaming, and tool-calling tasks from a contrastive dual-encoder architecture, running up to 9x faster because inference at serving time is a cached embedding and a dot product rather than a full forward pass. A third, less formal reproduction, Jeff, surfaced this week: a home-trained model at 0.8B and 2B parameters that matches Jev's aggregate score on Hacker News's own read of it, while commenters reported task-specific drops as large as 70% against Jev's 94% on at least one task.

The adversarial-robustness finding from the prior cycle still stands unaddressed: JevOut flipped 61.4% of Jev's correct decisions using natural-sounding context, a vulnerability shared by three other decision systems across seven datasets, and Jev-Mobile's mobile-agent adoption (79% task success on AndroidWorld, 32.7% faster, 73.4% cheaper) continues despite it. This week's medical benchmark adds a second, independent line of evidence with the same shape: on 2,823 items, Jev roughly matched GPT-6 Sol on PubMedQA factual recall (78.4% vs 78.2%) and was markedly better calibrated when it disagreed (expected calibration error 0.063 vs 0.146 on MetaMedQA), for a run that cost \$0.08 in total, but fell 20 or more points behind on DiagnosisArena (59.8% vs 82.4%) and New England Journal of Medicine (NEJM) cases (61.8% vs 82.4%). A separate 421M-parameter checkpoint, Laya, shows the same decision-model shape and the same calibration sensitivity: one temperature parameter cut its calibration error from 0.204 to 0.037. Laya has not yet been benchmarked against Jev directly, so it is not yet counted in this class.

The ring stays at TRIAL. The caveat, previously a dispute about calibration and adversarial robustness, is now also a domain- and task-dependent ceiling: parity or better on recall and calibration, a wide gap on multi-step diagnostic reasoning, and a third open reproduction (Jeff) showing the same unevenness. TypeSafe's hosted product still has no paper, no published weights, and an unresolved priority dispute. The operating guidance this week's data supports is to benchmark the class per task before routing production traffic through it, rather than trust an aggregate score from any single benchmark.

## Open questions

- Whether decision-only models hold up against frontier models outside medical benchmarks is still untested. The first outside, non-vendor evaluation (medical, this week) showed parity on recall but a 20-point gap on diagnosis tasks, and no equivalent independent run yet exists for routing, triage, or coding tasks.
- Whether Jev's calibration failure (a fair-coin example predicted at 0.92 despite the correct answer being explicit in the prompt) is a training artifact specific to TypeSafe's evaluation data, or a structural property of the Choice/Score/Noul architecture, is unresolved. Laya's result, that a single temperature parameter cut its calibration error from 0.204 to 0.037 on an architecturally similar model, is consistent with the training-artifact reading but does not settle it for Jev itself.
- Whether Laya will be formally benchmarked against Jev and folded into this class, rather than tracked as a separate checkpoint with "a similar decision-model shape," is open.
- Whether Jeff's task-specific drops (70% against Jev's 94% on at least one task) reflect a training-data gap specific to Jeff, or the same task-dependent ceiling the medical benchmark just found in Jev itself, is untested.
- The priority dispute over the underlying method remains unresolved and undated in this roundup's coverage.
- Whether tooling that consumes Jev as a scoring backend, such as fast-jev-compaction for context compaction, creates a dependency on a model this contested, or whether swapping in Kev, CLM-8B, or Jeff underneath the same architecture is a drop-in replacement, is untested.
- Whether any robustness-hardening work is coming, now that JevOut has shown 61.4% to 73.2% targeted flip rates across four decision systems and seven datasets, is open. This looks like a class-wide weakness rather than something one vendor can patch alone.
- Whether CLM-8B's contrastive dual-encoder architecture is also vulnerable to JevOut-style context injection is untested; JevOut's seven-dataset run predates CLM-8B's release and did not include it.
- Whether Kev, CLM-8B, or Jeff becomes the reference open implementation for this class is unsettled. They now represent three different bets, generative typed-decision, contrastive embedding-and-dot-product, and a smaller home-trained generative model, on the same problem, and nobody has run them head to head.

## 2026-09-29

**The first outside medical-domain measurement of TypeSafe's Jev draws a line its vendor does not.** On 2,823 items, Jev 1.13 roughly matched GPT-6 Sol on PubMedQA factual recall (78.4% vs 78.2%). It was better calibrated on MetaMedQA, with an expected calibration error of 0.063 vs 0.146, despite lower accuracy. It fell well behind on DiagnosisArena (59.8% vs 82.4%) and New England Journal of Medicine (NEJM) cases (61.8% vs 82.4%). The whole run cost \$0.08. Separately, a 421M-parameter checkpoint called Laya showed a similar decision-model shape: one temperature parameter cut its calibration error from 0.204 to 0.037. The paper does not compare Laya against Jev, so it is not yet counted in this class. [Jev](https://arxiv.org/abs/2609.34024) · [Laya](https://arxiv.org/abs/2609.33843)

**Jeff, a home-trained, Jev-compatible decision model released at 0.8B and 2B parameters, reached 521 points on Hacker News.** It reports 22 milliseconds per decision on one workstation graphics processing unit (GPU). Commenters reported task-specific drops, such as 70% against Jev's 94%. [source](https://github.com/firelex/jeff)

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

- `🔵 TRIAL` `⚠️` **TypeSafe Jev and the System One decision-model class**, caveat now sharpened by domain: the first outside medical benchmark shows parity on factual recall and better calibration but a roughly 20-point gap on diagnosis tasks against GPT-6 Sol, and a home-trained reproduction, Jeff, matches Jev's aggregate score while showing similar task-specific drops. Kev and CLM-8B remain the two auditable open reproductions on different architectures, and JevOut's adversarial-robustness test, which flipped 61.4% of Jev's correct decisions using natural-sounding context, still stands unaddressed. Still no paper, no weights and a live priority dispute. (was [[2026-09-25]]) [[2026-09-29]]
- `🟡 ASSESS` **CLM-8B contrastive dual-encoder decision model**, matches Jev's accuracy on computer-use, gaming, and tool-calling tasks while running up to 9x faster, using two frozen-backbone encoders with trainable projection heads instead of Jev's generative typed-decision approach; Apache 2.0, code and weights released. [[2026-09-25]]

## Related

[[Topics/Token Cost and Model Routing|Token Cost and Model Routing]] · [[Topics/Agent Memory and Context Engineering|Agent Memory and Context Engineering]] · [[Topics/Open Weights and Licensing|Open Weights and Licensing]]
