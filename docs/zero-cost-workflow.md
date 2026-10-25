# Zero-cost-first workflow

OpenMontage supports open-source tools and free/open footage, but **free hosting does not mean unlimited compute or free access to every AI provider**.

## Recommended first test

1. Start a Codespace for this launcher repository.
2. Run `bash scripts/setup-openmontage.sh`.
3. Complete `make setup` only if you have enough free Codespaces quota and storage.
4. Open the upstream `OpenMontage` folder in a compatible coding agent.
5. Request a 15–20 second test with local rendering, Piper TTS, and open footage or generated typography/graphics.
6. Explicitly disallow paid APIs and ask the agent to stop before any action that may incur a charge.
7. Inspect the rendered MP4 and the reported path before downloading.

## Free components mentioned by upstream

- Piper TTS for offline narration
- FFmpeg for encoding and post-production
- Remotion and HyperFrames for composition
- NASA, Wikimedia Commons, and Internet Archive for eligible media
- Pexels/Pixabay may offer free media but may require account/API keys; follow their current terms

Check the licence and attribution requirements for every asset used.

## Costs and constraints

- GitHub Codespaces has account-dependent monthly allowances. Runtime and storage consume quota; a stopped Codespace is not an unlimited persistent server.
- The AI coding assistant may have separate access, usage, and billing limits.
- AI video/image generation and premium narration services can charge money.
- Local video-generation models often need more RAM/GPU than a free Codespace provides.
- No credentials are included in this repository. Never commit API keys.
- The setup has not been tested in a live Codespace by this repository-writing workflow.
