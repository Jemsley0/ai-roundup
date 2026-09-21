---
type: topic
tags: [topic, research-provenance]
updated: 2026-09-21
living: true
---

# AI Research Provenance Disputes

Credit, attribution, and the gap between an announced result and a checkable one. The recurring pattern: a lab claims a research breakthrough, the claim turns out to be entangled with questions about what went into training or what the claimant checked against, and the capability question becomes impossible to separate from the provenance question.

## Where this stands

The operating rule has tightened twice. It started as "prefer machine-checkable results over announced ones," driven by the OpenAI mathematics disputes, with Anthropic's Lean-formalised Fermat proof as the clean contrast case. It then tightened again after this roundup itself got caught: the Cyphral Distich solve was internally consistent and possibly about a document that does not exist, because the claimant worked from an 1834 compilation rather than the 1653 original the story was told about. So the rule is now **check what the claimant checked against, not just whether the answer verifies internally.**

Twenty-five Fields Medallists have now signed a declaration against how labs treat mathematics, naming four specific harms. It makes no policy demands, which given what produced it is a choice worth noting.

The newest development is second-order: Aaronson reports rumours that labs are now sitting on solved open problems because the reputational cost of a botched announcement has risen. If true, the disclosure behaviour of frontier labs has changed as a result of this thread, which is a more consequential outcome than any individual dispute.

