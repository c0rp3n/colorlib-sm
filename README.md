<h1 align="center">
    ColorLib
</h1>
<p align="center">
    <strong>A sourcepawn library for chat colors.</strong>
</p>

ColorLib is built as a replacement for Colors, it uses a a less naive approach
to formatting messages to drastically improve the performance of C* functions.

## Performance
#### CPrintToChat
 - ColorLib - Time needed for 10000 messages: 0.0600535
 - Multi-Colors - Time needed for 10000 messages: 0.114196
#### CPrintToServer
 - ColorLib - Time needed for 10000 messages: 0.037418‬
 - Multi-Colors - Time needed for 10000 messages: 0.0842195‬

## Usage
### Color Lib
First clone the repo.
```bash
git clone --recursive https://github.com/c0rp3n/colorlib-sm.git
```
Then include colorlib in your project make sure to either pass the include dir
to `spcomp` or copy the includes to your include dir.
For an example `vscode` config see [here](https://gist.github.com/c0rp3n/0f2d84e576bfb471de2a793f56df9758).

*If previously using another color library make sure to no longer include it,
and update the config and regenerate the `colorlib_map.inc` as show below with
your old colors.*

#### Example Usage
```SourcePawn
#pragma semicolon 1
#pragma newdecls required

#include <sourcemod>
#include <colorlib>

public void OnPluginStart()
{
    RegConsoleCmd("sm_colorlib", Command_ColorLib);
}

public Action Command_ColorLib(int client, int args)
{
    CPrintToChat(client, "CPrintToChat - {darkblue}%s - {darkred}%s", "Test", "Test");
}
```

### Color Gen
To change the output colors you first need to install `colorlib_gen`.
```bash
cd tools/colorlib-gen/
pip install requirements.txt
pip install .
```

There is an example config file provided that it is recommended you copy it and
make any required changes can be seen [here](tools/example_conf.yaml).

Then you can rerun `colorlib_gen` to generate a new `colorlib_map.inc` to
replace the default one provided.

#### Example Usage
```bash
# for more info use ./color_gen.py -h
colorlib_gen -re --target "sourcepawn" --config "./example_conf.yaml" colorlib_map.inc
```

#### Example GitHub workflow for SourcePawn
__Note:__ _This must executed before the plugins will be compiled._
```yaml
- name: Set up Python
  uses: actions/setup-python@v2
  with:
    python-version: '3.x'

- name: Install dependencies
  run: python3 -m pip install --upgrade pip setuptools wheel

- name: Download colorlib-gen
  run: |
    cd tools
    git clone https://github.com/c0rp3n/colorlib-gen.git

- name: Install colorlib-gen
  run: |
    cd tools/colorlib-gen
    pip install -r ./requirements.txt
    python3 ./setup.py install
- name: Generate colorlib_map.inc
  run: colorlib_gen -re --target "sourcepawn" --config "./example_conf.yaml" colorlib_map.inc
```

### Functions
```SourcePawn
void CPrintToChat(int client, const char[] message, any ...)
void CPrintToChatAll(const char[] message, any ...)
void CPrintToChatEx(int client, int author, const char[] message, any ...)
void CPrintToChatAllEx(int author, const char[] message, any ...)
void CPrintToChatTeam(int team, const char[] message, any ...)
void CPrintToChatTeamEx(int team, int author, const char[] message, any ...)
void CPrintToChatAdmins(int flags, const char[] message, any ...)
void CReplyToCommand(int author, const char[] message, any ...)
void CReplyToCommandEx(int client, int author, const char[] message, any ...)
void CShowActivity(int author, const char[] message, any ...)
void CShowActivityEx(int author, const char[] tag, const char[] message, any ...)
void CShowActivity2(int author, const char[] tag, cconst char[] message, any ...)
void CPrintToServer(const char[] message, any ...)
void CGetClientName(int client, char[] name, int mexlength)
int  CPreFormat(char[] message, int maxlength)
void CFormat(char[] message, int maxlength, int author = -1)
void CRemoveTags(char[] message, int maxlength)
void CRemoveColors(char[] message, int maxlength)
void CEscapeColors(char[] message, int maxlength)
```

## Related Projects
 - Multi-Colors: https://github.com/Bara/Multi-Colors
 - Stamm-Colors: https://github.com/popoklopsi/Stamm/blob/master/include/stamm/stamm-colors.inc
 - Colors: https://forums.alliedmods.net/showthread.php?t=96831
 - ColorVariables: https://github.com/PremyslTalich/ColorVariables
 - More Colors: https://forums.alliedmods.net/showthread.php?t=185016

## Download
 - https://github.com/c0rp3n/colorlib-sm
