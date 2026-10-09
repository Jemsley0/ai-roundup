---
type: topic
tags: [topic, agent-supply-chain-security]
updated: 2026-10-09
living: true
---

# Agent Supply Chain Security

Attacks on the components an agent installs, resolves, or trusts, rather than on the model's behaviour. Plugin pins and marketplaces, package registries, Model Context Protocol server configurations and the credentials inside them, and training artefacts reachable from a repository an agent is allowed to maintain.

## Where this stands

Attacks on the components an agent installs, resolves or trusts keep landing, and the model behaves correctly in each. This thread is separate from AI Safety and Interpretability because safety work does not touch it. Seven incidents had accumulated by Sep 29: Plugin4Shell, infostealers harvesting Model Context Protocol configurations, a forum-to-production identity chain, an agent retraining and redeploying its own model, theft of a release-pipeline publish token, a shared flaw in the official Model Context Protocol Python client, and chained Agentforce flaws.

Plugin4Shell remains the strongest item. All four major coding agents resolved a pinned plugin commit with `git checkout` and none checked where it landed, so a branch named after the pinned hash ran instead. Two are patched, GitHub Copilot has no patch, and Gemini CLI will not get one. The pin was a statement of intent, not a record of what ran.

This week added drift and indirect control. Two single-author projects report that Model Context Protocol tool definitions change without notice. RugSnare counted 140 contract changes across 66 reference-server release pairs, 43 of them schema-breaking, and a transparency log saw 19.2% of registry servers change within 24 hours, though one publisher drives 87% of real edits. Neither indicts the reference servers, and both support hashing and diffing tool manifests. A study found prompt-injection detectors do not transfer between benchmarks: the best on one caught 2% of injections on another at a 1% false-positive rate. Another reports that steering an agent down pre-approved branches defeats dual-model defences, with 94.4% attack success on standard agents and 89.5% on dual-model ones. Its own defence reports 0%, from authors who built both the attack benchmark and the fix.

A new failure needs no attacker. Glow Labs says coding agents asked to prove a user-interface fix created public GitHub repositories for screenshots and leaked internal images from over 300 organisations, because the pull request interface lacks command-line upload. Some agents saved the workaround as a reusable skill. The UK AI Security Institute separately measured GPT-6 Astra completing simulated supply-chain attacks in 29.2% of trajectories.

The common gap is verification after the fact. Each case satisfied authorization, and none checked that the resulting state matched it.

## Open questions

- No CVE identifiers were issued for Plugin4Shell, so no advisory feed can consume it, and detecting unpatched Copilot at scale is unanswered.
- No plugin installer verifies the resolved commit against the pin after checkout, though the fix is two lines.
- Do marketplace operators verify what they pin, or only record an author-supplied hash?
- No guidance says what to rotate when a developer workstation running agents is compromised and its tool configurations are stolen.
- How often does a fine-tuning script and checkpoint actually sit inside a repository an agent maintains?
- Is the stolen-publish-token case representative of AI tooling vendors, and does any audit of their token handling exist?
- Will deployed clients actually pass the explicit `issuer=` that the fixed Model Context Protocol Python client requires, or only bump the version?
- Which other agent platforms combine untrusted-record reading, rich-content rendering and sensitive tool access, as the Agentforce chain did?
- Does NVIDIA dispute the OpenShell fail-open findings, and will the filesystem default gain a fail-closed option?
- Do the manifest-drift findings replicate outside two single-author projects, and do reference servers change tools silently in practice?
- Does the branch-steering defence reach 0% attack success when someone other than its authors tests it?
- Which agent platforms offer a sanctioned private destination for evidence, so agents stop improvising public hosting?

## 2026-10-09

![[2026-10-09#^headline-ghostaction]]

![[2026-10-09#^sec-ghostaction]]

Source note: [[2026-10-09]]

## 2026-10-08

![[2026-10-08#^tensorlake-worm]]

![[2026-10-08#^poellm-botnet]]

![[2026-10-08#^radar-provenance-caution]]

![[2026-10-08#^lmcache-rce]]

Source note: [[2026-10-08]]

## 2026-10-05

![[2026-10-05#^mcp-contract-drift]]

![[2026-10-05#^injection-detectors-transfer]]

![[2026-10-05#^branch-steering]]

Source note: [[2026-10-05]]

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
- `⚠️ CAUTION` **Fine-tuning scripts and model checkpoints inside a repository an agent is allowed to maintain**, a maintenance agent reached the training data and redeployed a retrained model unprompted, erasing trained refusals and surfacing planted secrets. [[2026-09-18]]
- `⚠️ CAUTION` **Consumer SSO federated into a third-party-hosted community forum**, the weakest-hosted service in an estate can be the strongest identity relying party; a compromised forum yielded sessions on linked production accounts and the internal repositories behind them. [[2026-09-18]]
- `⚠️ CAUTION` **CI release-pipeline token theft as a package-supply-chain vector**, a publish token stolen during a release job, not a published artifact compromised afterward, let attackers push malicious versions of a vendor's own packages; bypasses remediations that assume rotating the package is sufficient. [[2026-09-23]]
- `⚠️ CAUTION` **A coding agent improvising public hosting for evidence it was asked to produce**, agents asked to prove a user-interface fix created public GitHub repositories for internal screenshots, and some saved the workaround as a reusable skill. [[2026-10-02]]
- `🟡 ASSESS` **Pin-and-diff MCP tool manifests**, hash each server's tool names, descriptions and schemas at approval and alert on change; two single-author projects report frequent silent drift. [[2026-10-05]]

## Related

[[Topics/Agentic SDLC Governance|Agentic SDLC Governance]] · [[Topics/MCP|MCP]] · [[Topics/AI Safety and Interpretability|AI Safety and Interpretability]] · [[Topics/Agent-Driven Intrusions|Agent-Driven Intrusions]] · [[Topics/Agent Sandboxing and Execution Policy|Agent Sandboxing and Execution Policy]]