As of 2026-09-21 this page has three live instances and they form a usable taxonomy. A claim that fails on inspection (the Cyphral Distich refutation). A claim nobody can inspect (Aaronson's withheld-solutions rumour). And, new this cycle, a claim inspectable on one side only: a researcher's March 2025 arXiv paper on non-autoregressive decision models trained with reinforcement learning, set against TypeSafe AI's Jev, which shipped in September 2026 with no paper, no weights and no training data. The asymmetry is the point. One side has a dated artefact and the other has a hosted API, so the dispute cannot be settled on evidence even in principle, which is a property of the vendor's disclosure choices rather than of the underlying question.

The countervailing signal is that the class is being reproduced in the open regardless. Kev builds tiny Jev-like decision models on Qwen3.5 and `jevals` uses typed decisions in place of LLM judges. Independent reimplementation is doing the verification work that the vendor's own release refused to enable, which is a reasonable template for how this thread resolves in general.

## Open questions

- TypeSafe AI has not responded publicly to the priority claim. Whether a paper follows, and whether it cites the March 2025 work, is the fact that would settle this.
- Is there any way to evaluate "agents did novel mathematics" without knowing what went into training? No one has proposed a mechanism.
- The Fields Medallists named the problem and asked for nothing. Does an ask ever arrive, and from whom?
- Aaronson's withheld-solutions rumour is unverified by his own account. If it is true, it is the most important item in this thread and there is currently no way to confirm it.

## 2026-09-21

**A researcher published a priority claim against TypeSafe AI's Jev and it took 1,318 points, the second-largest item of the window.** Nandakishor M of Convai Innovations says he published non-autoregressive decision models trained with reinforcement learning in an arXiv paper in March 2025, and that TypeSafe AI presented the same concept in September 2026 as a new scientific breakthrough. The stated objection is disclosure as much as precedence: Jev shipped with no technical paper, no open weights and no open training data, so there is no artefact against which an independent reader can compare the two claims. TypeSafe AI's own framing is a training method it calls reinforcement learning for calibrated decisions, with vendor-reported multiples of roughly 100x faster and 100x cheaper than conventional models on classification and routing-shaped work.

This is the third instance of the pattern this page exists for, and the cleanest structurally. The Cyphral Distich refutation was a claim that failed on inspection. Aaronson's withheld-solutions rumour is a claim nobody can inspect. This one is a claim that can be inspected on one side only: the prior art is on arXiv with a date on it, and the thing it is being compared against is a hosted API with no paper. That asymmetry is the finding, rather than which party is right about precedence. The class itself is meanwhile being reproduced in the open by third parties, with Kev building tiny Jev-like decision models on Qwen3.5 (197 points on Sep 21) and `jevals` replacing LLM judges with typed Jev decisions, which is what independent verification of the underlying idea looks like even while the vendor's specific claims stay unverifiable. ([DEV Community](https://dev.to/nandakishor_m_6cc0adfde9f/i-built-non-autoregressive-decision-models-a-year-ago-then-a-frontier-lab-called-it-a-18me))

Source note: [[2026-09-21]]

## 2026-09-16

**Aaronson says he has heard that labs are sitting on solved open problems, and he has not verified it.** In "The Age of Wonders and Terrors" he reports rumours that AI companies have solutions to some very longstanding open problems in theoretical computer science, and he is specific that these are not complexity-class separations, and are withholding them until they work out a better way to announce. He attributes the caution directly to the Navier-Stokes backlash: OpenAI spent roughly \$15M in compute, swooped in once it had word of human progress, and the resulting credit dispute with Buckmaster and Alpöge is what the Fields Medallists' declaration was reacting to. Treat the rumour as a rumour, which is how Aaronson labels it. The structural point stands on its own: the reputational cost of a botched announcement is now high enough to change disclosure behaviour at frontier labs. ([Shtetl-Optimized](https://scottaaronson.blog/?p=10062), [Science](https://www.science.org/content/article/how-ai-math-breakthrough-ignited-controversy))

Source note: [[2026-09-16]]

## 2026-09-15

**The Cyphral Distich solve is contested on archival grounds, and the 09-14 note was wrong to call verification clean.** Reticuli Labs published a refutation arguing the cryptogram is not in the 1653 edition at all. Their check of the British Library film of *Logopandecteision* finds the final leaves running Proquiritations 30 to 32, then a printer's ornament row, a "Parva peto" epigraph, FINIS, and errata, with no numeric distich anywhere. The EEBO-TCP transcription (A64608) agrees: 32 parts, epigraph, FINIS, errata, zero numeric elements in that span. The divergence has a mundane explanation. Vals AI worked from the Maitland Club's 1834 collected works, where the cipher appears on page 417, not from the 1653 original. Schneier, who had posted the result approvingly on Sep 9, appended "I'm not sure if this result is correct" on Sep 14 and pointed readers at the refutation. Hacker News independently raised objections nobody made on day one: 2014 German blog comments had already proposed a book cipher, undercutting the claim that prior attempts missed a crucial hint; the model was prompted to find an unsolved cipher *it could solve*, which makes a hit close to inevitable across enough candidates; and the Distich was never well-studied, so obscurity rather than difficulty may explain 370 years. The more specific claim circulating on aggregator sites that the method fails in ten positions is unverified. ([Reticuli FINDINGS.md](https://github.com/reticuli-labs/panel-artifacts/blob/main/distich-refutation-2026-09-01/FINDINGS.md), [Schneier](https://www.schneier.com/blog/archives/2026/09/claude-fable-solves-a-historical-cipher.html))

Source note: [[2026-09-15]]

## 2026-09-14

**Twenty-five Fields Medallists signed a declaration against how AI labs are treating mathematics, and it was the largest Hacker News thread of the window by a wide margin**, at 1,219 points and 1,201 comments. Tao's framing is the substantive part: solving problems "is only a tool and proxy for achieving the primary goal of conceptual understanding and insight," so benchmarking labs against famous open problems optimises the proxy and damages the goal. Four specific harms: rushed announcements that leave no time for proper writeup or citation of prior work, raising attribution and plagiarism questions; loss of the pedagogical function problem-solving serves in training researchers; breakage of the human transmission chain by which ideas enter the mathematical canon; and a broader risk to other intellectual professions facing the same pattern. Signatories include Avila, Bhargava, Birkar, Deligne, and Tao. Notably, **the declaration makes no concrete policy demands**. It names the problem and invites signatures. Given that the Navier-Stokes and soficity disputes are what produced it, the absence of an ask is a choice worth noting. ([Declaration](https://mathandai.org/), [Tao](https://terrytao.wordpress.com/2026/09/11/a-severe-misalignment-of-ai-in-mathematics/))

**One resurfaced item, flagged because the date gap was the interesting part.** Vals.ai's writeup of Fable 5.1 solving the Cyphral Distich, Thomas Urquhart's 1653 two-line cryptogram of 64 numbers, unsolved for 370 years and listed among the top 50 unsolved encrypted messages, hit 366 points on Sep 14 despite being published Aug 31. The model found the key in under 45 minutes: Urquhart's repeated emphasis on the number 32 and the poem's reference to "his own heart's wishes" pointed to the book itself as the key, each number indexing a word in the corresponding section, first letters yielding the plaintext. At the time this note called verification clean, two lines of exactly 32 letters, rhyming "and" and "land", content a Royalist prayer for Charles II consistent with Urquhart's politics. That assessment was wrong and was corrected the following day. It surfaced the same day as the Fields Medallists' declaration, and the contrast was framed as the story: a verifiable puzzle with a checkable answer and no living claimant is exactly the shape of problem where this works without controversy. That framing did not survive. ([vals.ai](https://www.vals.ai/blogs/fable-solves-cyphral-distich))

Source note: [[2026-09-14]]

## 2026-09-10

**The Navier-Stokes credit dispute escalated into a training-data provenance scandal.** Three things changed overnight. First, a second accusation landed: Andreas Thom, a group theorist at TU Dresden, posted evidence on Mastodon suggesting OpenAI trained Astra on his private ChatGPT conversations with Gábor Kun about Gromov's soficity question, one of the ten problems OpenAI claimed Astra solved. Thom's own 2019 paper with Kun, plus a 2016 Kun result, supplies the central technical step of the non-sofic group construction OpenAI announced, and Thom says a senior OpenAI researcher gave him a misleading answer when he asked whether his chat logs touched the training pipeline. Second, **the allegation changed kind**: Buckmaster's complaint was "they learned our method," while Thom's is "they ingested our unpublished work and presented it as the model's discovery." Third, OpenAI quietly edited the blog post. It had claimed the problems "have been open and seen no progress on the main result for at least a decade," which is no longer the wording, and one OpenAI researcher deleted a tweet claiming a breakthrough. Scientific American now has experts describing this as research misconduct, with the specific charge that two of the most impressive results incorporate ideas from recent literature without proper citation. Mathematician Raphael Appenzeller's read is that the language is no longer misleading but "disproved the soficity conjecture" is still an overclaim, since it is not clear anyone conjectured that every group is sofic. ([Scientific American](https://www.scientificamerican.com/article/openais-latest-math-breakthroughs-commit-research-misconduct-experts-say/), [MIT Tech Review](https://www.technologyreview.com/2026/09/08/1143747/what-openais-latest-controversy-tells-us-about-the-future-of-math/), [Appenzeller](https://mathstodon.xyz/@ra/117032847670457892))

**Why this matters beyond one lab's PR problem:** the capability claim and the provenance claim are now entangled, and there is no way to evaluate "agents did novel mathematics" without knowing what went into training. That is a much harder epistemic position than the Fermat formalization, which was computer-checked in Lean and therefore verifiable regardless of provenance. Worth holding those two side by side as the clean case and the messy one.

Source note: [[2026-09-10]]

## 2026-09-09

**OpenAI published a proposed solution to the Navier-Stokes Millennium Prize Problem, produced by an unreleased model running roughly 10,000 agents for about 88 hours, and the story immediately became a credit fight rather than a capability story.** Two caveats matter more than the headline. First, the proof is not the Millennium Problem in its prize-eligible form: it demonstrates a singularity in 3D Navier-Stokes *with a smooth forcing term*, while the Clay Prize is tied to the unforced version, and OpenAI says it will not claim the prize. Second, NYU's Tristan Buckmaster and Anthropic's Levent Alpöge had worked about a year on the related forced-Euler result and say they broke through on Aug 15; Buckmaster alleges OpenAI moved on the proof after becoming aware of their method. OpenAI says it did not access their specific work, and the published page now credits both for concurrent work and offers a joint priority announcement. A real throughput data point wrapped in an unresolved provenance dispute, the same shape as the Fermat formalization minus the clean verifiability. ([OpenAI](https://openai.com/index/navier-stokes-solution/), [Scientific American](https://www.scientificamerican.com/article/openai-claims-blockbuster-math-breakthrough-amid-swirl-of-controversy/))

Source note: [[2026-09-09]]

## 2026-09-08

**Anthropic had Claude formalize the first end-to-end, computer-checked proof of Fermat's Last Theorem in Lean**: 13 million lines of code, 29,500 intermediate theorems, done in 11 days by several dozen agents generating 6B tokens with limited human input. This closes out Freek Wiedijk's 20-year-old list of 100 formalization challenges. This is the clean case in this whole thread, and the reason it stays the reference point: it is a concrete, verifiable data point on agentic research throughput rather than a benchmark claim, and it is checkable regardless of what went into training. ([Anthropic](https://www.anthropic.com/research/formalizing-fermats-last-theorem), [SiliconANGLE](https://siliconangle.com/2026/09/04/anthropic-uses-claude-to-formalize-proof-of-fermats-last-theorem/))

Source note: [[2026-09-08]]

## On the radar

- `⚠️ CAUTION` **Unverified lab capability claims**. Check what the claimant checked against, not just whether the answer verifies internally. [[2026-09-11]], escalated [[2026-09-15]], third instance [[2026-09-21]]
- `🔵 TRIAL` `⚠️` **TypeSafe Jev and the System One decision-model class**, reproduced in the open by third parties, while the vendor's own release has no paper, no weights and a live priority dispute. (was [[2026-09-17]]) [[2026-09-21]]

## Related

[[Topics/AI Safety and Interpretability|AI Safety and Interpretability]] · [[Topics/GPT-6 Astra|GPT-6 Astra]] · [[Topics/Cognition|Cognition]]
