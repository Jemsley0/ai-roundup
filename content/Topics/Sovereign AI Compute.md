---
type: topic
tags: [topic, sovereign-ai-compute]
updated: 2026-10-05
living: true
---

# Sovereign AI Compute

National and non-US compute independence: silicon, clusters, capital, and the policy instruments behind them. Tracked because it has stopped being a policy talking point and started producing shipped hardware and audited-enough production results.

## Where this stands

Sovereign AI compute has moved from policy talk to shipped hardware and production results, but the label covers five different bets that should not be read as one. This page became its own thread on 2026-09-18 after six notes carried it.

Domestic silicon with dates exists. Fujitsu's 144-core Armv9 FUJITSU-MONAKA processor ships globally from Nov 2026, pitched at sovereign inference including defence. Alibaba's T-Head Zhenwu V900 accelerator, with 216 GB of memory, is scheduled for mass production in the first quarter of 2027. Z.ai reports running all production inference for GLM-5.3-Flash on more than 100,000 Chinese-made accelerators at cost comparable to mainstream NVIDIA GPUs, a claim that is self-reported but names its obstacles. None of these has an independent benchmark.

Capital and capacity make up the other bets. Mistral's €3B Series D at over €21B was framed around sovereign open-weight AI. India doubled its semiconductor mission to \$13.5B. NVIDIA's up-to-2GW Australian commitment is vendor-anchored, so it removes a geographic dependency and deepens a supplier one. Capacity figures need reading against deployment: Alibaba's 500,000-card number is a cluster maximum, and its deployment claim is "over 650 customers".

Open weights act as a lever, not a commitment. Xiaomi gave away MiMo-V2.6-Pro under a bare MIT tag below the price median, StepFun promised Step 5 weights for Oct 15, and Alibaba tightened Qwen-Image-2.1 to research-only. This week Anthropic and the US Center for AI Standards and Innovation both put open-weight cyber capability about four months behind the frontier, which adds a security argument to the export-control debate that the US kept off its bilateral talks agenda.

## Open questions

- Naive AI has not shipped its model, so the claim that mid-training and post-training can replace pre-training is priced but untested.
- Is the Qwen-Image-2.1 research-only licence a line-specific decision or the start of a house change, with Qwen 4 still in training?
- Z.ai's inference cost and utilisation figures are self-reported. Does anyone measure them independently?
- MONAKA and the Zhenwu V900 have no published independent benchmarks, so inference-per-watt claims remain specifications.
- What does disaggregated memory over Compute Express Link cost in latency for a serving workload?
- Which trade is a government actually making when it anchors national capacity to one vendor's platform?
- No shared definition of "sovereign" exists across data residency, model ownership, silicon provenance and operator nationality, so funding and capacity figures are not comparable.
- Will Huawei's open-source agent platform kernel be portable, or a cheaper on-ramp to one cloud? December availability is the first test.
- Does the four-months-behind finding on open-weight cyber capability lead any government to restrict weight releases?

## 2026-10-02

