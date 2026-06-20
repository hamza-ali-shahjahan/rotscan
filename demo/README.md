# Regenerating the demo GIFs

The GIFs in the main [README](../README.md) are recorded from these sources.

**Requires:** [bun](https://bun.sh), [vhs](https://github.com/charmbracelet/vhs), and `gifsicle`
(`brew install vhs gifsicle`). Only changing the title-card wordmark needs [figlet](http://www.figlet.org).

Run everything **from the repo root**:

```bash
bash demo/build-demo.sh          # builds 5 throwaway repos with planted rot in .demo-tmp/ (gitignored)

vhs demo/hero.tape               # -> assets/rotscan-hero.gif   (title -> sweep -> drill -> fix)
vhs demo/step1.tape              # -> assets/step-1-sweep.gif
vhs demo/step2.tape              # -> assets/step-2-drill.gif
vhs demo/step3.tape              # -> assets/step-3-fix.gif

# optional: shrink (text stays crisp)
for g in assets/*.gif; do gifsicle -O3 --lossy=30 --colors 224 "$g" -o "$g.opt" && mv "$g.opt" "$g"; done
```

The demo repos carry deliberately-planted rot — broken/wrong-case/gitignored links, a
known-fake AWS *example* key (assembled at runtime so the literal token isn't committed
here), orphaned assets, and a nonexistent dependency — so rotscan has something to find.

`demo/banner.txt` (the title card) is committed; regenerate it with `bash demo/banner.sh`
only if you want to change the wordmark.
