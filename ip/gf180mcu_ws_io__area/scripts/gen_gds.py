#!/usr/bin/env python3
# SPDX-FileCopyrightText: © 2026 Project Template Contributors
# SPDX-License-Identifier: Apache-2.0
"""Generate the GDS for gf180mcu_ws_io__area.

This emits a 75 x 75 um cell containing:
  * a 75 x 75 um PR boundary              (GDS layer 0/0)
    needed by LibreLane's KLayout/Magic streamout to extract the
    macro outline.
  * a 65 x 65 um Metal5  bondpad         (GDS layer 81/0)
  * a 60 x 60 um Pad/glass opening        (GDS layer 37/0)
  * a "PAD" text label on Metal5/label    (GDS layer 81/10)
    so LVS/Magic can identify the single signal pin

Run from inside the project's nix dev shell so that klayout's `pya`
module is on the Python path:

    nix develop -c python3 ip/gf180mcu_ws_io__area/scripts/gen_gds.py
"""

from __future__ import annotations

import os
import sys

try:
    import pya  # klayout's python module
except ImportError:  # pragma: no cover
    sys.stderr.write(
        "ERROR: klayout's `pya` module is not available. "
        "Run this script inside `nix develop`.\n"
    )
    sys.exit(1)


CELL_NAME = "gf180mcu_ws_io__area"

# All dimensions in micrometers.
CELL_SIZE   = 75.0
METAL_INSET = 5.0   # M5 inset from cell edge -> 65 x 65 um pad
GLASS_INSET = 7.5   # glass inset from cell edge -> 60 x 60 um opening

# GDS layer/datatype assignments (from gf180mcuD-GDS.tech /
# klayout/tech/gf180mcu.lyp).
LAYER_PRBOUNDARY   = (0, 0)   # convention matched by gf180mcu_ws_ip__id/__logo
LAYER_METAL5       = (81, 0)
LAYER_PAD          = (37, 0)
LAYER_METAL5_LABEL = (81, 10)


def main(out_path: str) -> None:
    layout = pya.Layout()
    # GF180 IO library uses a 1 nm database; match it.
    layout.dbu = 0.001

    top = layout.create_cell(CELL_NAME)

    prb = layout.layer(*LAYER_PRBOUNDARY)
    m5  = layout.layer(*LAYER_METAL5)
    pad = layout.layer(*LAYER_PAD)
    m5l = layout.layer(*LAYER_METAL5_LABEL)

    # PR boundary covers the full cell footprint — LibreLane uses this
    # to extract the macro outline during stream-out.
    top.shapes(prb).insert(pya.DBox(0, 0, CELL_SIZE, CELL_SIZE))

    m5_box  = pya.DBox(METAL_INSET, METAL_INSET,
                       CELL_SIZE - METAL_INSET,
                       CELL_SIZE - METAL_INSET)
    pad_box = pya.DBox(GLASS_INSET, GLASS_INSET,
                       CELL_SIZE - GLASS_INSET,
                       CELL_SIZE - GLASS_INSET)

    top.shapes(m5).insert(m5_box)
    top.shapes(pad).insert(pad_box)

    # "PAD" label centered on the pad for LVS/Magic pin recognition.
    center = pya.DPoint(CELL_SIZE / 2.0, CELL_SIZE / 2.0)
    top.shapes(m5l).insert(pya.DText("PAD", pya.DTrans(center)))

    os.makedirs(os.path.dirname(out_path), exist_ok=True)
    layout.write(out_path)
    print(f"wrote {out_path}")


if __name__ == "__main__":
    here = os.path.dirname(os.path.abspath(__file__))
    default_out = os.path.normpath(
        os.path.join(here, "..", "gds", f"{CELL_NAME}.gds")
    )
    out = sys.argv[1] if len(sys.argv) > 1 else default_out
    main(out)
