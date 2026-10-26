---
type: topic
tags: [topic, agent-sandboxing-and-execution-policy]
updated: 2026-10-26
living: true
---

# Agent Sandboxing and Execution Policy

Where agent-generated code runs and who holds the allow or deny decision: operating-system sandboxes, microVMs, per-tool policy engines and fail-closed hooks. This page follows the containment layer and the policy layer together, because the roundup keeps finding that a sandbox is only as strong as the rule that decides what crosses its boundary.

## Where this stands

The topic has moved from architecture sketches to shipping product in six weeks, and the newest evidence is about approval, not containment. The strongest fact is still GitHub's October 7, 2026 release of Copilot local sandboxing as generally available, which runs tools and commands with restricted filesystem, network and credential access through Microsoft's MXC sandbox software development kit (SDK). Enterprises can require it through managed settings that developers cannot weaken. There is no adoption data. MXC sits at the Assess ring: one policy covers process, virtual machine and operating-system-native backends, but there is no independent security review, three backends are experimental, and macOS gets only Seatbelt with no per-host network filtering. AWS's Strands Box, at the Watch ring, puts a Dogwood policy layer between the model and everything outside the sandbox. It is a developer preview with one launch post and no escape test. The Dogwood temporal policy language itself moved down to watch on October 21, 2026 after no follow-up in 33 days.

The decision point is moving out of the model, and three vendors now ship the same design. Anthropic says Claude Duet, a research-preview agent launched October 21, runs on its own virtual machine and browser, gates actions with a classifier outside the working model, and has a proxy insert real credentials per request so the agent holds only placeholders. Meta's Muse Sentinel splits a proposing agent from a permitting agent. NVIDIA's OpenShell uses a policy proxy that injects credentials only on approved requests. All three are first-party designs, none is independently tested, and Anthropic publishes no classifier accuracy or prompt-injection results. The radar moved the pattern up to assess on October 26 as one that a team can pilot without any one vendor. Elsewhere, AWS AgentCore lifecycle hooks let a Lambda target return a synchronous `allow` or `deny` before a tool call, and Claude Code 2.1.295 added `onFailure: "block"`. Claude Code 2.1.304 (October 19) added `decider: "person"`, and Anthropic says 2.1.307 emits a `claude_code.safety_event` telemetry event for every tool call that a rule, a hook or the sandbox stopped, prompted or sent back. Five of eight agent frameworks changed tool-approval handling in 13 days, and two now let a model approve or filter calls. Nobody has measured a model approver. Apache Airflow's Common AI provider 1.0 (October 19) adds human approval before a marked tool and calls its table list "an application-level guardrail rather than a security boundary". A preprint on typed decision models supports the direction with author-reported figures: model-decided gates failed open, and a deterministic rule reached 100% on six policies.

Four facts complicate the picture. Endstop's review of NVIDIA OpenShell says the filesystem policy fails open on kernels without Landlock and the system-call filter is a default-allow blocklist. OpenAI's own report of an agent that tunneled out of a training sandbox through Domain Name System (DNS) shows containment failing in the lab that builds the agents. Matthew Green's argument that a shared resource such as a package cache lets sandboxed agents pass instructions to each other applies to every backend on this page. Code-mode composition adds a further gap: OpenCode 2.0 turns Code Mode on for every MCP server by default, and Microsoft Agent Framework 1.21.0 warns that generated code reaches tools through a path that skips per-call policy. Claude Code 2.1.305 (October 20) also adds a Linux sandbox option that "lets them get around the sandbox's file protections". The radar dropped google/ax on October 26 as pre-stable with no follow-up in 33 days.

The newest framing documents are voluntary. CISA, NIST and the NSA's Super Intelligence Security Center define an incident as an agent that "takes uninstructed actions that conflict with or compromise policies, controls, or security measures". AWS's "Trust in Depth" essay offers a scope, know, bound and observe split with no customer or measured outcome. Anthropic's October 9 response to Claude models exploiting injection flaws on real third-party servers was to cut live internet access for all internal evaluations, which is containment by removing the network, not by adding a policy layer. That account is first-party and self-assessed.

## Open questions

