# MyOwnAI

`MyOwnAI` 是一个面向 Windows 的本地 AI 桌面聊天应用，目标是提供更接近聊天软件体验的本地多模态助手。

它支持：

- 本地文字对话（Ollama）
- 图片理解（自动切换 `llava`）
- 麦克风语音输入（Whisper）
- 中文女声语音回复（Edge TTS）
- 本地桌面窗口模式（pywebview）
- SQLite 多会话持久化

## Highlights

- 微信风格的简化聊天窗口
- `Enter` 发送，`Shift + Enter` 换行
- 点击 `+` 展开图片上传、语音通话和语音转文字
- VAD 自动静音检测与自动断句提交
- AI 语音流式播报与用户打断
- 本地数据库保存聊天历史
- 支持源码启动和 EXE 打包启动

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

你可以通过环境变量覆盖：

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
