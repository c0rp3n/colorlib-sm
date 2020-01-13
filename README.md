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
 + ColorLib - Time needed for 10000 messages: 0.061606
 + Multi-Colors - Time needed for 10000 messages: 0.155233

## Functions
 + CPrintToChat(int client, const char[] message, any ...)
 + CPrintToChatAll(const char[] message, any ...)
 + CPrintToChatEx(int client, int author, const char[] message, any ...)
 + CPrintToChatAllEx(int author, const char[] message, any ...)
 + CPrintToChatTeam(int team, const char[] message, any ...)
 + CPrintToChatTeamEx(int team, int author, const char[] message, any ...)
 + CPrintToChatAdmins(int flags, const char[] message, any ...)
 + CReplyToCommand(int author, const char[] message, any ...)
 + CReplyToCommandEx(int client, int author, const char[] message, any ...)
 + CShowActivity(int author, const char[] message, any ...)
 + CShowActivityEx(int author, const char[] tag, const char[] message, any ...)
 + CShowActivity2(int author, const char[] tag, cconst char[] message, any ...)
 + CPrintToServer(const char[] message, any ...)
 + ~~CFormatColor(char[] message, int maxlength, int author = -1)~~
 + CFormat(char[] message, int maxlength, int author = -1)
 + CRemoveTags(char[] message, int maxlength)
 + ~~CSetPrefix(const char[] prefix, any ...)~~
 + ~~CClearPrefix()~~

## Links
 + Multi-Colors: https://github.com/Bara/Multi-Colors
 + Stamm-Colors: https://github.com/popoklopsi/Stamm/blob/master/include/stamm/stamm-colors.inc
 + Colors: https://forums.alliedmods.net/showthread.php?t=96831
 + More Colors: https://forums.alliedmods.net/showthread.php?t=185016

## Download
 + https://github.com/c0rp3n/colorlib
