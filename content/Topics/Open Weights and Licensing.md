---
type: topic
tags: [topic, open-weights-and-licensing]
updated: 2026-10-09
living: true
---

# Open Weights and Licensing

The licence terms attached to downloadable model weights, and what they permit: permissive versus research-only relicensing, where the licence actually lives in a repository, and tooling that changes what a licensee can do with the weights once they hold them.

## Where this stands

The licence is now the variable that decides whether an open-weight model is usable, and it moves in both directions at once. Xiaomi's MiMo-V2.6 shipped weights, a technical report and independent pricing, but its only licence is a bare `license: mit` tag in the model card frontmatter, with no LICENSE file, no copyright notice and no named licensor. Alibaba moved the other way and took Qwen-Image-2.1 from Apache 2.0 to a research-only licence. StepFun has promised open weights for Oct 15 and has not yet delivered. PrismML and Jared Palmer's Kev shipped real Apache 2.0 releases with training code and evaluation data. Capability is not the moving variable. The paperwork is.

Tooling now limits what any licence can protect. Heretic strips trained refusals from an open-weight model in one command. Anthropic's Frontier Red Team reported abliteration cutting refusals from 95 percent to under 14 percent on GLM-5.3. The US Center for AI Standards and Innovation independently assessed the same model. Both bodies put open-weight cyber capability about four months behind the frontier, and Anthropic asked governments to test successors. Commenters read the report as pre-listing lobbying against open weights, so the framing is contested even though the measurements are not.

Supply is still growing. Axios reported on Oct 4 that Nvidia-backed Reflection AI is preparing a US open-weight model to challenge DeepSeek and Qwen, with no name, date or licence. That rests on one secondary summary. Every release now needs a read of the actual LICENSE file, the vendor's prior licences on the same product line, and whether the weights are open at all. Qwen3.8-Omni-Flash is closed-weight, so no version can be pinned.

## Open questions

- Will Xiaomi add a LICENSE file and narrative licence text to the MiMo-V2.6 repositories, or does the frontmatter tag stand?
- Is the Qwen-Image-2.1 relicensing specific to that product line, or the start of a move away from Apache 2.0 across Qwen?
- Will StepFun publish Step 5 weights on Oct 15, and under which licence?
- Will Reflection AI name a model, a date and a licence, and does the licence permit commercial use?
- If governments act on the four-months-behind finding, does that change how labs write open-weight licences or whether they publish weights at all?

## 2026-10-09

