#!/usr/bin/env python3
import json
import ssl
import urllib.request
from pathlib import Path

SOURCES = {
    "N1": "https://raw.githubusercontent.com/bryanjenningz/jlpt-audio-srs/main/public/jlpt1.txt",
    "N2": "https://raw.githubusercontent.com/bryanjenningz/jlpt-audio-srs/main/public/jlpt2.txt",
    "N3": "https://raw.githubusercontent.com/bryanjenningz/jlpt-audio-srs/main/public/jlpt3.txt",
    "N4": "https://raw.githubusercontent.com/bryanjenningz/jlpt-audio-srs/main/public/jlpt4.txt",
    "N5": "https://raw.githubusercontent.com/bryanjenningz/jlpt-audio-srs/main/public/jlpt5.txt",
}


def parse_line(line: str):
    parts = [p.strip() for p in line.split(";")]
    if len(parts) < 3:
        return None
    pitch_raw = parts[3] if len(parts) > 3 else ""
    pitch = [x.strip() for x in pitch_raw.split(",") if x.strip()]
    return {
        "word": parts[0],
        "reading": parts[1],
        "meaning": parts[2],
        "pitchAccents": pitch,
    }


def main():
    repo_root = Path(__file__).resolve().parents[1]
    output = repo_root / "travel" / "jlpt_listening_oss.json"

    levels = {}
    ssl_ctx = ssl._create_unverified_context()
    for level, url in SOURCES.items():
        with urllib.request.urlopen(url, timeout=30, context=ssl_ctx) as resp:
            text = resp.read().decode("utf-8")
        items = []
        for raw in text.splitlines():
            raw = raw.strip()
            if not raw:
                continue
            item = parse_line(raw)
            if item:
                items.append(item)
        levels[level] = items

    payload = {
        "meta": {
            "source": "bryanjenningz/jlpt-audio-srs",
            "files": SOURCES,
            "description": "Open-source JLPT word lists transformed for listening drills.",
        },
        "levels": levels,
    }

    output.write_text(json.dumps(payload, ensure_ascii=False, indent=2), encoding="utf-8")
    print(f"Wrote {output}")
    for key in ["N1", "N2", "N3", "N4", "N5"]:
        print(f"{key}: {len(levels[key])}")


if __name__ == "__main__":
    main()
