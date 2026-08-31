# AI Governance Kit

### Give your coding agents the manual before they start pressing buttons.

![AI Governance Kit](assets/ai-governance-kit-banner.jpg)

**Clear project rules. Smaller files. Honest checks. Fewer robot-shaped surprises.**

[Install](#-install-in-one-command) · [Meet the kit](#-what-the-kit-teaches-your-agent) · [Use it](#-pick-your-mission) · [Get help](#-more-help-less-panic)

---

## 🤖 Your AI agent is clever. Your project is complicated.

Without clear guidance, a coding agent has to guess how your project works.
Sometimes it guesses brilliantly. Sometimes it confidently builds a 2,000-line
mega-file, follows the wrong pattern, skips the important check, and announces:
_“Done!”_

![A cheerful coding robot creates a chaotic tower of code blocks](assets/governance-chaos.png)

That is not because the agent is useless. It is because your project's most
important rules are scattered across code, documentation, tooling, and human
memory.

**AI Governance Kit gives the agent one reliable map before it starts moving
the furniture.**

It helps Codex and Claude understand:

- 🧭 which project documents are authoritative;
- 🧱 how the different parts of your project fit together;
- ❤️ what user behaviour must never accidentally break;
- ✍️ how changes should be written and organised;
- 🧪 which checks must run before work is called complete;
- 🙋 when your approval is required; and
- 🚨 how to report unfinished or uncertain work honestly.

> **The goal:** less context wasted rediscovering your project, fewer giant
> files, and fewer “technically it passed one test” victory laps.

---

## ⚡ Install in one command

The installer supports macOS and Linux. Paste this into your terminal:

```bash
curl -fsSL https://github.com/SimonMo88/ai-governance-kit/releases/latest/download/install.sh | sh
```

That installs the newest tested version for **Codex** and **Claude Code**. It
does not change any of your projects yet. No surprise renovations. 🛠️

Then check everything arrived safely:

```bash
ai-governance status
ai-governance doctor
```

Need Windows setup or another installation method? Visit the
[installation guide](docs/installation.md).

### Terminal command or AI command?

- `ai-governance ...` goes in your computer's **terminal**.
- `$ai-governance ...` goes in your conversation with **Codex**.
- `/ai-governance ...` goes in **Claude Code**.

---

## 🧰 What the kit teaches your agent

### 🗺️ A map of the project

The agent learns which instructions to trust, where responsibilities live, and
which documents own architecture, testing, security, and product behaviour.

### 🧩 Boundaries that make sense

Instead of pouring every new idea into the nearest file, the agent gets guidance
on ownership, dependencies, file size, and when code should be split.

### 🛡️ Rules for the things that must not break

Important product and operational behaviour becomes explicit. The agent knows
which invariants to preserve and who can approve an intentional exception.

### ✅ A real definition of “done”

The kit connects written expectations to the checks your repository actually
has. Missing enforcement stays visible instead of being promoted to imaginary
green ticks.

### ⏪ Local governance history

Bootstrap and upgrade keep recoverable, repository-local history under
`.ai-governance/`. The folder is ignored by Git, so it does not clutter your
commits.

---

## 🎮 Pick your mission

Use these prompts inside Codex. In Claude Code, replace `$ai-governance` with
`/ai-governance`.

### 🌱 Start fresh

Add governance to a project that does not have it yet:

```text
$ai-governance bootstrap
```

The agent inspects your repository, asks you about the policies that need owner
judgement, and builds guidance around the project you actually have.

### 🔧 Upgrade existing guidance

Improve and clarify governance already living in a project:

```text
$ai-governance upgrade
```

Stronger local rules are preserved. Duplicate or contradictory guidance is
carefully untangled instead of flattened by a template steamroller.

### 🔍 Find the “trust me, bro” checks

Compare written rules with what your tooling really enforces:

```text
$ai-governance assess enforcement
```

The assessment is read-only first. You choose which gaps are worth improving
before anything changes.

### 🧹 Refactor one folder

Improve how code is organised in a bounded part of the project:

```text
$ai-governance refactor folder src/payments
```

### 🏗️ Refactor the whole project

Review and improve all eligible project-owned files:

```text
$ai-governance refactor project
```

Downloaded, generated, and temporary files are excluded. This is the big one;
it can take considerably longer than a folder review. Pack snacks. 🍿

---

## 🔩 Keep the kit healthy

<details>
<summary><strong>Check, update, repair, roll back, or uninstall</strong></summary>

### Check the installation

```bash
ai-governance status
ai-governance doctor
```

### Update or roll back

```bash
ai-governance update
ai-governance rollback
```

### Repair or uninstall

Run `ai-governance doctor` first. It will explain the problem and provide the
appropriate repair command.

```bash
ai-governance repair --target codex
ai-governance uninstall
```

You can also use `$ai-governance status`, `doctor`, `update`, `rollback`,
`repair`, or `uninstall` in a Codex conversation. The agent will explain changes
and follow its normal approval rules.

</details>

---

## 🧠 A few reassuring facts

- Installing the kit changes **your computer's agent setup**, not your projects.
- Bootstrap, upgrade, and refactor can change project files; review them before
  committing.
- Status and doctor are read-only.
- Running a refactor command in the terminal prints the appropriate AI prompt;
  it does not secretly refactor your project behind the curtain.
- Governance adapts to the repository. Your project remains the authority.

---

## 🆘 More help, less panic

- [Installation and updates](docs/installation.md)
- [All terminal commands](docs/commands.md)
- [Ways to use the kit](docs/workflows.md)
- [Troubleshooting](docs/troubleshooting.md)
- [What gets added to a project](ADOPTION.md)
- [How maintainers publish a release](docs/releasing.md)

### Build boldly. Check properly. Let the tiny robots read the manual. 🤖✨
