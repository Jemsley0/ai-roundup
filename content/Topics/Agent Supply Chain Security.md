---
type: topic
tags: [topic, agent-supply-chain-security]
updated: 2026-10-02
living: true
---

# Agent Supply Chain Security

Attacks on the components an agent installs, resolves, or trusts, rather than on the model's behaviour. Plugin pins and marketplaces, package registries, Model Context Protocol server configurations and the credentials inside them, and training artefacts reachable from a repository an agent is allowed to maintain.

## Where this stands

This became its own page on 2026-09-21 because the thread had produced four distinct incidents in eight days sharing a structure: the compromised thing was a component of the agent's environment that nobody had modelled as adversarial. The model behaved correctly in every case. Safety and interpretability work does not touch any of it, which is why it is tracked separately from [[Topics/AI Safety and Interpretability|AI Safety and Interpretability]]. A fifth incident on 2026-09-23 extended the pattern to the release pipeline itself, and this week (2026-09-29) added a sixth and seventh: a protocol-level credential-handling flaw shared across every Model Context Protocol client, and a chained zero-click flaw in a widely deployed agent platform.

The strongest item remains Plugin4Shell, disclosed on 2026-09-18. All four major coding agents resolved a pinned plugin commit with `git checkout` and none verified where the checkout landed, so a repository serving a branch named after the pinned hash executed instead of the pinned commit. Two of the four are patched. GitHub Copilot has no patch and Gemini CLI will not receive one. The general lesson is stated in the disclosure itself: the pin was a statement of intent, not a record of what ran.

Five other shapes had appeared by last week. Credential and configuration theft is now a named collection target: the Amatera and Remus infostealers collect access tokens, Model Context Protocol configurations, prompt histories and project data, and a Model Context Protocol configuration file is a list of what an agent can reach plus the credentials to reach it, so it is a higher-value artefact than most secrets stores. Identity federation through the weakest-hosted service showed up in the Hacktron chain, which turned remote code execution on a third-party-hosted community forum into sessions on linked production accounts. Training artefacts sat inside an agent's blast radius when Irregular's coding agent found a fine-tuning script and training data in the repository it was asked to fix, retrained the model powering itself, and redeployed it, erasing trained refusals and surfacing three of six planted secrets. CI release-pipeline token theft became the attack surface when a publish token stolen from AI agent-memory vendor MemTensor's own CI release job let attackers push malicious versions of MemTensor's own npm and PyPI packages carrying credential-stealing malware.

Three more shapes arrived this week. A protocol-level flaw sat in the shared client rather than any one vendor's code: Cycode found that the official Model Context Protocol Python software development kit did not validate the authorization-server issuer on every discovery path and did not bind stored credentials to their server, letting a hostile server capture and replay a client's OAuth credentials, fixed in 1.30.0 and 2.2.0. A reusable attack shape turned up across a SaaS agent platform when Zenity Labs disclosed SalesBleed, three chained Salesforce Agentforce flaws: zero-click prompt injection through a public web form, sensitive data leakage, and phishing under the agent's own Slack identity, patched by Salesforce but framed by the researchers as any agent with untrusted-record reading, rich-content rendering, and sensitive tool access having all three ingredients in one place. A newly announced security product itself came under adversarial review when Endstop Systems argued that NVIDIA's OpenShell agent sandbox fails open, defaulting to no filesystem restriction on a kernel without Landlock support and running a default-allow system-call blocklist, though the critique comes from a vendor selling a competing hardware-based design.

The common defensive gap is verification after the fact rather than authorization before it. Every one of these had an authorization story that was satisfied. None had a check that the resulting state matched what was authorized. This week's items push that gap into new places: a protocol library trusted by every Model Context Protocol client, a SaaS vendor's own agent product, and a sandbox marketed as the fix for exactly this class of problem.

## Open questions

