---
type: topic
tags: [topic, open-weights-and-licensing]
updated: 2026-10-26
living: true
---

# Open Weights and Licensing

The licence terms attached to downloadable model weights, and what they permit: permissive versus research-only relicensing, where the licence actually lives in a repository, and tooling that changes what a licensee can do with the weights once they hold them.

## Where this stands

The licence is the variable that decides whether an open-weight model is usable, and it moves in both directions at once. Xiaomi's MiMo-V2.6 shipped weights, a technical report and independent pricing, but its only licence is a bare `license: mit` tag in the model card frontmatter, with no LICENSE file, no copyright notice and no named licensor. Alibaba took Qwen-Image-2.1 from Apache 2.0 to a research-only licence on September 20, 2026. PrismML and Jared Palmer's Kev shipped real Apache 2.0 releases with training code and evaluation data. The radar keeps a caution on a model-card licence tag standing in for the licence, re-argued on October 26, 2026.

The pipeline is mostly promises with dates, and the licence is often the missing field. MiniMax promised M3.1 Flash weights for October 23. They are now on Hugging Face under a `minimax-community` licence whose terms need reading, with vendor-reported benchmarks and conflicting sources on model size. Reflection AI released Beam weights under Apache 2.0 on October 16, a 501B-total, 23B-active model. Meta released an 816B open-weight model on October 15, reported as Muse Spark Open with a 1M-token context and no licence stated. Mistral says Large 4 (1 trillion parameters, 52 billion active) will release weights by the end of October with neither a licence nor a context window stated. StepFun promised Step 5 weights for October 15, and the radar dropped the entry on October 26 with no follow-up in 35 days. The radar also dropped MiMo-V2.6 on the same day, after 34 days without follow-up. Google released EmbeddingGemma 2 under Apache 2.0 with an 8K context.

Licence reading now reaches below the model. Rampart, an in-browser PII redaction tool, uses a content licence, and the October 12 note says using it would need a ruling on CC BY 4.0 for code. Context Mode, an MCP server that keeps raw tool output out of context, is under Elastic 2.0, which is not open source in the Open Source Initiative sense. Graphify reads Apache-2.0 through the GitHub API beside a bundled MIT file. Cloudflare's Clef-Omni is an open-weight decision model, and Microsoft-Decision-1 post-trains Qwen3.5-9B, but no licence text for either has been read. Every release needs a read of the actual LICENSE file, the vendor's prior licences on the same product line, and whether the weights are open at all.

Tooling and policy also limit what any licence can protect. Heretic strips trained refusals from an open-weight model in one command, and Anthropic's Frontier Red Team reported abliteration cutting refusals from 95 percent to under 14 percent on GLM-5.3. The US Center for AI Standards and Innovation independently assessed the same model. Both bodies put open-weight cyber capability about four months behind the frontier, and Anthropic asked governments to test successors. Commenters read the Anthropic report as pre-listing lobbying against open weights, so the framing is contested even though the measurements are not. ProjectDiscovery says a merged low-rank adaptation adapter can make a coding agent steal credentials on a trigger while benchmarks stay clean. A 7B model in Codex CLI fired 50 of 50 times, in a small-model demo from a vendor that sells AI penetration testing. China's proposal to add 23 AI technologies to its export-control list (Bloomberg via Techmeme, October 16, headline only) could affect where Chinese-lab weights keep appearing.

## Open questions

- What do the `minimax-community` licence terms permit commercially, and which M3.1 Flash size figure is correct?
- Will Mistral publish Large 4 weights by the end of October 2026, and under which licence and context window?
- What licence does Meta's Muse Spark Open carry, and do Beam's weights hold up under independent measurement of Reflection's own figures?
- Did StepFun publish Step 5 weights after its October 15 date, and under which licence?
- Will Xiaomi add a LICENSE file and narrative licence text to the MiMo-V2.6 repositories, or does the frontmatter tag stand?
- Is the Qwen-Image-2.1 relicensing specific to that product line, or the start of a move away from Apache 2.0 across Qwen?
- Do Cloudflare Clef-Omni and Microsoft-Decision-1 ship under licences that permit commercial use?
- If governments act on the four-months-behind finding, does that change how labs write open-weight licences or whether they publish weights at all?
- Does China's proposed export-control list, if adopted, cover model weights, and does it change what Chinese labs release?
- Does any independent party reproduce the merged-adapter credential-theft result outside a vendor demo?

## 2026-10-26

![[2026-10-26#^models-minimax-flash]]

![[2026-10-26#^radar-licence-tag]]

Source note: [[2026-10-26]]

## 2026-10-21

![[2026-10-21#^sec-lora-backdoor]]

![[2026-10-21#^models-minimax-deepseek-caching]]

Source note: [[2026-10-21]]

## 2026-10-17

![[2026-10-17#^headline-open-weights]]

![[2026-10-17#^models-meta-reflection]]

![[2026-10-17#^policy-china-export]]

Source note: [[2026-10-17]]

## 2026-10-12

![[2026-10-12#^spotlight-rampart]]

![[2026-10-12#^prac-context-mode]]

![[2026-10-12#^agent-decision-models]]

![[2026-10-12#^radar-rampart]]

Source note: [[2026-10-12]]

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

- `⚫ DROPPED` **MiMo-V2.6-Pro and MiMo-V2.6-Flash**. [[2026-09-22]], removed [[2026-10-26]]
- `⚫ DROPPED` **StepFun Step 5 Preview**. [[2026-09-21]], removed [[2026-10-26]]
- `⚫ DROPPED` **Heretic automated abliteration**. [[2026-09-22]], removed [[2026-10-26]]
- `◻️ WATCH` **Rampart in-browser PII redaction**. [[2026-10-12]]
- `⚠️ CAUTION` **A model-card licence tag as the licence**. (was [[2026-09-22]]) [[2026-10-26]]
- `⚫ DROPPED` **Ternary weights with FP16 group-wise scaling (Bonsai 2 27B)**. [[2026-09-18]], removed [[2026-10-21]]
- `⚫ DROPPED` **Qwen3.8-Omni-Flash**. [[2026-09-18]], removed [[2026-10-21]]

## Related

[[Topics/Sovereign AI Compute|Sovereign AI Compute]] · [[Topics/Token Cost and Model Routing|Token Cost and Model Routing]] · [[Topics/AI Research Provenance Disputes|AI Research Provenance Disputes]] · [[Topics/Jev and Decision Models|Jev and Decision Models]]
