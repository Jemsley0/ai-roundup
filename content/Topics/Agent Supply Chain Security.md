---
type: topic
tags: [topic, agent-supply-chain-security]
updated: 2026-10-30
living: true
---

# Agent Supply Chain Security

Attacks on the components an agent installs, resolves, or trusts, rather than on the model's behaviour. Plugin pins and marketplaces, package registries, Model Context Protocol server configurations and the credentials inside them, and training artefacts reachable from a repository an agent is allowed to maintain.

## Where this stands

Attacks on the components an agent installs, resolves or trusts keep landing, and the model behaves correctly in each. This thread is separate from AI Safety and Interpretability because safety work does not touch it. By September 29, 2026 it held seven incidents: Plugin4Shell, infostealers harvesting Model Context Protocol configurations, a forum-to-production identity chain, an agent retraining and redeploying its own model, theft of a release-pipeline publish token, a shared flaw in the official Model Context Protocol Python client, and chained Agentforce flaws. Plugin4Shell remains the strongest item. All four major coding agents resolved a pinned plugin commit with `git checkout` and none checked where it landed, so a branch named after the pinned hash ran instead. Two are patched, GitHub Copilot has no patch, and Gemini CLI will not get one. The radar dropped its caution on a pinned commit SHA as a trust boundary on October 26, 2026, after 35 days with no new instance.

The newest cases are package and credential theft that a pin or an attestation does not stop. JFrog reported on October 21 that `litellm` 1.107.0 on PyPI added files that steal credentials at Python start-up and run attacker code hourly from a GitHub dead drop. PyPI removed it the same day. LiteLLM published its root cause on October 23. It says a master key for its Agent Platform sat in a public repository from May 27 and was never revoked. The attacker used it on October 10, stole three GitHub command-line interface OAuth tokens, and pointed the release workflow at a lookalike fork on October 21. The release was approved with a token, not the usual physical-device approval, and the artifacts were live for about two hours. LiteLLM confirms four Docker tags were removed or repointed to clean images, though its post lists no remediation steps. The safe version is 1.106.2. Wiz Research says a campaign it calls Gheist planted secret-dumping workflows on more than 13,500 branches across 850 or more GitHub accounts with stolen tokens, and that GitHub's July 28 hold on workflow runs stopped every public one. The hold does not cover private repositories or GitHub Enterprise Server, and Wiz sells detection and is the only source. Earlier, Socket and StepSecurity said `tensorlake@0.5.144` carried the Shai-Hulud worm and was published with valid npm provenance, so an attestation says where a package was built, not that the code is safe. GitGuardian says GhostAction targeted more than 30,000 repositories, far above the 345 the roundup first reported. Bloom Security says npm trusted publishing bound to a repository name, not its numeric ID, left 1,500-plus packages claimable after a rename.

Shared dependencies and credentials leak elsewhere too. Node.js fixed a Brotli decoder flaw, CVE-2026-111497, on October 21 in 22.23.4, 24.22.1 and 26.12.1, and bundled copies in DuckDB and Apache Arrow were unpatched on October 26. Google and Mozilla disclosures say keys for eight eMudhra intermediate certificate authorities used insufficient randomness, and the fix path is certifi 2026.10.19 or later. Nobody knows whether attackers have used it against non-browser clients. OpenCode says an attacker reached "a legacy system" and exposed provider keys saved by 1.4% of its Console users, and it blames "a large-scale distillation attack" with no public evidence. Pydantic AI's maintainers say provider-native MCP configuration could expose server URLs and authorization tokens in OpenTelemetry traces, fixed in 2.58.0. ProjectDiscovery shows a merged low-rank adaptation adapter making a coding agent steal credentials on a trigger while benchmarks stay clean, in a 7B-model demo from a vendor that sells AI penetration testing. Lumen's Black Lotus Labs says the PoeLLM botnet has infected over 3,400 exposed AI servers through a LiteLLM test-endpoint flaw.

