---
type: topic
tags: [topic, jev-and-decision-models]
updated: 2026-09-25
living: true
---

# Jev and Decision Models

Small, fast decision and classification models, most prominently TypeSafe AI's Jev and its open reproductions, tracked as a distinct model class from general-purpose text-generating LLMs.

## Where this stands

As of September 25, 2026, the class has two open reproduction paths into it rather than one. Kev (Jared Palmer's Apache-2.0 release on Qwen3.5 bases) remains the generative path: it reproduces Jev's typed-decision mechanic directly and scores within 3.5 accuracy points of Jev on a development set. CLM-8B is now a second, architecturally distinct path: two frozen-backbone encoders with small trainable projection heads, trained with a contrastive loss, so inference at serving time is a cached embedding and a dot product rather than a full forward pass. It matches Jev's accuracy on computer-use, gaming, and tool-calling tasks while running up to 9x faster, and ships Apache 2.0 with both code and weights released. The class no longer has one obvious open implementation to converge on; it has two, built on different architectures.

The first adversarial-robustness data point on this class landed today, and it is unfavorable. JevOut, an optimizer that inserts short, natural-sounding context additions preserving the source, question, and correct answer, flipped 312 of 508 originally correct Jev decisions (61.4%) within 64 accepted attempts, with 229 of those flips landing at 70%+ confidence in the wrong answer. Three other decision systems tested the same way, across seven datasets, showed targeted flip rates of 64.9% to 73.2%, close enough to Jev's own number that this reads as a structural weakness of the decision-model class, not a Jev-specific defect. Roughly six in ten correct decisions in this class can be flipped by context that reads as ordinary padding.

Adoption is still moving forward despite the calibration and robustness doubts: Jev-Mobile decouples slow vision-language-model planning from fast typed-decision execution for mobile GUI agents, reaching 79% task success on the full AndroidWorld suite (against 84% for the strongest step-wise VLM baseline) while cutting mean execution time 32.7% and mean model API cost 73.4% on successful runs. TypeSafe's hosted Jev still has no paper, no published weights, and an unresolved priority dispute, and the ring stays at `🔵 TRIAL` with the caveat flag now carrying both the calibration critique and the adversarial-robustness finding.

## Open questions

- Nobody has published an independent evaluation of a decision-only model against a frontier model on the same routing or triage task. Kev's own uncontrolled comparison against Jev does not settle this; agreement rate matters more than the speed multiple, and only the vendor and the challenger have measured it so far.
- Whether Jev's calibration failure (a fair-coin example predicted at 0.92 despite the correct answer being explicit in the prompt) is a training artifact specific to TypeSafe's evaluation data, or a structural property of the Choice/Score/Noul architecture, is unresolved. The critique's own recommendation, local recalibration on a few hundred labeled examples, assumes the former.
- TypeSafe's advertised 0 percent hallucination rate is a statement about types (the model cannot return a malformed answer), not about facts (it can still return a confidently wrong one). Nobody has published a factual-accuracy number to sit beside the calibration critique.
- The priority dispute over the underlying method remains unresolved and undated in this roundup's coverage.
- Whether tooling that now consumes Jev as a scoring backend, such as fast-jev-compaction for context compaction, creates a dependency on a model this contested, or whether swapping in Kev or CLM-8B underneath the same architecture is a drop-in replacement, is untested.
- Whether any robustness-hardening work is coming, now that JevOut has shown 61.4% to 73.2% targeted flip rates across four decision systems and seven datasets: this looks like a class-wide weakness rather than something one vendor can patch alone.
- Whether CLM-8B's contrastive dual-encoder architecture is also vulnerable to JevOut-style context injection is untested; JevOut's seven-dataset run predates CLM-8B's release and did not include it.
- Whether Kev or CLM-8B becomes the reference open implementation for this class is unsettled: they now represent two different bets (generative typed-decision vs. contrastive embedding-and-dot-product) on the same problem, and nobody has run them head to head.

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

- `🔵 TRIAL` `⚠️` **TypeSafe Jev and the System One decision-model class**, typed calibrated output in one parallel pass; Kev and now CLM-8B are auditable open reproductions on two different architectures, and JevOut's adversarial-robustness test flipped 61.4% of Jev's correct decisions using natural-sounding context, a vulnerability shared by three other decision systems across seven datasets. Still no paper, no weights and a live priority dispute. (was [[2026-09-23]]) [[2026-09-25]]
- `🟡 ASSESS` **CLM-8B contrastive dual-encoder decision model**, matches Jev's accuracy on computer-use, gaming, and tool-calling tasks while running up to 9x faster, using two frozen-backbone encoders with trainable projection heads instead of Jev's generative typed-decision approach; Apache 2.0, code and weights released. [[2026-09-25]]

## Related

[[Topics/Token Cost and Model Routing|Token Cost and Model Routing]] · [[Topics/Agent Memory and Context Engineering|Agent Memory and Context Engineering]] · [[Topics/Open Weights and Licensing|Open Weights and Licensing]]
