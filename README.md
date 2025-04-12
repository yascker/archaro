# Archaro

**Archaro** is a Bash script that installs a minimal Arch Linux system, but using **Manjaro's stable repositories** instead of Arch's rolling ones.

It combines the **full control and minimalism of Arch** with the **stability and slower update cycle of Manjaro** — something that neither project provides out-of-the-box.

---

## 🚀 What does it do?

Archaro performs the following steps:

1. Replaces Arch’s mirrorlist with Manjaro's stable (USA) mirrors
2. Downloads and sets up Manjaro's GPG keyring from official sources
3. Removes conflicting packages (`pacman-mirrorlist`, `reflector`)
4. Installs `manjaro-tools-base-git`, which includes the `basestrap` tool
5. Installs the base system into `/mnt` using `basestrap`

This creates a minimal, clean, and stable base system using the Manjaro ecosystem — just like Arch, but with more reliability.

---

## 📦 Requirements

Before running the script:

- Follow the [Arch Linux installation guide](https://wiki.archlinux.org/title/Installation_guide) **up to Step 2 (Installation)**.
- Mount your desired partitions under `/mnt` according to your setup.

Then, instead of doing:

```bash
pacstrap -K /mnt base linux linux-firmware
```

Run:

```bash
chmod +x basestrap.sh
./basestrap.sh
```
