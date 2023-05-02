#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
@author: Guillaume Rivollier
"""

# bindsym key parser for sway

import sys
import os
import re
from collections import OrderedDict
from typing import Text


def parse_bindsym(line: str, bindsyms: dict, mode: str) -> None:
    line = line.strip("\t\n")
    line = line.strip()
    if line.startswith("bindsym"):
        line = re.sub(r"\s*([\+])\s*", "+", line)  # delete space around plus (+)
        word, key, *action = re.split(" ", line)
        if mode:
            key = f"[mode {mode}] {key}"
        bindsyms[key] = " ".join(action)


def parse_set(line: str, sets: dict) -> None:
    line = line.strip("\t\n")
    line = line.strip()
    if line.startswith("set"):
        word, key, *action = re.split(" ", line)
        sets[key] = " ".join(action)


def parse_include(line: str, includes: list) -> None:
    line = line.strip("\t\n")
    line = line.strip()
    if line.startswith("include"):
        includes.append(line.replace("include ", "").replace("*", ""))


def parse_file(path):
    mode = ""
    with open(path, "r") as file:
        for line in file:
            if line.startswith("mode"):
                mode = line.replace("mode", "").replace("{", "").strip()

            if line.endswith("}") & bool(mode):
                mode = ""

            parse_bindsym(line, bindsyms, mode)
            parse_set(line, sets)
            parse_include(line, includes)


extrakey = {
    "$HOME": "~",
    "ampersand": "&",
    "eacute": "é",
    "quotedbl": '"',
    "apostrophe": "'",
    "parenleft": "(",
    "minus": "-",
    "egrave": "è",
    "underscore": "_",
    "ccedilla": "ç",
    "agrave": "à",
    "Mod1": "Alt",
    "Mod4": "",
    "semicolon": ";",
    "XF86MonBrightnessUp": "󰃠",
    "XF86MonBrightnessDown": "󰃞",
    "XF86AudioRaiseVolume": "󰝝",
    "XF86AudioLowerVolume": "󰝞",
    "XF86AudioMute": "󰝟",
    "Left": "",
    "Down": "",
    "Up": "",
    "Right": "",
    "Return": "󰌑",
    "exclam": "!",
    "Escape": "Esc",
    "ugrave": "ù",
    "question": "?",
}


def replace_set(key, command, sets):
    hk = str(key)
    cmd = str(command)
    for setkey, setvalue in sets.items():
        hk = hk.replace(setkey, setvalue)
        hk = hk.replace("space", "󱁐").replace("Space", "󱁐")
        cmd = cmd.replace(setkey, setvalue)
    return hk, cmd


if __name__ == "__main__":
    if len(sys.argv) == 1:
        raise Exception("No path provided")

    root_path = os.path.expanduser(sys.argv[1])

    if not os.path.isfile(root_path):
        raise Exception("No valid path file provided")

    if not os.path.isabs(root_path):
        raise Exception("Please provide absolute path")

    bindsyms, sets = OrderedDict(), OrderedDict()
    includes = []

    parse_file(root_path)

    for path in includes:
        path = os.path.expanduser(path)
        files = os.listdir(path)
        files.sort()

        for file in files:
            print(file, file=sys.stderr)
            parse_file(os.path.join(path, file))

    sets = OrderedDict({**sets, **extrakey})

    res = """---
title:  Sway Keybindings
geometry: margin=0.2cm
mainfont: FiraCode Nerd Font
monofont: FiraCode Nerd Font Mono
classoption: portrait
output:
  pdf_document:
    latex_engine: xelatex
---

"""

    res += f"as defined in {root_path}\n\n"
    res += "Asterisk (*) indicate a sway specific command\n\n"
    res += "|Key| |Command|\n"
    res += "|:---|-:|:-----------|\n"
    for key, command in bindsyms.items():
        hk = str(key)
        instr = ""
        cmd = str(command)
        for setkey, setvalue in sets.items():
            hk = hk.replace(setkey, setvalue)
            hk = hk.replace("space", "󱁐")
            cmd = cmd.replace(setkey, setvalue)

        hk = "+".join([f"`{i}`" for i in hk.split("+")])
        cmd = f"`{cmd}`"

        if cmd.startswith("`exec "):
            cmd = cmd.replace("exec ", "")
        else:
            instr += "*"
        res += f"|{hk}|{instr}|{cmd}|\n"

    offset = 5 * " "
    txt = f"\n{offset}Sway kinbindings as defined in {root_path}\n\n"
    txt += f"{offset}Asterisk (*) indicate a sway specific command\n\n\n"
    txt += f"{offset}{'     Key'.ljust(27)}Command\n\n"

    for key, command in bindsyms.items():
        instr = ""

        hk, cmd = replace_set(key, command, sets)
        hk, cmd = replace_set(hk, cmd, sets)

        hk = "+".join([f"{i}" for i in hk.split("+")])

        if cmd.startswith("exec "):
            cmd = cmd.replace("exec ", "")
        else:
            instr += "*"
        cmd = re.sub(r"^(.{54}).*$", "\g<1>...", cmd)  # cut after 50 character
        txt += f"{offset}{hk.ljust(20)}{instr.ljust(2)}{cmd}\n"

    print(txt)
