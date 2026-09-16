---
type: topic
tags: [topic, content-provenance, crawler-controls]
updated: 2026-09-16
living: true
---

# Content Provenance and Crawler Controls

The two-sided fight over who may read the web and who can prove what a file is. On the publisher side, crawler purpose controls and the collateral damage to archives. On the artifact side, hardware-rooted signing against post-processing metadata chains.

## Where this stands

Cloudflare has split crawler purpose into three separate controls, Search, Training, and Agent, replacing the blunt `Block AI Bots` toggle. The publisher-facing headline is `Disallow AI Training`, which publishes a robots.txt `Disallow` that mixed-use crawlers honour for training while continuing to crawl for search. Apple, Google, and Microsoft honour it; Amazon, Anthropic, Meta, and OpenAI are designated Accountable because they run separate search and training crawlers. Operators that have not agreed to honour it get blocked outright once the setting is on. Agent traffic is governed separately by "Block on pages with ads," because agents create no search-discoverability tradeoff to preserve.

On the artifact side, Apple Reference Image signs photos at the sensor before any processing, which is a direct architectural argument against C2PA's model of attaching provenance metadata after capture and certifying the edit history from that point forward. The claimed advantage is that a compromise anywhere in a C2PA editing chain is undetectable to a viewer.

The collateral damage is already visible. The Internet Archive's Wayback Machine is under waves of high-volume automated traffic, its protections are catching real people, and it cannot automate bot detection.

## Open questions

- Both sides constrain what an agent doing live retrieval can reach and what it can trust once it gets there. No agent framework currently models partial reachability as a first-class condition.
- Apple Reference Image covers the main sensor only, with no signature on ultrawide or telephoto shots, which bounds what it can prove. Whether that is a v1 gap or structural is unstated.
- Cloudflare's Accountable designation depends on operators self-committing. There is no published mechanism for verifying compliance or de-listing an operator that stops honouring it.
- News sites blocking the Wayback Machine because AI companies circumvent their blocks by reading archived copies is a genuine tragedy-of-the-commons with no proposed fix.

## 2026-09-16

**Correction to the 09-15 note: Cloudflare did not ship a crawler block, it shipped a publisher-side opt-out.** The 09-15 note said undeclared mixed-use crawlers "are now blocked entirely on ad-supported pages," which inverts the mechanism. The Sep 15 announcement is a **`Disallow AI Training`** setting that publishes a `Disallow` directive in your robots.txt, which mixed-use crawlers honour for *training* while still crawling you for *search*, which is the tradeoff the feature exists to remove. Apple, Google, and Microsoft honour it and are designated **"Accountable,"** as are Amazon, Anthropic, Meta, and OpenAI, which run separate search and training crawlers. The Accountable designation recognises operators meeting four requirements: opt-out mechanisms for training and summaries, URL-level visibility into training usage, and assurance that refusing training will not harm search rankings. Operators that have not agreed to honour it get blocked outright once the setting is on, which is the only part of the 09-15 framing that survives. **Agent traffic is governed by a separate control, "Block on pages with ads,"** because agents create no search-discoverability tradeoff to preserve. `Block AI Bots` is deprecated in favour of the granular Search, Training, and Agent split, and Managed Robots.txt is replaced by Bot Preference Sync, with existing preferences converting automatically. ([Cloudflare](https://blog.cloudflare.com/accountable-mixed-use-ai-crawlers/))

**Apple Reference Image signs photos at the sensor, before any processing, and Apple argues that is the only place worth signing.** 384 points and 251 comments on Hacker News. The case against C2PA is that it attaches provenance metadata *after* capture and then certifies the edit history from that point forward, which means a compromise anywhere in the editing chain is undetectable to a viewer. Reference Image instead adds a cryptographic signature the moment the sensor captures, ahead of image processing, and Apple built a chain-of-verification it describes as the only image provenance system with quantum-secure defences. The privacy argument is separate and sharper: C2PA binds images to identity-based credentials tied to a device or a person, while Reference Image is designed so that **an observer cannot tell two photos came from the same iPhone.** The limitation is real and worth quoting when anyone repeats the marketing: it covers the **main sensor only**, with no signature on ultrawide or telephoto shots. iPhone 18 Pro. ([Apple Security Research](https://security.apple.com/blog/apple-reference-image/), [AppleInsider](https://appleinsider.com/articles/26/09/16/apple-reference-image-is-a-mammoth-effort-to-combat-ai-edited-photos), [Android Authority on the C2PA comparison](https://www.androidauthority.com/apple-reference-image-vs-android-c2pa-3711734/))

**The Internet Archive said the Wayback Machine is under waves of high-volume automated traffic.** Director Mark Graham's protections are catching real people, the 429 page has been rewritten, and the Archive is asking blocked humans to email in their browser and IP because it cannot tell them from bots automatically. The broader context is worse than a capacity problem: news sites have been blocking the Wayback Machine from saving their pages specifically because AI companies circumvent site-level AI blocks by reading the archived copies instead. The archive is absorbing the cost of a fight it is not a party to. ([Digital Information World](https://www.digitalinformationworld.com/2026/09/internet-archives-wayback-machine.html))

Source note: [[2026-09-16]]

## 2026-09-15

**Cloudflare's crawler-purpose controls took effect, and the first reading of them in this log was wrong.** The item as originally written said crawlers that will not declare per-request whether they are indexing for search or collecting for training and agents are now blocked entirely on ad-supported pages, with defaults applying to new customers, new sites from existing customers, and every existing free-tier account, and existing paying customers able to override. The publisher-side logic was described as coherent, meaning stay discoverable in search and stop feeding answer engines for free, with the second-order effect that any agent doing live web retrieval had just lost reachability on a large slice of the ad-supported web. The direction of the second-order effect holds. The mechanism described does not, and was corrected the following day. ([TechCrunch on the original policy](https://techcrunch.com/2026/07/01/cloudflares-new-policy-pushes-ai-companies-to-pay-for-publishers-content/))

Source note: [[2026-09-15]]

## On the radar

- `🔵 TRIAL` **Cloudflare `Disallow AI Training` setting**. [[2026-09-16]]
- `🟡 ASSESS` **Apple Reference Image sensor-level provenance**. [[2026-09-16]]
- `⚠️ CAUTION` **Agent web-fetch reachability**. The degradation comes from the ads-page agent control and per-site training opt-outs, not from a purpose-declaration requirement. [[2026-09-15]], corrected [[2026-09-16]]

## Related

[[Topics/AI Research Provenance Disputes|AI Research Provenance Disputes]] · [[Topics/Agent Memory and Context Engineering|Agent Memory and Context Engineering]]
