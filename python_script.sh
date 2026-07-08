python3 -c '
import json, os, sys
from pathlib import Path

# file for js.map to js.map_sources
with open("main.js.map", "r", encoding="utf-8") as f:
    data = json.load(f)

sources = data.get("sources", [])
content = data.get("sourcesContent", [])

# js.map_extract sources output path
out_dir = Path("js.map_extracted_path")
out_dir.mkdir(exist_ok=True)

for path_str, code in zip(sources, content):
    if not code: continue
    
    # Clean up webpack:// prefixes and sanitize relative parent paths (../../)
    clean_path = path_str.replace("webpack:///", "").replace("webpack://", "")
    clean_path = clean_path.lstrip("./").replace("../", "")
    
    final_path = out_dir / clean_path
    final_path.parent.mkdir(parents=True, exist_ok=True)
    
    with open(final_path, "w", encoding="utf-8") as out_f:
        out_f.write(code)
        
print("[+] Successfully extracted all available files into ./js.map_extracted_path")
'
