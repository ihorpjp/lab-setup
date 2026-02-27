#!/bin/bash

# setup_lab.sh
# Создаёт структуру домашней лаборатории для обучения Linux / Security / DevOps
# Автор: Ihor Bezruchko
# Использование: bash setup_lab.sh

# ─── Цвета для вывода ────────────────────────────────────────────────────────
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# ─── Переменные ──────────────────────────────────────────────────────────────
LAB_DIR="$HOME/lab"
CREATED=0
SKIPPED=0

# ─── Функции ─────────────────────────────────────────────────────────────────

# Вывод с цветом
info()    { echo -e "${BLUE}[INFO]${NC}  $1"; }
success() { echo -e "${GREEN}[OK]${NC}    $1"; }
warn()    { echo -e "${YELLOW}[SKIP]${NC}  $1"; }
error()   { echo -e "${RED}[ERROR]${NC} $1"; }

# Создать папку если не существует
make_dir() {
    local dir="$1"
    if [ -d "$dir" ]; then
        warn "Уже существует: $dir"
        SKIPPED=$((SKIPPED + 1))
    else
        mkdir -p "$dir"
        success "Создано: $dir"
        CREATED=$((CREATED + 1))
    fi
}

# Создать файл с содержимым если не существует
make_file() {
    local file="$1"
    local content="$2"
    if [ -f "$file" ]; then
        warn "Уже существует: $file"
        SKIPPED=$((SKIPPED + 1))
    else
        echo "$content" > "$file"
        success "Создан файл: $file"
        CREATED=$((CREATED + 1))
    fi
}

# ─── Старт ───────────────────────────────────────────────────────────────────

echo ""
echo -e "${BLUE}╔══════════════════════════════════════╗${NC}"
echo -e "${BLUE}║       Lab Setup Script v1.0          ║${NC}"
echo -e "${BLUE}║       by Ihor Bezruchko              ║${NC}"
echo -e "${BLUE}╚══════════════════════════════════════╝${NC}"
echo ""
info "Начинаем создание структуры лаборатории в: $LAB_DIR"
echo ""

# ─── Создание структуры папок ────────────────────────────────────────────────

info "Создаю папки..."
echo ""

# Основные папки
make_dir "$LAB_DIR"
make_dir "$LAB_DIR/scripts"        # bash и python скрипты
make_dir "$LAB_DIR/projects"       # учебные проекты
make_dir "$LAB_DIR/logs"           # логи скриптов и экспериментов
make_dir "$LAB_DIR/notes"          # заметки по темам
make_dir "$LAB_DIR/tools"          # инструменты и конфиги

# Подпапки для скриптов по темам
make_dir "$LAB_DIR/scripts/linux"     # скрипты по Linux
make_dir "$LAB_DIR/scripts/network"   # сетевые скрипты
make_dir "$LAB_DIR/scripts/security"  # security скрипты
make_dir "$LAB_DIR/scripts/python"    # python скрипты

# Подпапки для проектов
make_dir "$LAB_DIR/projects/docker"   # docker проекты
make_dir "$LAB_DIR/projects/aws"      # aws/terraform
make_dir "$LAB_DIR/projects/soc"      # SOC / SIEM практика

# Подпапки для заметок
make_dir "$LAB_DIR/notes/linux"
make_dir "$LAB_DIR/notes/security"
make_dir "$LAB_DIR/notes/networking"

echo ""

# ─── Создание базовых файлов ─────────────────────────────────────────────────

info "Создаю базовые файлы..."
echo ""

# README для лаборатории
make_file "$LAB_DIR/README.md" "# My IT / Security Lab

Домашняя лаборатория для обучения Linux, Security, DevOps.

## Структура
- scripts/    — bash и python скрипты
- projects/   — учебные проекты (Docker, AWS, SOC)
- logs/       — логи и результаты экспериментов
- notes/      — заметки по темам
- tools/      — инструменты и конфиги

## Автор
Ihor Bezruchko — Junior IT Support | Cybersecurity Enthusiast
"

# .gitignore
make_file "$LAB_DIR/.gitignore" "# Не коммитить в git:
logs/
*.log
.env
secrets/
*.pem
*.key
"

# Шаблон для заметок
make_file "$LAB_DIR/notes/linux/commands.md" "# Полезные Linux команды

## Файлы и директории
\`\`\`
ls -la          # список с правами
find / -name    # поиск файла
grep -r         # поиск в файлах
\`\`\`

## Сеть
\`\`\`
ip addr         # IP адреса
ss -tulpn       # открытые порты
ping, traceroute
\`\`\`

## Процессы
\`\`\`
ps aux          # все процессы
top / htop      # мониторинг
kill PID        # убить процесс
\`\`\`
"

# Шаблон лога
make_file "$LAB_DIR/logs/.gitkeep" "# Эта папка для логов"

echo ""

# ─── Права ───────────────────────────────────────────────────────────────────

info "Устанавливаю права на папку scripts..."
chmod 755 "$LAB_DIR/scripts" 2>/dev/null && success "chmod 755 на scripts/"
echo ""

# ─── Итог ────────────────────────────────────────────────────────────────────

echo -e "${BLUE}──────────────────────────────────────${NC}"
echo -e "${GREEN}Готово!${NC}"
echo ""
echo -e "  Создано:   ${GREEN}$CREATED${NC} элементов"
echo -e "  Пропущено: ${YELLOW}$SKIPPED${NC} (уже существовали)"
echo ""
echo -e "  Лаборатория: ${BLUE}$LAB_DIR${NC}"
echo ""
echo -e "Следующий шаг: ${YELLOW}cd $LAB_DIR${NC}"
echo ""