Drift and indirect control continue. Two single-author projects report that Model Context Protocol tool definitions change without notice, which supports hashing and diffing tool manifests, now backed by the maintainers' local-server guide and Microsoft Agent Framework origin pinning. A sample of 2,999 repositories found 46.0% of local server configs run without a version pin. A study found prompt-injection detectors do not transfer between benchmarks, and another reports that steering an agent down pre-approved branches defeats dual-model defences, with a 0% result for its own defence from authors who built both sides. Glow Labs says coding agents asked to prove a user-interface fix created public GitHub repositories for screenshots and leaked internal images from over 300 organisations. The common gap is verification after the fact. Each case satisfied authorization, and none checked that the resulting state matched it.

## Open questions

- Does LiteLLM publish remediation steps for the 1.107.0 compromise, and does it move release approval back to a physical device?
- Does an independent source confirm Wiz's count of 13,500 Gheist branches, and does GitHub extend its hold on workflow runs to private repositories?
- Do the bundled Brotli copies in DuckDB and Apache Arrow get patched, and does an exploit appear in the wild?
- Have attackers used the eMudhra intermediate keys against non-browser clients?
- How did the attackers take about 1,900 GitHub accounts for GhostAction, and does an independent source confirm GitGuardian's 30,000-repository count?
- No CVE identifiers were issued for Plugin4Shell, so no advisory feed can consume it, and detecting unpatched Copilot at scale is unanswered.
- No plugin installer verifies the resolved commit against the pin after checkout, though the fix is two lines.
- Do marketplace operators verify what they pin, or only record an author-supplied hash?
- No guidance says what to rotate when a developer workstation running agents is compromised and its tool configurations are stolen.
- How often does a fine-tuning script and checkpoint actually sit inside a repository an agent maintains, and does a merged adapter trigger show up outside a vendor demo?
- Is the stolen-publish-token case representative of AI tooling vendors, and does any audit of their token handling exist?
- Will deployed clients actually pass the explicit `issuer=` that the fixed Model Context Protocol Python client requires, or only bump the version?
- Which other agent platforms combine untrusted-record reading, rich-content rendering and sensitive tool access, as the Agentforce chain did?
- Does NVIDIA dispute the OpenShell fail-open findings, and will the filesystem default gain a fail-closed option?
- Do the manifest-drift findings replicate outside two single-author projects, and do reference servers change tools silently in practice?
- Does the branch-steering defence reach 0% attack success when someone other than its authors tests it?
- Which agent platforms offer a sanctioned private destination for evidence, so agents stop improvising public hosting?
- Does any registry or provenance scheme add a check beyond build origin, given that the `tensorlake` worm shipped with valid provenance?
- Does LMCache ship a patched release, since none existed as of October 8, 2026?

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

- `🟡 ASSESS` `⚠️` **NVIDIA OpenShell and the Open Agent Safety Platform**. [[2026-09-29]]
- `🟡 ASSESS` **Pin-and-diff MCP tool manifests**. (was [[2026-10-08]]) [[2026-10-26]]
- `⚠️ CAUTION` **CI release-pipeline token theft as a package-supply-chain vector**. (was [[2026-09-23]]) [[2026-10-26]]
- `⚠️ CAUTION` **Fine-tuning scripts and model checkpoints inside a repository an agent is allowed to maintain**. (was [[2026-09-18]]) [[2026-10-21]]
- `⚠️ CAUTION` **A coding agent improvising public hosting for evidence it was asked to produce**. [[2026-10-02]]
- `⚠️ CAUTION` **Package provenance attestations as a safety signal**. [[2026-10-08]]
- `⚫ DROPPED` **A pinned commit SHA as a plugin trust boundary**. [[2026-09-21]], removed [[2026-10-26]]
- `⚫ DROPPED` **Consumer SSO federated into a third-party-hosted community forum**. [[2026-09-18]], removed [[2026-10-21]]

## Related

[[Topics/Agentic SDLC Governance|Agentic SDLC Governance]] · [[Topics/MCP|MCP]] · [[Topics/AI Safety and Interpretability|AI Safety and Interpretability]] · [[Topics/Agent-Driven Intrusions|Agent-Driven Intrusions]] · [[Topics/Agent Sandboxing and Execution Policy|Agent Sandboxing and Execution Policy]]
