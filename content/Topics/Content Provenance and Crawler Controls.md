---
type: topic
tags: [topic, content-provenance, crawler-controls]
updated: 2026-10-05
living: true
---

# Content Provenance and Crawler Controls

The two-sided fight over who may read the web and who can prove what a file is. On the publisher side, crawler purpose controls and the collateral damage to archives. On the artifact side, hardware-rooted signing against post-processing metadata chains.

## Where this stands

Cloudflare split crawler purpose into three controls, Search, Training and Agent, replacing the blunt `Block AI Bots` toggle. `Disallow AI Training` publishes a robots.txt rule that mixed-use crawlers honour for training while they keep crawling for search. Apple, Google and Microsoft honour it. Amazon, Anthropic, Meta and OpenAI are designated Accountable because they run separate search and training crawlers. Agent traffic is governed separately by "Block on pages with ads".

Agent reachability now depends on commercial standoffs as well as crawler settings. Ben Thompson reads Amazon's block on Meta's Muse agent as the start of a fight between aggregators. A retailer with warehouses and delivery can refuse a browser-driving agent. A pure software aggregator cannot. A developer also reported sites blocking Muse when it was used as a scraper. Thompson's argument is analysis, not measurement, and the original Sep 22 piece is paywalled.

On the artifact side, Apple Reference Image signs photos at the sensor, an architectural argument against the Coalition for Content Provenance and Authenticity model of attaching metadata after capture. The litigation record supplies the opposing argument: unsealed New York Times filings include a 2023 Microsoft memo calling the scraping "the largest theft of labor in human history". The Wayback Machine, meanwhile, is catching real people in protections aimed at automated traffic.

Provenance is not uniformly protective. An essay argues that AI output traceability can run against the author, through a hidden signal embedded in their own writing. No such deployed system has been named.

## Open questions

- No agent framework models partial reachability, from crawler rules or commercial blocks, as a first-class condition.
- Apple Reference Image covers only the main sensor. Is that a version-one gap or structural?
- Cloudflare's Accountable designation depends on self-commitment, and no mechanism verifies compliance or removes an operator that stops honouring it.
- How much evidentiary weight does an internal partner memo carry when it is not an admission by the defendant?
- Will other retailers follow Amazon in blocking browser-driving agents, and does a software aggregator have any equivalent defence?
- Is there a deployed system that embeds an undeclared traceability signal in AI-generated text, and would it survive the tests applied to watermark detection?

## 2026-10-02

![[2026-10-02#^expanded-muse-aggregators]]

Source note: [[2026-10-02]]

## 2026-09-22

**A widely-read essay argues that AI output traceability as it actually ships is functionally covert tracking, not a watermark.** The piece draws a sharp line between a watermark, which is visible and declared, and what it calls "a hidden signal that makes your work traceable without your knowledge or consent". The mechanism it describes is embedding via pseudorandom token selection, designed to survive compression and re-encoding, so the signal persists through the ordinary lossy transformations a piece of writing goes through on its way around the internet. It drew 486 points and 120 comments.

Two caveats belong with this item as much as the argument does. It is argument, not new empirical work; no new measurement of any deployed system's traceability signal is presented. And the primary page could not be fetched directly here, so the quoted line above is high-confidence secondary sourcing rather than hand-verified against the original text.

Placed against what this page already tracks, provenance and traceability machinery has so far been a publisher-side and platform-side control: Cloudflare's crawler-purpose split, Apple's sensor-level signing, the New York Times litigation's argument for tracing where scraped content went. This is the first item on this page arguing that provenance machinery, in its actually-shipped form, cuts against the author rather than for them, a person's own writing carrying a signal that lets it be traced without having agreed to that, rather than a mechanism protecting a publisher's rights over content leaving their site.

Source note: [[2026-09-22]]

## 2026-09-18

**Unsealed filings in the New York Times case show a Microsoft director calling OpenAI's scraping "the largest theft of labor in human history."** Dr. Brent Hecht, Microsoft's Director of Applied Science, wrote in a Jan 2023 internal memo that the practice was "an astonishing theft of unprecedented proportions" and could create a "doom loop," arguing that large AI models "are a product that destroys its supply chain." The filings also record OpenAI's Nick Turley describing it as an "existential threat to publishers," and state that OpenAI's mid-training datasets alone contain more than 91,692 copies of works published by the New York Times, the Daily News and the Center for Investigative Reporting. The complaint alleges that the companies obtained and used the content by bypassing paywalls undetected, building training datasets through mass scraping, and deliberately stripping copyright notices from training data. Why it matters: this is the argument the Cloudflare training opt-out and the Apple provenance work are both engineered responses to, now on the record in an internal memo from inside the defendant's own partner, which changes its evidentiary weight in the litigation rather than just its rhetorical weight. [TechCrunch](https://techcrunch.com/2026/09/17/microsoft-exec-called-ai-scraping-the-largest-theft-of-labor-in-human-history-new-unredacted-filings-reveal/) · [Washington Post](https://www.washingtonpost.com/business/2026/09/17/microsoft-exec-called-ai-largest-theft-labor-history-court-records-show/)

Source note: [[2026-09-18]]

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
- `⚠️ CAUTION` **Agent web-fetch reachability**, corrected: the degradation comes from the ads-page agent control and per-site training opt-outs, not from a purpose-declaration requirement. [[2026-09-15]], corrected [[2026-09-16]]

## Related

[[Topics/AI Research Provenance Disputes|AI Research Provenance Disputes]] · [[Topics/Agent Memory and Context Engineering|Agent Memory and Context Engineering]]
