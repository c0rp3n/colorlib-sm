#! /usr/bin/env python3

import argparse
import re
import sys

COLORS = [
    ('default',     0x01),
    ('teamcolor',   0x03),
    ('red',         0x07),
    ('lightred',    0x0F),
    ('darkred',     0x02),
    ('bluegrey',    0x0A),
    ('blue',        0x0B),
    ('darkblue',    0x0C),
    ('purple',      0x03),
    ('orchid',      0x0E),
    ('orange',      0x10),
    ('yellow',      0x09),
    ('gold',        0x10),
    ('lightgreen',  0x05),
    ('green',       0x04),
    ('lime',        0x06),
    ('grey',        0x08),
    ('grey2',       0x0D)
    ]

TAB = "    "

HEADER = (
    "//\n" +
    "// This file was generated with color_gen.py and should not be used outside of colorlib.inc\n" +
    "//\n" +
    "// Do not edit! Regenerate this file with color_gen.py\n" +
    "//\n" +
    "\n" +
    "#if defined _colorlib_map_included\n" +
    TAB + "#endinput\n" +
    "#endif\n" +
    "#define _colorlib_map_included\n" +
    "\n"
    )

FOOTER = (
    "\n"
    )

ENUM_DEF = (
    "enum CL_Colors\n" +
    "{{\n" +
    "{}" +
    "}};\n"
    )

ENUM_ENTRY_DEF = TAB + "{} = {},\n"

COLOR_FUNCTION_DEF = (
    "CL_Colors _CL_ColorMap(char color[16])\n" +
    "{{\n" +
    "{}" +
    "\n" +
    "{}" +
    "}}\n"
    )

IF_DEF = [
    TAB + "if (color[{}] == {})\n",
    TAB + "{{\n",
    TAB + "{}",
    TAB + "}}\n"
    ]

ELIF_DEF = [
    TAB + "else if (color[{}] == {})\n",
    TAB + "{{\n",
    TAB + "{}",
    TAB + "}}\n"
    ]

ELSE_DEF = [
    TAB + "else\n",
    TAB + "{{\n",
    TAB + "{};",
    TAB + "}}\n"
    ]

CHAR_DEF = "\'{}\'"

RETURN_DEF = TAB + "return {};\n"

color_enum_names = {}

def get_indent(i : int) -> str:
    if i < 1:
        return ""
    
    indent = TAB
    for i in range(1, i):
        indent = indent + TAB

    return indent

def get_indented_def(i : int, definition : str, first : bool = True) -> str:
    if first:
        indented_def = definition[0]
    else:
        indented_def = get_indent(i) + definition[0]

    for line in range(1, len(definition)):
        indented_def = indented_def + get_indent(i) + definition[line]

    return indented_def

def group_till_unique(in_group : list, i : int = 0) -> dict:
    if (len(in_group) <= 1):
        return in_group

    groups = {}
    for (key, group) in group_by_char_at(in_group, i).items():
        groups[key] = group_till_unique(group, i + 1)

    return groups

def group_by_char_at(colors : list, i : int = 0) -> dict:
    groups = {}
    for color in colors:
        if len(color) == i:
            groups[0] = [color]
        elif color[i] in groups:
            groups[color[i]].append(color)
        else:
            groups[color[i]] = [color]

    return groups

def create_enum() -> str:
    ev = []
    for color in COLORS:
        name = 'CL_Color_' + color[0].capitalize()
        value = hex(color[1])
        color_enum_names[color[0]] = name
        ev.append(ENUM_ENTRY_DEF.format(name, value))

    enums = ""
    for enum in ev:
        enums = enums + enum

    return ENUM_DEF.format(enums)

def create_return(color : str) -> str:
    return RETURN_DEF.format(color_enum_names[color])

def create_statement(definition : str, 
                     depth : int,
                     key,
                     ret : str,
                     first : bool = True) -> str:
    if isinstance(key, str):
        char = CHAR_DEF.format(key)
    else:
        char = hex(key)

    return get_indented_def(
        depth,
        definition,
        first
        ).format(depth, char, ret)

def create_if(depth : int, key, ret : str) -> str:
    return create_statement(IF_DEF, depth, key, ret, True)

def create_elif(depth : int, key, ret : str) -> str:
    return create_statement(ELIF_DEF, depth, key, ret, False)

def create_decision(group : dict, depth : int = 0) -> str:
    decisions = ""
    for i, (key, value) in enumerate(group.items()):
        print('\'' + str(key) + '\': ' + str(value))
        print(type(value))
        if isinstance(value, dict):
            body = create_decision(value, depth + 1)
        else:
            body = create_return(value[0])
        
        if i == 0:
            decisions = create_if(depth, key, body)
        else:
            decisions = decisions + create_elif(depth, key, body)

    return decisions


def create_map() -> str:
    # sorted_colors = sorted(COLORS)

    groups = group_till_unique([c[0] for c in COLORS])

    return COLOR_FUNCTION_DEF.format(
        create_decision(groups), 
        create_return('default')
        )

def main():
    parser = argparse.ArgumentParser(description='ColorLib color map creator.')
    parser.add_argument(
        'out',
        type=argparse.FileType('w', encoding='UTF-8'),
        help='output path \'{path to include dir}/colorlib_map.inc\''
        )

    args = parser.parse_args()

    args.out.write(HEADER)
    args.out.write(create_enum())
    args.out.write('\n')
    args.out.write(create_map())
    args.out.write(FOOTER)
    
    args.out.close()

if __name__ == '__main__':
    main()
