# Gifetch

I created **Gifetch** to display an animated ASCII gif alongside my `neofetch` output.
The idea came after watching the PewDiePie video about linux — and I thought that was pretty kul

It's just a fun little project for terminal aesthetics. Hope someone else finds it cool too 🍚

![Preview](./preview.gif)

---

## 🧩 Dependencies

Gifetch uses the following tools:

* [`ffmpeg`](https://ffmpeg.org/) — extract frames from a gif
* [`jp2a`](https://github.com/cslarsen/jp2a) — convert image to ASCII
* [`neofetch`](https://github.com/dylanaraps/neofetch) — system info display

---

## 🚀 Installation (Automatic)

> **For now only works with `pacman` (Arch-based systems)**

```bash
cd ~/gifetch
./install.sh
source ~/.zshrc # or source ~/.bashrc depending on your shell
```

This will:

* Install required packages (if not present)
* Set up `gifetch` and `gif2ascii` aliases

---

## ⚙️ Manual Setup

If you’re not on Arch or want full control:

### 1. Install dependencies manually

```bash
sudo pacman -S ffmpeg jp2a neofetch
```

> On other distros use your respective package manager (e.g. `apt`, `brew`, `dnf`, etc.)

### 2. Add aliases manually (recommended)

Edit your `~/.zshrc` or `~/.bashrc`:

```bash
alias gifetch="$HOME/gifetch/scripts/gifetch.sh"
alias gif2ascii="$HOME/gifetch/scripts/gif2ascii.sh"
```

Then:

```bash
source ~/.zshrc # or .bashrc
```

---

## 🎬 Usage

### 1. Convert a GIF into ASCII frames:

```bash
gif2ascii ./gifs/yourgif.gif
```

This will:

* Extract frames from the gif
* Convert each frame to ASCII
* Store the ASCII in `~/gifetch/frames/ascii_frames/`
* Copy the first frame as the neofetch logo

### 2. Play it inside the terminal:

```bash
gifetch
```

Press **any key** to stop the animation.

---

---

## 📁 Project Structure

```
gifetch/
├── gifs/                 # Your original gifs go here
├── frames/               # Generated PNG frames
│   └── ascii_frames/     # Generated ASCII text frames
├── scripts/              # gif2ascii.sh, gifetch.sh, utils.sh
├── install.sh            # Setup script
```

---


