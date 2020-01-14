<h1 align="center">
    ColorLib
</h1>
<p align="center">
    <strong>A sourcepawn library for chat colors.</strong>
</p>

ColorLib is built as a replacement for Colors, it uses a a less naive approach
to formatting messages to drastically improve the performance of C* functions.

## Status

This project is still under active development and has not yet reached a stable
version until v1.0.0 So when using this code currently expect random error and
dragons.

## Performance
### CPrintToChat
 - ColorLib - Time needed for 10000 messages: 0.061606
 - Multi-Colors - Time needed for 10000 messages: 0.155233

## Functions
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
int CPreFormat(char[] message, int maxlength)
void CFormat(char[] message, int maxlength, int author = -1)
void CRemoveTags(char[] message, int maxlength)
```

## Related Projects
 - Multi-Colors: https://github.com/Bara/Multi-Colors
 - Stamm-Colors: https://github.com/popoklopsi/Stamm/blob/master/include/stamm/stamm-colors.inc
 - Colors: https://forums.alliedmods.net/showthread.php?t=96831
 - More Colors: https://forums.alliedmods.net/showthread.php?t=185016

## Download
 - https://github.com/c0rp3n/colorlib
