# FIT TETRIS

A fitness-powered Tetris game that uses your webcam and body pose detection to control the pieces — no controller needed.

## How to Play

Use your body to control the Tetris blocks:

| Movement | Action |
|---|---|
| 💪 **Right arm raised** | Move block ← Left |
| 💪 **Left arm raised** | Move block → Right |
| 🏋️ **Both arms fully raised** | Rotate block |
| 🦵 **Squat** | Hard drop |

Keyboard fallback also available: `← →` to move, `↑` to rotate, `Space` to hard drop, `P` / `Esc` to pause.

## Features

- **Full-body pose control** — powered by [MediaPipe Pose](https://google.github.io/mediapipe/solutions/pose.html); no extra hardware required
- **Live webcam overlay** — skeleton joints and connections drawn on top of the game in real time
- **Offline-first** — ships with a local MediaPipe bundle (`vendor/mediapipe/`); automatically falls back to CDN if local load fails
- **Keyboard-only mode** — works even if camera permission is denied or pose detection fails
- **Ghost piece** — semi-transparent preview shows where the block will land
- **Next piece preview** — always shows the upcoming block
- **Progressive difficulty** — speed increases every 10 lines cleared
- **Scoring system** — bonus points for multi-line clears (100 / 300 / 500 / 800 × level) and hard drops
- **Rep counter** — tracks total body-movement reps during the session
- **Pause / Resume** — press `P` or `Esc` at any time
- **No install required** — single `index.html` file, open directly in a browser

## Running Locally (Offline)

Because the webcam feed requires a secure context, use the included batch file to spin up a local server:

```
start_offline.bat
```

Then open `http://localhost:8080` (or whatever port the batch file prints) in your browser.

Alternatively, serve the folder with any static HTTP server:

```bash
npx serve .
# or
python -m http.server 8080
```

## Tech Stack

- Vanilla HTML / CSS / JavaScript — zero runtime dependencies in the page itself
- [MediaPipe Pose](https://google.github.io/mediapipe/solutions/pose.html) for real-time human pose estimation
- Canvas 2D API for game rendering and skeleton overlay

## Controls Reference

| Key | Action |
|---|---|
| `←` | Move left |
| `→` | Move right |
| `↑` | Rotate |
| `↓` | Soft drop |
| `Space` | Hard drop |
| `P` / `Esc` | Pause / Resume |
