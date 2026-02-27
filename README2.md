# 🧪 Lab Setup Script

A Bash script that automatically creates a structured home lab environment for learning Linux, Cybersecurity, and DevOps.

---

## What It Does

Runs one command → creates a full folder structure with base files, correct permissions, and a progress summary.

```
~/lab/
├── scripts/
│   ├── linux/        ← bash scripts (monitoring, automation)
│   ├── network/      ← network scanning, connectivity checks
│   ├── security/     ← log analysis, security checks
│   └── python/       ← python automation scripts
├── projects/
│   ├── docker/       ← containerization projects
│   ├── aws/          ← terraform & cloud infrastructure
│   └── soc/          ← SIEM, incident response practice
├── logs/             ← script output and experiment logs
├── notes/
│   ├── linux/        ← command references, cheatsheets
│   ├── security/     ← threat types, SOC workflows
│   └── networking/   ← protocols, troubleshooting steps
├── tools/            ← configs and utility files
├── README.md         ← this file
└── .gitignore        ← excludes logs, secrets, keys
```

---

## Quick Start

```bash
# 1. Download the script
curl -O https://raw.githubusercontent.com/ihorbezruchko/lab/main/setup_lab.sh

# 2. Make it executable
chmod +x setup_lab.sh

# 3. Run it
bash setup_lab.sh

# 4. Go to your lab
cd ~/lab
```

---

## Requirements

| Requirement | Version |
|-------------|---------|
| OS | Linux / macOS / WSL2 (Windows) |
| Bash | 4.0+ |
| Permissions | Standard user (no sudo needed) |

> **WSL2 on Windows:** Open PowerShell → run `wsl --install` → restart → open Ubuntu terminal → run the script.

---

## Example Output

```
╔══════════════════════════════════════╗
║       Lab Setup Script v1.0          ║
║       by Ihor Bezruchko              ║
╚══════════════════════════════════════╝

[INFO]  Starting lab setup in: /home/ihor/lab

[INFO]  Creating directories...

[OK]    Created: /home/ihor/lab
[OK]    Created: /home/ihor/lab/scripts
[OK]    Created: /home/ihor/lab/scripts/linux
[OK]    Created: /home/ihor/lab/projects
[OK]    Created: /home/ihor/lab/projects/soc
...

[INFO]  Creating base files...

[OK]    Created file: /home/ihor/lab/README.md
[OK]    Created file: /home/ihor/lab/.gitignore
[OK]    Created file: /home/ihor/lab/notes/linux/commands.md

──────────────────────────────────────
Done!

  Created:   18 items
  Skipped:   0 (already existed)

  Lab location: /home/ihor/lab

Next step: cd /home/ihor/lab
```

If you run the script again — nothing breaks. Items that already exist are skipped and counted separately.

---

## How It Works

### Functions

The script uses two reusable functions instead of repeating the same logic:

**`make_dir(path)`** — creates a directory if it does not exist, skips it if it does, and increments the correct counter.

**`make_file(path, content)`** — creates a file with default content if it does not exist, skips it if it does.

### Counters

```bash
CREATED=0   # increments every time something new is created
SKIPPED=0   # increments every time something already exists
```

This makes the script safe to re-run at any time — it will only create what is missing.

### Colors

```bash
GREEN='\033[0;32m'    # success messages
YELLOW='\033[1;33m'   # skip messages
RED='\033[0;31m'      # error messages
BLUE='\033[0;34m'     # info messages
NC='\033[0m'          # reset color
```

---

## What Gets Created Automatically

| File | Purpose |
|------|---------|
| `README.md` | Lab overview and structure description |
| `.gitignore` | Excludes logs, `.env`, `.pem`, `.key` files from Git |
| `notes/linux/commands.md` | Starter cheatsheet with common Linux commands |
| `logs/.gitkeep` | Keeps the logs folder tracked by Git while staying empty |

---

## Recommended Next Steps

After running the script, here is what to build next:

```bash
# Step 1 — Write your first monitoring script
nano ~/lab/scripts/linux/check_system.sh

# Step 2 — Create a Python log analyzer
nano ~/lab/scripts/python/log_analyzer.py

# Step 3 — Push your lab to GitHub
cd ~/lab
git init
git add .
git commit -m "Initial lab setup"
git remote add origin https://github.com/ihorbezruchko/lab.git
git push -u origin main
```

---

## Project Roadmap

- [x] Auto folder structure creation
- [x] Skip existing items safely
- [x] Base files with starter content
- [x] Color-coded output
- [x] Created / skipped counters
- [ ] `--dry-run` flag (show what would be created without creating)
- [ ] `--reset` flag (remove and recreate the lab)
- [ ] Auto-install common tools (git, htop, nmap, python3)
- [ ] Generate summary log file after setup

---

## Author

**Ihor Bezruchko**
Junior IT Support | Cybersecurity Enthusiast | Luxembourg

- LinkedIn: [linkedin.com/in/ihorbezruchko](https://linkedin.com/in/ihorbezruchko)
- GitHub: [github.com/ihorbezruchko](https://github.com/ihorbezruchko)
- Email: ihorbezruchko5@gmail.com

---

## License

MIT — free to use, modify, and share.
