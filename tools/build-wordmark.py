"""Build the sidebar 'Yeehaw!' wordmark at quartz/static/yeehaw.svg.

Run with:  python3 tools/build-wordmark.py
Needs fonttools (pip install fonttools) and macOS's Impact.ttf. Only needed to
regenerate the asset; the committed SVG is self-contained and has no font or
build-time dependency.

Impact glyph outlines are converted to paths at build time, so the shipped SVG
carries no font dependency and renders identically everywhere, including inside
a CSS background-image where page fonts are unavailable. Each glyph is then
placed along a sagging arc with its own rotation and a scale ramp to the right.
"""
import math
import os

from fontTools.ttLib import TTFont
from fontTools.pens.svgPathPen import SVGPathPen
from fontTools.pens.transformPen import TransformPen
from fontTools.pens.recordingPen import RecordingPen
from fontTools.misc.transform import Transform

FONT = "/System/Library/Fonts/Supplemental/Impact.ttf"
WORD = "YEEHAW!"
CAP = 200.0          # target cap height in output units
TRACK = 0.055        # extra letter spacing, as a fraction of advance
SAG = 92.0           # how far the middle of the word dips
SCALE_LO, SCALE_HI = 0.90, 1.16
OFF = 34             # shadow offset
PAD = 82

font = TTFont(FONT)
glyphset = font.getGlyphSet()
cmap = font.getBestCmap()
upem = font["head"].unitsPerEm
capheight = font["OS/2"].sCapHeight if hasattr(font["OS/2"], "sCapHeight") else upem * 0.7
k = CAP / capheight   # font units -> output units

items = []
for ch in WORD:
    name = cmap[ord(ch)]
    g = glyphset[name]
    rec = RecordingPen()
    g.draw(rec)
    # Flip y (font y-up -> SVG y-down) and scale so the cap sits in 0..CAP.
    pen = SVGPathPen(glyphset, ntos=lambda v: f"{v:.1f}")
    rec.replay(TransformPen(pen, Transform(k, 0, 0, -k, 0, CAP)))
    raw = g.width * k
    items.append({"d": pen.getCommands(), "adv": raw * (1 + TRACK), "raw": raw})

total = sum(i["adv"] for i in items)
half = total / 2

run = 0.0
placed = []
for it in items:
    cx = run + it["adv"] / 2
    run += it["adv"]
    f = (cx - half) / half                      # -1 .. 1 across the word
    dy = SAG * (1 - f * f)                      # middle sits lowest
    ang = math.degrees(math.atan2(-2 * SAG * f, half))
    s = SCALE_LO + (SCALE_HI - SCALE_LO) * (cx / total)
    # rotate+scale about the glyph's own centre, then drop it on the arc
    t = (
        Transform()
        .translate(cx, dy + CAP / 2)
        .rotate(math.radians(ang))
        .scale(s)
        .translate(-it["raw"] / 2, -CAP / 2)   # centre on the glyph, not the tracked advance
    )
    a, b, c, d, e, fv = t
    placed.append(f'<path transform="matrix({a:.4f} {b:.4f} {c:.4f} {d:.4f} {e:.2f} {fv:.2f})" d="{it["d"]}"/>')

VB_W = total + PAD * 2
VB_H = CAP + SAG + PAD * 2
body = "".join(placed)

svg = f'''<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 {VB_W:.0f} {VB_H:.0f}" role="img" aria-label="Yeehaw!">
<defs>
<linearGradient id="y" x1="0" y1="0" x2="0" y2="1">
<stop offset="0" stop-color="#fff7b8"/>
<stop offset="0.45" stop-color="#ffd23f"/>
<stop offset="1" stop-color="#f59105"/>
</linearGradient>
<g id="w" transform="translate({PAD},{PAD})">{body}</g>
</defs>
<use href="#w" transform="translate({OFF},{OFF})" fill="#e5281c" stroke="#16100c" stroke-width="10" stroke-linejoin="round"/>
<use href="#w" fill="#f47c10" stroke="#f47c10" stroke-width="26" stroke-linejoin="round"/>
<use href="#w" fill="url(#y)" stroke="#16100c" stroke-width="10" stroke-linejoin="round"/>
</svg>'''

out = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "quartz", "static", "yeehaw.svg")
open(out, "w").write(svg)
print(f"viewBox 0 0 {VB_W:.0f} {VB_H:.0f}  cap={capheight} upem={upem}  bytes={len(svg)}")
