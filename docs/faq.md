# FAQ — Laps3c0re

Frequently asked questions about the Laps3c0re PS4 jailbreak.

---

## General

**Q: What is Laps3c0re?**  
A: It is a PS4 kernel exploit that combines [Lapse](https://github.com/kmeps4/PSFree/blob/main/lapse.mjs) (a kernel exploit by **@abc**) with [Mast1c0re](https://github.com/McCaulay/mast1c0re) (by [@McCaulay](https://github.com/McCaulay)) as the entry point via the game *Okage: Shadow King*.

---

**Q: Who is this for?**  
A: Anyone who already has a digital, activated copy of *Okage: Shadow King* installed on a PS4 running a [supported firmware](../README.md#supported-fws).

---

**Q: Is this still actively developed?**  
A: No. The project is no longer actively supported. If you don't already have *Okage*, consider using [PS Vue](https://github.com/Vuemony) (PS4) or [Y2JB](https://github.com/Gezine/Y2JB) (PS5) instead.

---

## Compatibility

**Q: My firmware is not in the supported list. What can I do?**  
A: Check for newer exploits that support your firmware. On PS4, firmware reversion is possible but expensive and risky — not all consoles support it, some have incompatible Syscon chips, or they lack a stored earlier firmware state. Otherwise, you must wait for a new kernel exploit.

---

**Q: Why are firmware versions 12.50 / 12.52 / 13.00 unsupported?**  
A: The underlying Lapse exploit is not compatible with those firmwares. Use Poopsploit instead.

---

**Q: Why is 13.02+ unsupported?**  
A: As of 2025 there is no public exploit for 13.02+. The only option is to revert your console (if possible) or sell it and purchase one on a supported firmware.

---

**Q: Does this work on PS5?**  
A: Mast1c0re was confirmed to be non-functional on higher PS5 firmwares. PS5 support is not planned.

---

## Prerequisites & Setup

**Q: I don't have *Okage: Shadow King*. Can I still use this?**  
A: Not directly. You need a digital, activated copy of the game from PSN. Installing it requires being on the latest firmware, which would prevent exploitation. On PS4 there is an advanced method involving Syscon/NOR manipulation, but it is not recommended unless you are experienced. Other entry points (LUA, BDJB, Y2JB, PS Vue) are far easier to obtain.

---

**Q: Do I need to sign the save file myself?**  
A: Only if you are not using a pre-built save from the [Releases](https://github.com/GizzZmo/laps3c0re/releases/latest) page. If you build from source, you need [Apollo Save Tool](https://github.com/bucanero/apollo-ps4) or another PS4 save signing tool, or the `okrager` save exploit tool.

---

**Q: Why does my USB stick need MBR instead of GPT?**  
A: The Mast1c0re USB ELF Loader requires an MBR-partitioned drive. GPT is not supported.

---

## Usage

**Q: The "Start" button — where is it?**  
A: It is the **right half of the touch pad** on the DualShock 4 controller, not a separate button.

---

**Q: Can I use GoldHEN with this?**  
A: Yes. Place `goldhen.bin` in the root of your USB stick. If your payload file is named `payload.bin`, rename it to `goldhen.bin`.

---

**Q: How do I receive logs from the exploit?**  
A: Run `ncat --udp --listen --keep-open --recv-only -p 9023` on a machine at IP `192.168.1.39`. You need [Ncat / Nmap](https://nmap.org/download) installed.

---

## Building

**Q: How do I build from source?**  
A: See the [Building from Source](./building-from-source.md) guide (also available in the [GitHub Wiki](../../wiki/Building-from-Source)).

---

**Q: What is `ruby_chan.cpp`?**  
A: It's there for the lulz 😅

---

## Miscellaneous

**Q: Is it worth jailbreaking my PS4 this way?**  
A: If you already have the game installed, yes — it is a convenient entry point. If you don't, other entry points (LUA, BDJB, Y2JB, PS Vue) are much easier to set up and don't require owning a specific game.

---

**Q: Why bother making this at all?**  
A: It's fun, a good learning experience, and a practical improvement over PPPwn for owners of *Okage: Shadow King*.