![[2026-10-09#^models-step-5]]

Source note: [[2026-10-09]]

## 2026-10-08

![[2026-10-08#^models-mistral-large-4]]

![[2026-10-08#^models-reflection-beam]]

![[2026-10-08#^models-embeddinggemma-2]]

Source note: [[2026-10-08]]

## 2026-10-05

![[2026-10-05#^reflection-open-weight]]

Source note: [[2026-10-05]]

## 2026-10-02

![[2026-10-02#^glm-53-cyber]]

Source note: [[2026-10-02]]

## 2026-09-22

**Xiaomi shipped MiMo-V2.6-Pro and MiMo-V2.6-Flash with a licence that is, in total, one line of YAML.** Both model cards carry a bare `license: mit` tag in the Hugging Face frontmatter, and that tag is the only licence artifact present anywhere in either repository. There is no LICENSE file in the Pro repository or the Flash repository, and there is no narrative licence text on either model card, no copyright notice, and no named licensor. This became a new `⚠️ CAUTION` radar entry today: a frontmatter tag renders a badge on the model card page, but it is metadata, not a grant. It carries no copyright notice and it names no licensor, so a licensee has nothing to point to if the tag is later disputed, contradicted, or removed. The check this entry recommends is cheap and specific: before an open-weight model enters anything that ships, confirm a LICENSE file exists in the repository and read it, rather than trusting the badge that renders from the frontmatter tag alone.

**Two other releases the same day show what the badge is standing in for.** Jared Palmer's Kev, an Apache-2.0 decision-model family built on Qwen3.5 bases, shipped with training code and evaluation data published alongside the weights, running on CUDA, ROCm and Apple Silicon: that is a licence with a repository's worth of narrative and material behind it, not a tag. Heretic, the automated abliteration tool that reached 32,148 GitHub stars today, is licensed AGPL-3.0, and its own terms are not the point for this page. What Heretic establishes is that alignment on any open-weight release is now removable by a non-expert in one command, author-reported at 3 refusals in 100 on Gemma-3-12B, at a Kullback-Leibler divergence of 0.16 against 0.45 and 1.04 for hand-tuned baselines. That is an input to every open-weight licensing decision going forward, because a licensor writing permissive terms is now writing them for weights whose trained refusals can be stripped by anyone who downloads them, regardless of what the licence itself says about acceptable use.

Source note: [[2026-09-22]]

## 2026-09-21

**Alibaba published Qwen-Image-2.1 on September 20 under a research-only licence, one generation after the previous release shipped Apache 2.0.** The weights are published on Hugging Face and ModelScope, but the Qwen Research License Agreement dated September 20, 2026 grants rights for non-commercial purposes only and requires a separately requested licence for commercial use. The previous Qwen-Image generation was Apache 2.0. The model itself is consumer image generation, but the licence regression is the point that belongs here: a vendor that trained practitioners to expect Apache 2.0 on a product line relicensed the next version to research-only, in the same window that StepFun released Step 5 Preview with open weights promised on a fixed future date. Open-weight availability is a lever the same lab family pulls in opposite directions within days of each other, and anyone depending on Qwen weights now has to read each release rather than assume a house position. ([Qwen-Image-2.1](https://github.com/QwenLM/Qwen-Image-2.1))

**StepFun released Step 5 Preview on September 20, a 600B-total, 27B-active mixture of experts with a 1M-token context, at \$1.00 per million input tokens and \$2.70 per million output.** Open weights are scheduled for October 15, 2026. Every capability figure other than the pricing is vendor-reported, and until the open-weight date the only access is a Chinese-hosted application programming interface, which is the opposite of a licensing win until it actually converts. Once it does, this is a licence commitment with a date attached rather than a bare tag or a retroactive tightening. ([MarkTechPost](https://www.marktechpost.com/2026/09/20/stepfun-launches-step-5-preview/))

**Pirate Face converts Hugging Face repositories into BitTorrent torrents with SHA-256 checksums and web seeds, restricted to MIT and Apache-2.0 models plus a stated Kimi-K3 exception.** Downloads pull from Hugging Face first and fall back to peer seeding if the original repository disappears. It documents no actual deletion incidents, but the restriction to genuinely permissive licences is the detail worth carrying onto this page: the tool's own gatekeeping treats a licence as something to verify before torrenting a model, which is exactly the discipline the MiMo-V2.6 caution above is arguing every licensee should apply and that a badge alone does not support.

Source note: [[2026-09-21]]

## 2026-09-18

**PrismML released Ternary Bonsai 2 27B on September 17 under Apache 2.0, with working kernels rather than a research artifact alone.** It compresses Qwen3.8 27B to ternary weights with FP16 group-wise scaling, landing at 1.76 effective bits per weight and a 5.9GB total footprint, 9x smaller than full precision while retaining 98.2% of aggregate benchmark performance, up from 95% retention on the first Bonsai 27B two months earlier. Custom low-bit kernels run it on NVIDIA GPUs via CUDA and on Mac, iPhone and iPad via MLX. This is what a permissive licence looks like when it is backed by a real repository: a stated licence, open weights, and running code, none of which MiMo-V2.6 shipped four days later. ([PrismML](https://prismml.com/news/bonsai-2-27b))

**Qwen shipped Qwen3.8-Omni-Flash the same day with the opposite problem: closed weights rather than an ambiguous licence.** It takes text, images, audio and video in a single request, holds a 1M-token context window, and is priced at \$0.15 per million input tokens and \$0.47 per million output. Every benchmark figure is vendor-reported, weights are not open, self-hosting is not offered, and access is via QwenCloud, Alibaba Cloud Model Studio, and Qwen Studio. There is no version to pin, because there are no weights to pin it to. Where MiMo-V2.6 raises the question of what a licence tag actually grants, Qwen3.8-Omni-Flash raises the prior question: an open-weight licensing decision cannot even be evaluated for a model that never publishes weights at all. ([Qwen release writeup](https://www.marktechpost.com/2026/09/18/alibaba-qwen-releases-qwen3-8-omni-flash/))

Source note: [[2026-09-18]]

## On the radar

- `⚠️ CAUTION` **A model-card licence tag as the licence**, a `license:` line in Hugging Face card frontmatter renders a badge but grants nothing, carries no copyright notice and names no licensor; MiMo-V2.6 ships the tag with no LICENSE file in either repository. [[2026-09-22]]
- `🔵 TRIAL` `⚠️` **MiMo-V2.6-Pro and MiMo-V2.6-Flash**, 1.02T/42B and 309B/15B mixture-of-experts at a 1M-token context with text, image, video and audio input, weights downloadable and independently priced below the comparable median; every vendor benchmark is self-reported, the licence is a bare model-card frontmatter tag with no LICENSE file, and Flash's parameter count differs between card and paper. [[2026-09-22]]
- `🟡 ASSESS` `⚠️` **Heretic automated abliteration**, directional ablation plus a Tree-structured Parzen Estimator optimiser strips refusals from any open-weight model in one command, author-reported as matching hand-tuned baselines at a third of the distributional shift; an input to open-weight licensing decisions rather than a tool most teams pilot. [[2026-09-22]]
- `🟡 ASSESS` **Ternary weights with FP16 group-wise scaling (Bonsai 2 27B)**, 1.76 effective bits and a 5.9GB footprint for a 27B model under Apache 2.0; no per-task breakdown behind the aggregate retention figure. [[2026-09-18]]
- `🔵 TRIAL` `⚠️` **Qwen3.8-Omni-Flash**, omni-modal input at a 1M-token context and sharply lower audio pricing; every figure is vendor-reported and the weights are closed, so no version can be pinned. [[2026-09-18]]
- `🔵 TRIAL` `⚠️` **StepFun Step 5 Preview**, 600B total and 27B active at a 1M-token context for \$1.00 input and \$2.70 output per million tokens, with open weights scheduled for Oct 15, 2026; every capability figure is vendor-reported and until then the only access is a Chinese-hosted API. [[2026-09-21]]

## Related

[[Topics/Sovereign AI Compute|Sovereign AI Compute]] · [[Topics/Token Cost and Model Routing|Token Cost and Model Routing]] · [[Topics/AI Research Provenance Disputes|AI Research Provenance Disputes]] · [[Topics/Jev and Decision Models|Jev and Decision Models]]
