---
type: topic
tags: [topic, sovereign-ai-compute]
updated: 2026-09-18
living: true
---

# Sovereign AI Compute

National and non-US compute independence: silicon, clusters, capital, and the policy instruments behind them. Tracked because it has stopped being a policy talking point and started producing shipped hardware and audited-enough production results.

## Where this stands

This became its own page on 2026-09-18, after a month in which the thread appeared in six separate notes and finally produced results rather than commitments. The shape of it is four distinct bets that get discussed as one thing and should not be.

**Domestic silicon that exists.** Fujitsu formally launched FUJITSU-MONAKA on Sep 14: a 144-core Armv9 server processor from four 36-core chiplets, 2nm compute cores with 5nm cache and input/output in a 3D-stacked design, sold both as standalone silicon and as a 1U server, global sales from Nov 2026, explicitly pitched at sovereign AI inference and including the defence sector. This is the most concrete item in the thread because it is a product with a ship date rather than a fund with a target.

**Domestic silicon that now demonstrably serves production traffic.** Z.ai reports running all production inference for GLM-5.3-Flash on a cluster of more than 100,000 Chinese-made accelerators, reaching hardware utilisation and per-token cost it describes as comparable to mainstream NVIDIA GPUs, after going from model adaptation to production in under two weeks. The figures are the company's own, but the claim is qualitatively different from a capacity announcement: it names the specific obstacles it hit, which is what an honest account of an immature ecosystem looks like.

**Capital treating sovereignty as an investable thesis.** Mistral's €3B Series D at a post-money valuation above €21B, the largest European tech equity round on record, was explicitly framed around sovereign open-weight AI: data, models, compute and production systems staying controllable and auditable inside a customer's boundary rather than routed through a US lab's API. India's semiconductor mission doubled to \$13.5B over 12 years and drew \$5B from Applied Materials and roughly ₹10,000 crore from Lam Research within the same week, against a starting position where India imports about 90 percent of its semiconductor needs. Canada and Germany's CAD \$300M LawZero commitment includes a Canadian sovereign compute partnership, which is the first instance in this thread of sovereignty and safety funding arriving in the same instrument.

**Capacity buildout that is sovereign-adjacent but vendor-anchored.** NVIDIA's up-to-2GW Australian commitment by 2027, across eight partners, more than doubles that country's total computing capacity but anchors all of it to NVIDIA's DSX platform. Whether that counts as sovereignty depends entirely on which dependency you were trying to remove, and it is the category most likely to be marketed as more than it is.

The policy layer cuts both ways. China's State Council Decree No. 841, effective Sep 15, expanded exit bans on engineers holding technology secrets, which is compute independence enforced on people rather than on supply chains. Huawei Cloud's Sep 18 launch of AgentArts with an open-source edition sharing over 90 percent of the enterprise kernel is the software face of the same strategy, and it is not available outside China until Dec 30.

The honest summary: the hardware bets are further along than the export-control framing usually assumes, and the "sovereign" label is doing a lot of work across four very different propositions.

## Open questions

- Z.ai's numbers are the only published account of large-scale Chinese-accelerator inference and they are self-reported. No independent measurement of utilisation or per-token cost on that cluster exists, and the comparison to NVIDIA is the load-bearing claim.
- FUJITSU-MONAKA ships in Nov 2026. There is no published independent benchmark, so the inference-per-watt case against incumbent parts is currently a specification argument.
- Composable Disaggregated Infrastructure and Compute Express Link are how MONAKA claims to address inference memory shortages. Nobody has published what disaggregated memory actually costs in latency for a serving workload.
- Anchoring 2GW of national capacity to a single vendor's platform removes a geographic dependency and deepens a supplier one. No government in this thread has published which of the two it was trying to reduce.
- "Sovereign" is used for data residency, model ownership, silicon provenance, and operator nationality interchangeably. No shared definition exists, which makes the funding figures in this thread non-comparable.
- An open-source agent platform kernel shared with a commercial edition is either a portability story or a cheaper on-ramp to one vendor's cloud. Huawei's December availability date is the first point at which anyone outside China can test which.

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

- `🟡 ASSESS` **Huawei Cloud AgentArts and openJiuwen**, nothing available outside China until Dec 30, 2026. [[2026-09-18]]

## Related

[[Topics/AI-Led AI Development|AI-Led AI Development]] · [[Topics/Agentic SDLC Governance|Agentic SDLC Governance]] · [[Topics/Token Cost and Model Routing|Token Cost and Model Routing]]
