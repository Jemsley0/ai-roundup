---
type: topic
tags: [topic, agent-supply-chain-security]
updated: 2026-11-16
living: true
---

# Agent Supply Chain Security

Attacks on the components an agent installs, resolves, or trusts, rather than on the model's behaviour. Plugin pins and marketplaces, package registries, Model Context Protocol server configurations and the credentials inside them, and training artefacts reachable from a repository an agent is allowed to maintain.

## Where this stands

Attacks on the components an agent installs, resolves or trusts keep landing, and the model behaves correctly in each. This thread is separate from AI Safety and Interpretability because safety work does not touch it. Plugin4Shell remains the strongest single item: all four major coding agents resolved a pinned plugin commit with `git checkout` and none checked where it landed, so a branch named after the pinned hash ran instead. Two are patched, GitHub Copilot has no patch, and Gemini CLI will not get one. The radar dropped its caution on a pinned commit SHA as a trust boundary on October 26 after 35 days with no new instance. The newer pattern is that a pin, a version check or an attestation passes while the compromise stands.

The provenance caution now has a second instance. StepSecurity and Socket say `bee-js` 13.3.0 on npm carried valid provenance although an unsigned commit under the release identity published it (November 9), after `tensorlake@0.5.144` shipped the Shai-Hulud worm with valid provenance. An attestation says where a package was built, not that the code is safe, and the radar entry moved on November 16. StepSecurity, the only source, also says a campaign it calls "WFX Phantom" pushes a secret stealer from compromised GitHub accounts, then reverts and deletes the run, with more than 63,000 probe pull requests by November 12. Earlier campaigns remain: Wiz's Gheist (13,500 branches across 850 or more accounts, stopped for public repositories by GitHub's July 28 hold on workflow runs, with Wiz the only source) and GitGuardian's GhostAction (more than 30,000 repositories). Bloom Security says npm trusted publishing bound to a repository name, not its numeric ID, left 1,500-plus packages claimable after a rename.

Vendor-held credentials are the other live route this week. Wiz says an actor used a Qubole-associated Amazon account to assume IAM roles customers created for Qubole in October, and every request carried a valid External ID, so an External ID alone did not protect the trust. The actor then read Lambda environment variables and Secrets Manager, and there is no victim count or Qubole statement. Notion says Fireworks kept data from Notion AI chats, for fewer than 1% of workspaces, against a contractual zero-retention promise, and BleepingComputer reports an earlier Fireworks breach exposed API keys and a second incident at an unnamed cloud provider reached billing data and incomplete model weights. Railway says an attacker escaped build isolation and reached a decryption credential through a misconfigured OpenID Connect binding, that "AI provider keys were the primary target", and that unauthorised spend reached about \$740,000 (November 10). The radar added two cautions on November 16: a contractual zero-retention promise is not a control, and an External ID is not enough on a cross-account trust.

LiteLLM remains the case study for remediation. Its October root cause was a master key left in a public repository from May 27, used on October 10, with a release approved by token and live for about two hours. It now marks its November 15 post-attack commitments done, but the table carries no change dates, so the statuses are self-reported. Its 1.111.0-dev.4 build turns spend-log token redaction off by default, and `cosign verify --key` fails because releases since 1.111.0-dev.3 use Sigstore keyless signing. The safe lines are 1.108.9 on long-term support and 1.106.2 for older proxies, and never 1.107.0. LiteLLM also said on October 30 that its most severe fixes now ship privately to enterprise customers first, with no published plan for open-source users.

Marketplaces and shared dependencies leak too. A trojanized Claude Code extension, version 2.1.313, reached up to 5,000 Cursor users in about 11 hours on October 29 with no signing, and Anthropic says it did not build or publish it. A GitLab exploit (CVE-2026-97229) survived an upgrade to 19.3.6 because the fix lives in Ruby, so a version scan calls an image fixed when it is not. Bundled Brotli copies in DuckDB and Apache Arrow were unpatched after the Node.js fix, eMudhra intermediate certificate authority keys used insufficient randomness, and OpenCode exposed provider keys saved by 1.4% of its Console users. Pydantic AI fixed MCP tokens leaking into traces in 2.58.0. Two single-author projects report that MCP tool definitions drift without notice, and 46.0% of 2,999 sampled repositories run local server configs with no version pin. The common gap is verification after the fact: each case satisfied authorization, and none checked that the resulting state matched it.

## Open questions

- Does LiteLLM publish dated evidence for its self-reported commitments, meet its November 30 and December 31 dates, and publish a plan for open-source users now that its most severe fixes ship privately first?
- Does Qubole or Amazon give a victim count for the cross-account role abuse, and do other vendors with customer-created trust roles turn out to have the same exposure?
- Does Fireworks or Notion publish retention evidence that settles how long the chat data was kept, and does any inference vendor offer a verifiable zero-retention attestation?
- Does an independent source confirm StepSecurity's WFX Phantom count of 63,000 probe pull requests, and does GitHub's default block on `pull_request_target` (from December 2) blunt the campaign?
- Do registries add a check beyond build origin, given two cases (`tensorlake`, `bee-js`) with valid provenance and malicious code?
- Do Cursor, Open VSX or Anthropic publish how many hosts installed extension 2.1.313, and do marketplaces add publisher signing?
- Do version scanners learn to flag GitLab images pulled before October 27, given that a scan calls them fixed?
- Does an independent source confirm Wiz's count of 13,500 Gheist branches, and does GitHub extend its hold on workflow runs to private repositories?
- Do the bundled Brotli copies in DuckDB and Apache Arrow get patched, and have attackers used the eMudhra intermediate keys against non-browser clients?
- Does an independent source confirm GitGuardian's 30,000-repository GhostAction count?
- No CVE identifiers were issued for Plugin4Shell, so no advisory feed can consume it, and detecting unpatched Copilot at scale is unanswered.
- No plugin installer verifies the resolved commit against the pin after checkout, though the fix is two lines.
- No guidance says what to rotate when a developer workstation running agents is compromised and its tool configurations are stolen.
- How often does a fine-tuning script and checkpoint sit inside a repository an agent maintains, and does a merged adapter trigger show up outside a vendor demo?
- Is the stolen-publish-token case representative of AI tooling vendors, and does any audit of their token handling exist?
- Which other agent platforms combine untrusted-record reading, rich-content rendering and sensitive tool access, as the Agentforce chain did?
- Do the manifest-drift findings replicate outside two single-author projects, and do reference servers change tools silently in practice?
- Does the branch-steering defence reach 0% attack success when someone other than its authors tests it?
- Does LMCache ship a patched release, since none existed as of October 8?