![[2026-10-02#^glm-53-cyber]]

Source note: [[2026-10-02]]

## 2026-09-22

**Alibaba's Apsara Conference on September 22 was a full-stack sovereign compute announcement, and the widely repeated chip number is wrong.** T-Head unveiled the Zhenwu V900 accelerator with "216 GB of GPU memory and 1,200 GB/s of inter-chip bandwidth" and three times its predecessor's performance, scheduled for mass production in the first quarter of 2027. Secondary coverage across several outlets reported 500,000 units deployed. Alibaba's own release does not say that: the 500,000 figure is the maximum card count a supernode cluster architecture supports, and the actual deployment figure given is "over 650 customers" across automotive, finance, energy and manufacturing. On models, Alibaba said only that Qwen 4 is "currently in training", with Qwen 4.5 and Qwen 5 roadmapped at "5 to 10 trillion parameters". The four-tier Qwen 4 lineup circulating in trade press today appears in no first-party Alibaba text and should be treated as unverified. Alibaba Cloud chief executive Eddie Wu separately committed to surpassing 20GW of operated global datacenter capacity by 2032. For this page, the capacity-versus-deployment correction is the sharpest instance yet of the caution already carried above: a specification claim and a customer count are different claims, and the gap between them is where this category keeps getting marketed as more than it is.

**Xiaomi's MiMo-V2.6-Pro release belongs on this page as well as on the open-weights model thread, because permissive Chinese weights are the strategic-infrastructure bet this page already tracks.** Pro is a 1.02T-parameter mixture-of-experts model with 42B active parameters, a 1M-token context, and text, image, video and audio input, shipped under a bare `license: mit` tag in its Hugging Face model-card frontmatter with no LICENSE file in either repository. Artificial Analysis independently measured it at \$0.43 per million input tokens and \$0.87 per million output, against a \$0.45 and \$1.68 median for comparable models, and scored it 46 on its Intelligence Index against an open-weight median of 18. A trillion-parameter model out of a Chinese consumer-electronics company, priced below the field's median and downloadable now, is the strongest version yet of the thesis that permissive Chinese weights are becoming other countries' strategic infrastructure rather than marketing. The caution attached to it is specific and not about quality: a model-card frontmatter tag renders a badge, not a grant, and carries no copyright notice, so the licensing position is worth confirming in writing before anything depends on it.

Source note: [[2026-09-22]]

## 2026-09-21

**StepFun released Step 5 Preview on Sep 20 and the interesting part for this thread is the cost claim, not the capability claim.** A 600B-total, 27B-active sparse mixture of experts with a 1M-token context and native image input, at \$1.00 per million input tokens and \$2.70 per million output, with an Artificial Analysis Intelligence Index score of 44, and open weights scheduled for Oct 15, 2026. The announcement is titled "Advancing the Pareto Frontier," which is a claim about intelligence per dollar rather than about a top score. Every figure other than the pricing is vendor-reported. Where it lands in the four bets on this page: it is not a silicon story or a capital story, it is the third Chinese lab in a month to compete on price and open weights rather than on benchmark leadership, and the open-weights date is what converts it from a hosted service into something a buyer outside China can actually run. Until Oct 15 the only access is a Chinese-hosted API, which for a sovereignty thesis is the opposite of the point. ([MarkTechPost](https://www.marktechpost.com/2026/09/20/stepfun-launches-step-5-preview/))

**Alibaba moved Qwen-Image-2.1 off Apache 2.0 onto a research-only licence on the same day, which cuts against the same thesis.** The weights are published on Hugging Face and ModelScope, but the Qwen Research License Agreement dated Sep 20, 2026 grants rights for non-commercial purposes only and requires a separately requested licence for commercial use. The previous Qwen-Image generation was Apache 2.0. The model itself is consumer image generation and out of scope, but the licence regression is directly on-thread: the open-weights posture of Chinese labs is a strategic lever rather than a standing commitment, and it moved in both directions within hours on the same day. Anyone whose sovereignty argument rests on permissive Chinese weights now has to read each release rather than assume a house position. ([Qwen-Image-2.1](https://github.com/QwenLM/Qwen-Image-2.1))

**A seven-month-old Beijing startup reached a \$1.42B valuation on the premise that it will not pre-train its model.** Naive AI was founded in February 2026 by Tsinghua professor Jifeng Dai, has raised \$400M across three rounds (\$100M, \$180M and \$120M) from investors including Tencent, and has fewer than 100 employees. The model, also called Naive, is being built on an existing Chinese open-weight model, with the company's differentiation concentrated in mid-training and post-training, and is expected to ship as open weights. This is a fifth bet, distinct from the four already on this page, and it is a bet about the cost structure of sovereignty rather than about hardware or capital. If the pre-training run is a commodity input rentable from someone else's permissive release, the capital required to found a competitive national lab falls by an order of magnitude, and the open-weight releases from Qwen, DeepSeek and StepFun become strategic infrastructure for other people's companies rather than marketing. It also makes the Qwen licence regression above materially more consequential, since that infrastructure is only load-bearing while the licence holds. ([The Information](https://www.theinformation.com/articles/tsinghua-professors-stealth-llm-startup-hits-1-4-billion-valuation))

**The US proposed a bilateral AI incident-notification mechanism with China, and explicitly kept export controls off that table.** Treasury Secretary Scott Bessent closed roughly eight hours of talks with Vice Premier He Lifeng in New York on Sunday, Sep 20, by proposing a new US-China AI dialogue including a notification system for AI-related incidents rising to a national-security level, to be put to Trump and Xi at their summit this week. US Trade Representative Jamieson Greer stated that export controls on advanced AI chips and semiconductor manufacturing equipment were not on the agenda for the AI mechanism talks. Trump and Xi first discussed AI consultations in Beijing in May 2026 and that forum was never formalised. For this page the second sentence is the one that matters: the instrument that actually shapes compute sovereignty is being held outside the dialogue that is being offered about it. ([CNN](https://edition.cnn.com/2026/09/20/business/us-china-trade-talks-ai-intl-hnk))

Source note: [[2026-09-21]]

## 2026-09-18

**Z.ai published a technical account of serving GLM-5.3-Flash on more than 100,000 Chinese-made accelerators.** The build went from initial model adaptation to production readiness in under two weeks, with end-to-end throughput rising 3.2x from the initial baseline, reaching hardware utilisation and per-token cost the company describes as comparable to mainstream NVIDIA GPUs. Z.ai says no one had previously run a cluster of Chinese-made accelerators at this scale. The obstacles it names are specific and worth more than the headline: limited on-chip memory capacity and bandwidth, a new model architecture, a 1M-token context window, multimodal requests, and an immature ecosystem where kernel support was incomplete and engineers had to guess at behaviour that should have been documented. Much of the optimisation work was carried out by an "Infra Agent" powered by GLM-5.3 rather than by infrastructure engineers alone, which is the other half of the story and is tracked on [[Topics/AI-Led AI Development|AI-Led AI Development]]. All figures are Z.ai's own. [Z.ai](https://z.ai/blog/glm-built-its-inference-infrastructure)

**Fujitsu formally launched FUJITSU-MONAKA and the MONAKA Server on Sep 14.** It is a 144-core Armv9 server processor built from four 36-core compute chiplets, combining a 2nm process for compute cores with 5nm for cache and input/output in a 3D-stacked design. Global sales start in Nov 2026, sold both as standalone silicon to cloud and data-centre operators, server manufacturers and other infrastructure providers, and as a 1U server to enterprises, academia, high-performance computing and the defence sector across Japan and Europe. The server uses Composable Disaggregated Infrastructure and Compute Express Link so memory and accelerators can be allocated beyond a single server's physical boundary, which Fujitsu positions against the memory shortages typical of AI inference, alongside claims about resource utilisation and adaptability to future workloads. Why it matters: a second credible non-US sovereign inference platform in the same month as the Z.ai result, and the only one in this thread with a shipping date. [Fujitsu](https://global.fujitsu/en-global/pr/news/2026/09/14-02)

**Canada and Germany's LawZero commitment includes a Canadian sovereign compute partnership.** Up to CAD \$300M, split evenly, announced Sep 17 at the ALL IN conference in Montréal, funding a Berlin office, the sovereign compute partnership, an expanded international research team, and compute infrastructure. Why it belongs here: it is the first instance in this thread of sovereignty funding and safety funding arriving in the same instrument, rather than sovereignty being justified on industrial-policy grounds alone. [LawZero](https://lawzero.org/en/news/lawzero-receives-commitment-300m-joint-funding-canada-and-germany)

**Huawei Cloud launched AgentArts globally at HUAWEI CONNECT 2026 on Sep 18, with an open-source edition.** The open-source edition, openJiuwen, shares more than 90 percent of its kernel with the enterprise edition. Huawei says AgentArts already serves over 100 enterprises and will be commercially available outside China from Dec 30. Dr. Peter Zhou also announced the global launch of the latest AI Cluster Service at the same keynote. Why it belongs here as well as on [[Topics/Agentic SDLC Governance|Agentic SDLC Governance]]: an open-source core is a portability argument, and portability is the software half of the compute-independence case. [Huawei Cloud](https://europeanbusinessmagazine.com/huawei-cloud-rolls-out-enterprise-ai-products-across-the-board-building-an-open-agentic-cloud)

Source note: [[2026-09-18]]

## 2026-09-17

**India raised its semiconductor mission to \$13.5B and drew two large equipment commitments the same week.** Narendra Modi launched the second phase at SEMICON India 2026, up from \$8B in phase one and running 12 years, now allowing foreign firms to partner with Indian startups, design houses, and entities owned by Overseas Citizens of India. Applied Materials committed \$5B over ten years under a plan it calls India Vision 2035, including a 140-acre research park and a tenfold increase in its India-based supply-chain capacity by 2035. Lam Research committed roughly ₹10,000 crore to its first silicon component manufacturing facility in India, covering ingot production and processing for leading-edge nodes. India currently imports about 90 percent of its semiconductor needs. [ThePrint](https://theprint.in/tech/5-pillars-12-yrs-13-5-bn-outlay-modi-launches-2nd-phase-of-chip-mission-at-semicon-india/3045265/)

Source note: [[2026-09-17]]

## 2026-09-15

**China's State Council Decree No. 841 took effect, expanding exit bans on engineers holding technology secrets.** Compute independence enforced on people rather than on supply chains, and the only instrument in this thread that works by restricting movement. [FT](https://www.ft.com/content/3f2b2172-0c1a-4708-aba2-559eb37eabc8)

Source note: [[2026-09-15]]

## 2026-09-10

**NVIDIA announced up to 2GW of AI capacity in Australia by 2027 with eight partners.** Firmus, Sharon AI, IREN, Megaport, ResetData, CDC, NEXTDC, and AirTrunk. Australia's total computing capacity at the time was roughly 1.6GW, so this more than doubles the national load. All of it is anchored to NVIDIA's DSX platform: IREN is applying DSX to its 800MW Bundey campus in South Australia, and Sharon AI is deploying up to 68,000 GPUs on Quantum InfiniBand and Spectrum-X. Sovereign-adjacent rather than sovereign, because the dependency being removed is geographic and the one being deepened is on a single supplier. [NVIDIA](https://nvidianews.nvidia.com/news/nvidia-expands-ai-infrastructure-capacity-in-partnership-with-australias-data-center-ecosystem)

Source note: [[2026-09-10]]

## 2026-09-08

**Mistral raised €3B in a Series D at a post-money valuation above €21B, the largest equity round ever for a European tech company.** Samsung led, with EQT's Scaleup Europe Fund and existing investor PSG Equity co-leading. The money is explicitly framed around sovereign open-weight AI: data, models, compute, and production systems that stay controllable and auditable inside a customer's boundary, not routed through a US frontier lab's API. Mistral serves 125-plus enterprises including Airbus, ASML, and HSBC across 20 countries. This was the clearest data point at the time that sovereign AI had become an investable thesis on its own rather than an EU policy talking point. [TechCrunch](https://techcrunch.com/2026/09/08/mistral-raises-e3b-as-sovereign-ai-becomes-big-business/) · [Mistral](https://mistral.ai/news/mistral-makes-sovereign-open-weight-ai-to-frontier/)

Source note: [[2026-09-08]]

## Also mentioned

- **[[2026-09-16]]**: Mistral and Mozilla put Mistral models behind Firefox Smart Window, with the multilingual pitch named as the one axis where a European lab has a defensible story against the US frontier.
- **[[2026-09-04]]**: Gimlet Labs multi-silicon inference, logged without a position.

## On the radar

- `🔵 TRIAL` `⚠️` **MiMo-V2.6-Pro and MiMo-V2.6-Flash**, 1.02T/42B and 309B/15B mixture-of-experts at a 1M-token context with text, image, video and audio input, weights downloadable and independently priced below the comparable median; every vendor benchmark is self-reported, the licence is a bare model-card frontmatter tag with no LICENSE file, and Flash's parameter count differs between card and paper. [[2026-09-22]]
- `🔵 TRIAL` `⚠️` **StepFun Step 5 Preview**, 600B total and 27B active at a 1M-token context for \$1.00 input and \$2.70 output per million tokens, with open weights scheduled for Oct 15, 2026; every capability figure is vendor-reported and until then the only access is a Chinese-hosted API. [[2026-09-21]]
- `🟡 ASSESS` **Huawei Cloud AgentArts and openJiuwen**, an enterprise agent platform with an open-source edition sharing over 90% of the enterprise kernel; nothing available outside China until Dec 30, 2026. [[2026-09-18]]

## Related

[[Topics/AI-Led AI Development|AI-Led AI Development]] · [[Topics/Agentic SDLC Governance|Agentic SDLC Governance]] · [[Topics/Token Cost and Model Routing|Token Cost and Model Routing]] · [[Topics/Open Weights and Licensing|Open Weights and Licensing]] · [[Topics/Frontier Lab Economics|Frontier Lab Economics]]
