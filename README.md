# js.map_extractor bash python script run by shell
js.map file to source map

## Download the `https://example.com/main.js.map` file by `wget`
```bash
wget https://example.com/main.js.map
```
## Replace the downloaded `main.js.map` file name in `python_script.sh`
```python
# file for js.map to js.map_sources
with open("main.js.map", "r", encoding="utf-8") as f:
```
## Replace the `out_dir` value with extract path name in `python_script.sh`
```python
# js.map_extract sources output path
out_dir = Path("js.map_extracted_path")
```

## Next Step: Verify your files
Once that script finishes, run:

```bash
cd js.map_extracted
ls -la
```
