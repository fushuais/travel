#!/usr/bin/env python3
import io
import json
import re
import ssl
import urllib.request
import xml.etree.ElementTree as ET
import zipfile
from pathlib import Path

SENTENCE_ZIP_URL = "https://www.manythings.org/anki/jpn-eng.zip"
NHK_RSS_URL = "https://www3.nhk.or.jp/rss/news/cat0.xml"


def level_by_length(text: str) -> str:
    n = len(text)
    if n <= 10:
        return "N5"
    if n <= 18:
        return "N4"
    if n <= 28:
        return "N3"
    return "N2"


def fetch_sentence_levels(ctx: ssl.SSLContext):
    req = urllib.request.Request(
        SENTENCE_ZIP_URL,
        headers={
            "User-Agent": "Mozilla/5.0 (Codex Listening Fetcher)",
            "Accept": "*/*",
            "Accept-Language": "en-US,en;q=0.9,ja;q=0.8",
            "Referer": "https://www.manythings.org/",
        },
    )
    raw = urllib.request.urlopen(req, context=ctx, timeout=60).read()
    zf = zipfile.ZipFile(io.BytesIO(raw))
    lines = zf.read("jpn.txt").decode("utf-8", errors="ignore").splitlines()

    levels = {"N5": [], "N4": [], "N3": [], "N2": []}
    seen = set()
    jp_re = re.compile(r"[ぁ-んァ-ン一-龯]")

    for line in lines:
        parts = line.split("\t")
        if len(parts) < 2:
            continue
        en = parts[0].strip()
        jp = parts[1].strip()
        if not jp or not en:
            continue
        if jp in seen:
            continue
        if not jp_re.search(jp):
            continue
        if len(jp) < 3 or len(jp) > 42:
            continue
        seen.add(jp)
        lvl = level_by_length(jp)
        levels[lvl].append({"jp": jp, "translation": en})

    for lvl in levels:
        levels[lvl] = levels[lvl][:300]
    return levels


def fetch_nhk_news(ctx: ssl.SSLContext):
    req = urllib.request.Request(
        NHK_RSS_URL,
        headers={"User-Agent": "Mozilla/5.0 (Codex Listening Fetcher)"},
    )
    xml_raw = urllib.request.urlopen(req, context=ctx, timeout=30).read()
    root = ET.fromstring(xml_raw)
    items = []
    for item in root.findall("./channel/item"):
        title = (item.findtext("title") or "").strip()
        desc = (item.findtext("description") or "").strip()
        link = (item.findtext("link") or "").strip()
        pub_date = (item.findtext("pubDate") or "").strip()
        if not title:
            continue
        items.append(
            {
                "title": title,
                "summary": desc,
                "link": link,
                "pubDate": pub_date,
            }
        )
    return items[:40]


def main():
    repo_root = Path(__file__).resolve().parents[1]
    out = repo_root / "travel" / "japanese_listening_open_content.json"
    ctx = ssl._create_unverified_context()

    sentence_levels = fetch_sentence_levels(ctx)
    nhk_news = fetch_nhk_news(ctx)

    payload = {
        "meta": {
            "sentenceSource": "ManyThings jpn-eng (Tatoeba based)",
            "nhkSource": NHK_RSS_URL,
            "description": "Open web-fetched Japanese listening content: sentences + NHK news.",
        },
        "sentenceLevels": sentence_levels,
        "nhkNews": nhk_news,
    }

    out.write_text(json.dumps(payload, ensure_ascii=False, indent=2), encoding="utf-8")
    print(f"Wrote {out}")
    for k in ["N5", "N4", "N3", "N2"]:
        print(f"{k}: {len(sentence_levels[k])} sentences")
    print(f"NHK news: {len(nhk_news)} items")


if __name__ == "__main__":
    main()