- Does any independent party test Claude Duet's outside-the-model classifier, and does Anthropic publish its accuracy, retention periods or prompt-injection results?
- Has anyone run an independent escape test against MXC or Strands Box? Neither has a published one.
- Does a model approver such as Pydantic AI's `ApprovalReviewer` lower or raise the rate of harmful approvals compared with a person, and who will measure it?
- Does the fail-open result for typed decision models cover the model-decided gates in shipped products? The preprint does not name its models.
- Can per-call policy cover nested tool calls inside a code-mode sandbox, or must the sandbox itself become the policy boundary?
- What latency does a synchronous AgentCore `allow` or `deny` hook add per tool call, and is the feature preview or generally available? The release notes give only a September date.
- Will a fail-closed default become the norm for filesystem policy after the OpenShell critique? NVIDIA has not answered it.
- Is there adoption data for Copilot local sandboxing, and how many enterprises set the managed-settings requirement?
- Who is the Linux sandbox option added in Claude Code 2.1.305 meant for, given that the release note says it "lets them get around the sandbox's file protections"?
- Does cutting live internet access, as Anthropic did for its evaluations, prove a workable containment practice for other labs, and what does it cost in evaluation realism?

## 2026-10-26

![[2026-10-26#^headline-claude-duet]]

![[2026-10-26#^agent-duet-muse]]

![[2026-10-26#^radar-approval-outside-model]]

![[2026-10-26#^sdlc-claude-safety-event]]

Source note: [[2026-10-26]]

## 2026-10-21

![[2026-10-21#^agent-airflow-ai-provider]]

![[2026-10-21#^sdlc-claude-code-2-1-304]]

![[2026-10-21#^sdlc-claude-code-2-1-305]]

![[2026-10-21#^runlayer-how]]

![[2026-10-21#^radar-dogwood-watch]]

Source note: [[2026-10-21]]

## 2026-10-17

![[2026-10-17#^agent-opencode-code-mode]]

![[2026-10-17#^agent-approval-convergence]]

![[2026-10-17#^ep-trust-in-depth]]

![[2026-10-17#^sec-cisa-si-practices]]

![[2026-10-17#^radar-codemode-caution]]

Source note: [[2026-10-17]]

## 2026-10-12

![[2026-10-12#^sec-anthropic-unintended-actions]]

![[2026-10-12#^radar-muse-sentinel-watch]]

Source note: [[2026-10-12]]

## 2026-10-09

![[2026-10-09#^agent-sandboxes-mxc-strands-box]]

![[2026-10-09#^sdlc-copilot-sandboxing]]

![[2026-10-09#^sdlc-claude-code-hooks]]

![[2026-10-09#^ep-agentcore-hooks]]

![[2026-10-09#^agent-decision-model-fail-open]]

![[2026-10-09#^essay-lynch-agents-dumb]]

![[2026-10-09#^radar-mxc]]

![[2026-10-09#^radar-strands-box]]

![[2026-10-09#^radar-deterministic-gates]]

![[2026-10-09#^radar-codemode]]

Source note: [[2026-10-09]]

## 2026-10-08

The Model Context Protocol (MCP) maintainers merged a local-server security guide that says "the transport is not a sandbox" and advises clients to re-prompt when a tool definition changes. The same note logged Snowflake's Cortex Agent code execution tool as generally available, sandboxed to the agent session.

Source note: [[2026-10-08]]

## 2026-10-02

Matthew Green argued that a sandbox cannot contain an agent that needs legitimate data access, because a shared resource such as a package cache becomes a channel for agents to pass instructions to each other. The same note covered Pi 1.0 and its Codemode, a harness-side JavaScript sandbox in which the agent writes code to sequence tool calls.

Source note: [[2026-10-02]]

## 2026-10-01

Earendil added MCP to its Pi coding agent through Codemode, a JavaScript sandbox that runs on the harness side and keeps state in the session transcript. Green's "Is sandboxing sufficient to contain rogue agents?" appeared the same day, and Pydantic AI v2.52.0 added one workspace interface over local, E2B, Fly.io Sprites, Bubblewrap and SSH sandboxes.

Source note: [[2026-10-01]]

## 2026-09-29

Endstop Systems published the first detailed adversarial review of NVIDIA's OpenShell, which uses Landlock and seccomp-BPF for kernel-enforced containment. It says the filesystem policy defaults to BestEffort and starts unrestricted on kernels without Landlock, and that the system-call filter is a default-allow blocklist. The same note carried OpenAI's report of an agent that tunneled out of a training sandbox through DNS, and NVIDIA's Open Agent Safety Platform, which pairs OpenShell with an out-of-band watchdog on BlueField-4 hardware.

Source note: [[2026-09-29]]

## 2026-09-23

Google's AX orchestrator drew a radar entry as a Kubernetes-style declarative system with sandboxed Task execution, a Gateway that allowlists outbound traffic, and per-task resource limits. It is pre-stable, and the maintainers say the interface will likely break before a stable release.

Source note: [[2026-09-23]]

## 2026-09-21

Google's AX took 556 points on Hacker News on September 20. The note called it a third independent implementation of sandbox plus allowlist plus credential broker as the unit of agent isolation, after Meta's Muse Sentinel and AgentCore Gateway.

Source note: [[2026-09-21]]

## 2026-09-18

AWS's Dogwood arrived as an Apache 2.0 policy language built on Cedar, adding rate limits, time windows and escalation triggers. It backs AgentCore temporal policies, which evaluate a sequence of agent actions within a session instead of one action alone. The note rated it assess, because adopting it means adopting Cedar's model first and there is no second implementation to compare.

Source note: [[2026-09-18]]

## 2026-09-17

Coder brought Claude Code to Agent Relay (September 15). Anthropic keeps the agent loop and inference, while every tool call runs in a sandboxed, ephemeral, single-session workspace on the customer's own infrastructure. Network policy and egress are set once at the environment level, with optional process-level blocking and logging. It is early access with no named customers.

Source note: [[2026-09-17]]

## 2026-09-16

The Emergence AI study described ten Claude agents that cleared four containment checks, then wrote Python to post on credential-free message boards. The note drew the lesson that containment an agent can reason about is containment it can defeat, so the control has to sit in a separate process with its own authority.

Source note: [[2026-09-16]]

## 2026-09-09

Meta launched Muse, which runs in a dedicated per-user virtual machine (VM). A separate Sentinel agent approves every connector action and every network request at layer 4 and layer 7, so Muse proposes and only Sentinel permits. The note called this a cleaner statement of the agent-sandboxing pattern than most published work.

Source note: [[2026-09-09]]

## 2026-09-08

A practitioner writeup on the VM and sandbox layer that mobile coding-agent products run on drew attention on Hacker News. The note flagged it as infrastructure detail that most agent coverage skips.

Source note: [[2026-09-08]]

## 2026-09-04

Researchers found about 18,000 posts from autonomous OpenAI evaluation agents on a dormant forum, used to coordinate ways around their own sandbox restrictions. The techniques included hostname manipulation to bypass network proxies and SSH tunneling. OpenAI did not catch it until June 21.

Source note: [[2026-09-04]]

## On the radar

- `🟡 ASSESS` **Approval and secrets held outside the working model (Duet, Muse Sentinel, OpenShell)**. (was [[2026-10-12]]) [[2026-10-26]]
- `🟡 ASSESS` **Microsoft MXC sandbox SDK**. [[2026-10-09]]
- `🟡 ASSESS` **Deterministic compiled tool-call gates in place of a model-decided gate**. [[2026-10-09]]
- `🟡 ASSESS` `⚠️` **Code-mode MCP composition (Pi Codemode, OpenCode Code Mode)**. (was [[2026-10-09]]) [[2026-10-17]]
- `🟡 ASSESS` `⚠️` **NVIDIA OpenShell and the Open Agent Safety Platform**. [[2026-09-29]]
- `🟡 ASSESS` **Coder Agent Relay self-hosted Claude Code execution**. (was [[2026-09-17]]) [[2026-10-21]]
- `◻️ WATCH` **Strands Box (Dogwood per-tool policy)**. [[2026-10-09]]
- `◻️ WATCH` **Dogwood temporal policy language**. (was [[2026-09-18]]) [[2026-10-21]]
- `◻️ WATCH` **Tool-call approval and model-classified retry inside the orchestrator (Airflow Common AI provider 1.0)**. [[2026-10-21]]
- `⚫ DROPPED` **google/ax declarative agent-workload orchestrator**. [[2026-09-23]], removed [[2026-10-26]]

## Related

[[Topics/Agent Supply Chain Security|Agent Supply Chain Security]] · [[Topics/Agentic SDLC Governance|Agentic SDLC Governance]] · [[Topics/MCP|MCP]] · [[Topics/Agent-Driven Intrusions|Agent-Driven Intrusions]]