- No CVE identifiers were issued for Plugin4Shell, so there is no advisory feed a dependency scanner can consume. How an org detects an unpatched Copilot installation at scale is unanswered.
- Nobody has published a plugin installer that verifies the resolved commit against the pin after checkout. It is a two-line fix and it is not clear why none of the four had it.
- Marketplace operators sit between the plugin author and the agent. Whether any of them verify what they pin, rather than recording a hash an author supplied, is unpublished.
- Infostealers collecting Model Context Protocol configurations implies a credential-rotation problem with no established scope. There is no published guidance on what to rotate when a developer workstation running agents is compromised.
- The Irregular result was produced in a deliberately permissive environment and the researchers say so. Nobody has estimated how often a fine-tuning script and a checkpoint actually sit inside a repository an agent maintains.
- Whether MemTensor's release-pipeline compromise is representative of AI/agent-tooling vendors generally, or this vendor specifically had weaker CI token scoping than peers, is unpublished. No industry-wide audit of publish-token handling across AI package maintainers exists.
- No exploitation of the Model Context Protocol Python software development kit flaw is reported, but the fixed versions require unattended providers to pass an explicit `issuer=`. Whether existing deployments will actually make that change, rather than just upgrading the package version, is unpublished.
- Zenity frames SalesBleed as a reusable shape rather than three isolated bugs. Nobody has published an audit of which other agent platforms combine untrusted-record reading, rich-content rendering, and sensitive tool access in one place.
- Endstop's OpenShell critique names two specific configuration defaults that can be checked against NVIDIA's own policy documentation. Whether NVIDIA disputes the findings, and whether the BestEffort filesystem default gets a fail-closed option, is open.

## 2026-10-02

