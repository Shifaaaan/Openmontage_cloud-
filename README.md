# OpenMontage Cloud (Android-friendly)

A minimal cloud-workspace launcher for [OpenMontage](https://github.com/calesthio/OpenMontage). This repository does **not** fork or copy the upstream project; it clones upstream into the Codespaces workspace when you run setup.

## Zero-cost-first approach

- Uses GitHub Codespaces within the free account quota, if your account has quota available.
- Installs free open-source tooling and OpenMontage's documented setup.
- Does not add API keys, enable paid services, deploy anything, or make paid API calls automatically.
- For the first render, use OpenMontage's zero-key workflow: Piper TTS, free/open footage, Remotion/HyperFrames, and FFmpeg.
- Cloud video/image providers may cost money. Do not add provider keys or approve paid generation if your budget is ₹0.

**Important:** Free Codespaces quotas are limited and can change. Rendering time and dependency downloads consume quota/storage. A compatible coding agent is still required for OpenMontage's agent-orchestrated production workflow. This repository cannot grant agent access or guarantee a free AI model.

## Start from an Android phone

1. Open this repository in GitHub: `https://github.com/Shifaaaan/Openmontage_cloud-`.
2. Tap **Code → Codespaces → Create codespace on main**. If Codespaces is unavailable or asks for billing, stop; do not enable paid usage.
3. Wait for the browser VS Code editor to load.
4. Open **Terminal → New Terminal**.
5. Run:

   ```bash
   bash scripts/setup-openmontage.sh
   ```

6. When setup completes, open the `OpenMontage` folder in your compatible coding agent, or follow that agent's documented Codespaces instructions.
7. Ask it to make a **20-second test video**, use real footage or stills that are permitted for reuse, Piper TTS, and local rendering only. Explicitly prohibit paid API calls and ask it to stop before any chargeable action.

## What setup does

- Checks for Python, Node.js, Git and Make.
- Installs FFmpeg if the environment supports apt and sudo.
- Clones the official upstream repository into `OpenMontage/` (does not alter this launcher repository).
- Runs upstream `make setup` only after asking for confirmation.

## Manual setup and troubleshooting

If the script stops on a missing dependency, follow the message it prints. You can run setup again safely; it will not overwrite an existing `OpenMontage/` folder.

If `make setup` fails, open the upstream README and report the first useful error:

- [OpenMontage README](https://github.com/calesthio/OpenMontage/blob/main/README.md)
- [OpenMontage provider guide](https://github.com/calesthio/OpenMontage/blob/main/docs/PROVIDERS.md)

## Download the finished video

After a successful render, use the path reported by the agent. In Codespaces, locate the MP4 in the file explorer, open its context menu, and choose **Download**. If the browser does not offer download for that file, use the terminal to confirm the exact path and use a supported download method.

## Limits

- Creating this repository does not start a cloud machine.
- The setup script has not been run in your Codespaces environment by this GitHub connector.
- No API keys are included. Paid cloud generation features are not part of the zero-cost workflow.
- A free cloud environment may stop, run out of quota, or lack enough disk/RAM for some dependencies.