## 2026-11-16

![[2026-11-16#^sec-wfx-phantom]]

![[2026-11-16#^sec-bee-js-provenance]]

![[2026-11-16#^sec-qubole-trust]]

![[2026-11-16#^sec-notion-fireworks]]

![[2026-11-16#^headline-notion-fireworks]]

![[2026-11-16#^ep-litellm]]

![[2026-11-16#^sec-railway]]

Source note: [[2026-11-16]]

## 2026-11-06

![[2026-11-06#^ep-litellm-controls]]

![[2026-11-06#^correction-claude-extension-statement]]

Source note: [[2026-11-06]]

## 2026-10-30

![[2026-10-30#^headline-claude-extension]]

![[2026-10-30#^security-claude-extension]]

![[2026-10-30#^security-gitlab-ruby-regex]]

![[2026-10-30#^ep-litellm-private-registry]]

![[2026-10-30#^radar-extension-auto-update]]

Source note: [[2026-10-30]]

## 2026-10-26

![[2026-10-26#^headline-litellm-root-cause]]

![[2026-10-26#^headline-brotli-cve]]

![[2026-10-26#^security-litellm-pointer]]

![[2026-10-26#^security-brotli]]

![[2026-10-26#^security-emudhra-certifi]]

![[2026-10-26#^security-gheist]]

![[2026-10-26#^radar-ci-token-theft]]

Source note: [[2026-10-26]]

## 2026-10-21

![[2026-10-21#^headline-litellm]]

![[2026-10-21#^sec-litellm-1107]]

![[2026-10-21#^ep-litellm-spend]]

![[2026-10-21#^agent-pydantic-mcp-fixes]]

![[2026-10-21#^sec-lora-backdoor]]

![[2026-10-21#^sec-opencode-console]]

![[2026-10-21#^rn-litellm]]

![[2026-10-21#^rn-pydantic-ai]]

![[2026-10-21#^rn-mcp-inspector]]

![[2026-10-21#^radar-checkpoint-caution]]

Source note: [[2026-10-21]]

## 2026-10-17

![[2026-10-17#^corr-ghostaction-gitguardian]]

![[2026-10-17#^sec-npm-slugfest]]

![[2026-10-17#^agent-mcp-unpinned]]

Source note: [[2026-10-17]]

## 2026-10-12

![[2026-10-12#^headline-ghostaction-scale]]

![[2026-10-12#^corr-ghostaction-scale]]

![[2026-10-12#^sec-subql-npm]]

![[2026-10-12#^sec-gtig-exploitation]]

Source note: [[2026-10-12]]

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

- `🟡 ASSESS` **Pin-and-diff MCP tool manifests**. (was [[2026-10-08]]) [[2026-10-26]]
- `⚠️ CAUTION` **CI release-pipeline token theft as a package-supply-chain vector**. (was [[2026-09-23]]) [[2026-10-26]]
- `⚠️ CAUTION` **Fine-tuning scripts and model checkpoints inside a repository an agent is allowed to maintain**. (was [[2026-09-18]]) [[2026-10-21]]
- `⚠️ CAUTION` **Package provenance attestations as a safety signal**. [[2026-10-08]], second instance [[2026-11-16]]
- `⚠️ CAUTION` **Auto-updating coding-agent extensions from a marketplace with no signing**. [[2026-10-30]]
- `⚠️ CAUTION` **A vendor's contractual zero-data-retention promise as the control**. [[2026-11-16]]
- `⚠️ CAUTION` **An External ID as the only protection on a cross-account IAM role trust**. [[2026-11-16]]
- `⚫ DROPPED` **NVIDIA OpenShell and the Open Agent Safety Platform**. [[2026-09-29]], removed [[2026-10-30]]
- `⚫ DROPPED` **A coding agent improvising public hosting for evidence it was asked to produce**. [[2026-10-02]], removed [[2026-11-06]]
- `⚫ DROPPED` **A pinned commit SHA as a plugin trust boundary**. [[2026-09-21]], removed [[2026-10-26]]
- `⚫ DROPPED` **Consumer SSO federated into a third-party-hosted community forum**. [[2026-09-18]], removed [[2026-10-21]]

## Related

[[Topics/Agentic SDLC Governance|Agentic SDLC Governance]] · [[Topics/MCP|MCP]] · [[Topics/AI Safety and Interpretability|AI Safety and Interpretability]] · [[Topics/Agent-Driven Intrusions|Agent-Driven Intrusions]] · [[Topics/Agent Sandboxing and Execution Policy|Agent Sandboxing and Execution Policy]]