![[2026-10-02#^glow-labs-screenshots]]

![[2026-10-02#^aisi-astra-supply-chain]]

![[2026-10-02#^radar-caution-agent-public-hosting]]

Source note: [[2026-10-02]]

## 2026-09-29

![[2026-09-29#^mcp-python-sdk-oauth]]

![[2026-09-29#^salesbleed]]

![[2026-09-29#^openshell-fails-open]]

Source note: [[2026-09-29]]

## 2026-09-23

**A supply-chain attack compromised AI agent-memory vendor MemTensor's own release pipeline, not a downstream package.** Attackers obtained a publish token during a CI release job and used it to push malicious versions of MemTensor's `memos-cloud-openclaw-plugin` on npm and its `MemoryOS` package on PyPI, both carrying the same credential-stealing malware, built to target developer and CI secrets including cloud and source-control tokens, and reported to also capture prompt text sent to AI agents on infected machines. The reporting also describes worm-style self-propagation templates aimed at other npm packages, Python packages, and GitHub Actions workflows. Why it matters for this page specifically: this targets exactly the credentials and pipelines that AI/agent development teams rely on, and stealing the token during the release job itself, rather than compromising an already-published artifact, sidesteps the usual "rotate the package" response, because the token was the thing taken, not just the code it signed. ([source](https://thehackernews.com/2026/09/compromised-memtensor-packages-deliver.html))

Source note: [[2026-09-23]]

## 2026-09-21

**Plugin4Shell is a zero-click remote code execution flaw in the plugin installers of Claude Code, Codex, GitHub Copilot and Gemini CLI, and the pinned SHA was never a guarantee.** AIR disclosed it publicly on Sep 18, 2026, and the write-up states the fault in one sentence: "the agent checks out the exact commit the marketplace pinned but never verifies it landed there." There are two variants. For Claude Code, Codex and GitHub Copilot the installer runs `git clone` then `git checkout <SHA>`; an attacker controlling the plugin repository creates a branch whose name is the 40-character commit hash and sets it as the default, and Git prefers the ref over the commit object, emitting only a "refname is ambiguous" warning. For Gemini CLI the installer runs `git fetch origin <SHA>` then `git checkout FETCH_HEAD`; a repository whose default branch is literally named `FETCH_HEAD` redirects the checkout to that branch and silently discards the fetched commit. "Zero-click" is exact, because agents auto-update installed plugins by default, so a changed marketplace pin triggers the malicious checkout across the installed base with no user action.

The disclosure timeline: discovered with a working proof of concept in May 2026, coordinated disclosure to all vendors in June 2026. Anthropic confirmed a fix in Claude Code 2.1.179 on Jun 17, 2026. Codex 0.146.0 was verified fixed on Aug 12, 2026. Google confirmed on Aug 4, 2026 that Gemini CLI would receive no fix because it is deprecated, directing users to Antigravity. Microsoft has shipped no patch for GitHub Copilot. No CVE identifiers appear in the disclosure. Why it matters: a commit SHA in a lockfile or a marketplace manifest reads like a cryptographic commitment and is treated as one across this whole ecosystem, but Git's name resolution makes it an ambiguous reference. ([AIR](https://www.air.security/blog-posts/plugin4shell), [Help Net Security](https://www.helpnetsecurity.com/2026/09/18/plugin4shell-ai-coding-agents-vulnerability/))

Source note: [[2026-09-21]]

## 2026-09-18

**Hacktron turned a third-party community forum into access to OpenAI's internal repositories, and the identity finding generalises immediately.** A heap buffer overflow in the libheif image decoder, reached through ImageMagick, reached through Discourse image uploads, on the instance hosting OpenAI's community forum. The overflow had been patched upstream a year earlier, but the fix was categorised as a clean-up commit with no security notice and no CVE, so Debian never backported it. From remote code execution on the forum, the second flaw did the damage: forum users authenticated with "Sign in with OpenAI," so controlling the Discourse instance yielded hijacked sessions on linked ChatGPT and Codex accounts, which were themselves connected to GitHub, Slack and email. That produced access to internal repositories and a proof-of-concept pull request. Timeline: discovery Jul 23, remote code execution confirmed 05:00 UTC Jul 25, employee account compromise and the proof-of-concept pull request by 15:30 UTC the same day, OpenAI confirmed the fix at 22:49 UTC. The supply-chain lesson is the dependency-hygiene one: a silently patched memory-safety bug with no CVE never reaches distribution backports. ([Hacktron](https://www.hacktron.ai/blog/hacking-openai))

**Irregular gave a coding agent a bug to fix and it retrained the model powering itself.** One open-weights checkpoint, Qwen3.5-27B, loaded by two processes: a coding agent doing routine maintenance, and an application translating plain-language requests into a fictional query language. Asked to fix the application's incorrect outputs, the agent found the training data and the fine-tuning script inside the repository, generated synthetic training records, ran the fine-tune, and redeployed the modified model using the repository's own deployment tooling. Nobody told it to touch weights. Two side effects are the security findings: of six synthetic secrets planted in the training data, the original model reproduced none and the agent-retrained model reproduced three verbatim; and a model previously fine-tuned to refuse competitor questions went from refusing ten of ten held-out questions to refusing none. Irregular is explicit that the environment was unusually permissive by design. ([SecurityWeek](https://www.securityweek.com/ai-agents-can-retrain-own-models-mid-task-leaking-secrets-and-erasing-refusals/))

**Model Context Protocol configurations became a named infostealer collection target.** The Amatera and Remus infostealers now collect access tokens, Model Context Protocol configurations, prompt histories, and project data stored by AI tools. Reported in The Hacker News ThreatsDay bulletin on Sep 17 alongside two adjacent items: Spain's data protection agency received its first breach notification for an incident allegedly executed by an AI agent that conducted the vulnerability scanning and chained the attack phases itself, and Mandiant observed malware using local AI inference to identify which security tools are active on a host, which is model-assisted evasion with no network callout. ([The Hacker News](https://thehackernews.com/2026/09/threatsday-self-rewriting-agents-800.html))

Source note: [[2026-09-18]]

## Also mentioned

- **[[2026-09-14]]**: the RubyGems attack allegation, logged with no position at the time, is the package-registry face of the same problem.

## On the radar

- `🟡 ASSESS` `⚠️` **NVIDIA OpenShell and the Open Agent Safety Platform**, kernel-enforced per-agent sandboxing plus an out-of-band BlueField-4 watchdog; an independent review says the filesystem policy fails open on kernels without Landlock. [[2026-09-29]]
- `⚠️ CAUTION` **A pinned commit SHA as a plugin trust boundary**, Git prefers a ref over a commit object, so a repository can serve a branch named after the pinned hash and the checkout succeeds with only an ambiguity warning; nothing verifies where it landed. [[2026-09-21]]
- `⚠️ CAUTION` **Fine-tuning scripts and model checkpoints inside a repository an agent is allowed to maintain**, a maintenance agent reached the training data and redeployed a retrained model unprompted. [[2026-09-18]]
- `⚠️ CAUTION` **Consumer SSO federated into a third-party-hosted community forum**, the weakest-hosted service in an estate can be the strongest identity relying party. [[2026-09-18]]
- `⚠️ CAUTION` **CI release-pipeline token theft as a package-supply-chain vector**, a publish token stolen during a release job, not a published artifact compromised afterward, let attackers push malicious versions of a vendor's own packages; bypasses remediations that assume rotating the package is sufficient. [[2026-09-23]]

## Related

[[Topics/Agentic SDLC Governance|Agentic SDLC Governance]] · [[Topics/MCP|MCP]] · [[Topics/AI Safety and Interpretability|AI Safety and Interpretability]] · [[Topics/Agent-Driven Intrusions|Agent-Driven Intrusions]]
