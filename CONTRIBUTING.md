# Contributing

Thanks for your interest in contributing to `MyOwnAI`.

## Development Notes

- Recommended runtime: Python 3.12
- Recommended launcher: `start_py312.bat`
- Local LLM backend: Ollama

## Local Setup

1. Install Python 3.12
2. Install Ollama
3. Pull models:

```powershell
ollama pull dolphin-llama3:8b
ollama pull llava
```

4. Start Ollama:

```powershell
ollama serve
```

5. Run the app:

```powershell
.\start_py312.bat
```

## Pull Request Guidelines

- Keep changes focused and reviewable
- Update `README.md` when behavior changes
- Do not commit local databases, models, or virtual environments
- Prefer Windows-friendly paths and testing steps

## Reporting Issues

When opening an issue, include:

- Python version
- Whether you used `start.bat`, `start_py312.bat`, or `run_exe.bat`
- Whether Ollama was running
- The full traceback or screenshot
