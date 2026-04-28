# MyOwnAI

`MyOwnAI` is a Windows-focused local AI desktop chat app designed to feel closer to a modern messaging client while keeping the core AI workflow local-first.

It supports:

- Local text chat with Ollama
- Image understanding with automatic `llava` routing
- Microphone voice input with Whisper
- High-quality Chinese female voice replies with Edge TTS
- Local desktop window mode with pywebview
- SQLite multi-session persistence

## Highlights

- Simplified chat window inspired by messaging apps
- `Enter` to send, `Shift + Enter` for a newline
- Click `+` to expand image upload, voice call, and speech-to-text tools
- VAD-based silence detection and automatic utterance submission
- Streaming AI voice playback with user barge-in interruption
- Local chat history stored in SQLite
- Supports both script-based launch and packaged EXE launch

## Stack

- `Gradio`
- `Ollama`
- `openai-whisper`
- `edge-tts`
- `pywebview`
- `SQLite`

## Default Models

- Text model: `dolphin-llama3:8b`
- Vision model: `llava`
- Whisper: `base`
- TTS voice: `zh-CN-XiaoxiaoNeural`

You can override defaults with environment variables:

```powershell
$env:TEXT_MODEL="dolphin-llama3:8b"
$env:VISION_MODEL="llava"
$env:WHISPER_MODEL_SIZE="base"
$env:TTS_VOICE="zh-CN-XiaoxiaoNeural"
```

## Requirements

- Windows 10/11
- Python 3.12 recommended
- Ollama
- 32GB RAM recommended for a smoother local experience

## Quick Start

### 1. Install Ollama and pull models

```powershell
ollama pull dolphin-llama3:8b
ollama pull llava
```

### 2. Start Ollama

```powershell
ollama serve
```

### 3. Start the app

Recommended:

```powershell
.\start_py312.bat
```

Alternative:

```powershell
.\start.bat
```

## Build EXE

```powershell
.\build_exe.bat
```

Run the packaged app:

```powershell
.\run_exe.bat
```

Or double-click:

```text
dist\MyOwnAI.exe
```

## Project Layout

```text
MyOwnAI/
  main.py
  requirements.txt
  start.bat
  start_py312.bat
  build_exe.bat
  run_exe.bat
  app.ico
  README.md
  CONTRIBUTING.md
  LICENSE
  .gitignore
```

## Notes

- The current app expects a local `Ollama` service to be running.
- `edge-tts` uses an online speech service; it is not a fully offline TTS engine.
- If `pywebview` is unavailable, the app falls back to browser mode.
- Large local model files should not be committed to GitHub.

## Open Source Checklist

- Do not commit local databases, models, build outputs, or virtual environments
- Keep screenshots and demo assets outside the main code paths
- Update `README.md` if launch steps or model defaults change

## Contributing

See `CONTRIBUTING.md`.

## License

MIT
"# MyOwnAI" 
