<h1 align="center">
    ColorLib
</h1>
<p align="center">
    <strong>A sourcepawn library for chat colors.</strong>
</p>

ColorLib is built as a replacement for Colors, it uses a a less naive approach
to formatting messages to drastically improve the performance of C* functions.

## Status

*This project is still under active development and has not yet reached a stable
version until v1.0.0 So when using this code currently expect random error and
dragons.*

## Performance
#### CPrintToChat
 - ColorLib - Time needed for 10000 messages: 0.0600535
 - Multi-Colors - Time needed for 10000 messages: 0.114196
#### CPrintToServer
 - ColorLib - Time needed for 10000 messages: 0.037418‬
 - Multi-Colors - Time needed for 10000 messages: 0.0842195‬

## Usage
### Color Lib
Simply include colorlib and you should be good to go.

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
To change the output colors you first need to create a new or edit your config
file.

There is an example config file provided that it is recommended you copy from it
can be seen [here](tools/example_conf.yaml).

Then you can rerun `color_gen.py` to generate a new `colorlib_map.inc` to
replace the default one provided.

#### Example Usage
```bash
# for more info use ./color_gen.py -h
./color_gen.py -r --config "./example_conf.yaml" "./colorlib_map.inc"
```

#### Example GitHub workflow
__Note:__ _This must executed before the plugins will be compiled._
```yaml
- name: Generate colorlib.inc
  run: python3 ./color_gen.py -r --config "./example_conf.yaml" "../addons/sourcemod/scripting/include/colorlib_map.inc"
  working-directory: ./tools
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
int  CPreFormat(char[] message, int maxlength)
void CFormat(char[] message, int maxlength, int author = -1)
void CRemoveTags(char[] message, int maxlength)
void CRemoveColors(char[] message, int maxlength)
```

## Related Projects
 - Multi-Colors: https://github.com/Bara/Multi-Colors
 - Stamm-Colors: https://github.com/popoklopsi/Stamm/blob/master/include/stamm/stamm-colors.inc
 - Colors: https://forums.alliedmods.net/showthread.php?t=96831
 - More Colors: https://forums.alliedmods.net/showthread.php?t=185016

## Download
 - https://github.com/c0rp3n/colorlib
