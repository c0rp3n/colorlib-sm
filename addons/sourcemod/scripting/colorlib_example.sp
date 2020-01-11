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
    CPrintToChatAll("CPrintToChatAll - {darkblue}%s - {darkred}%s", "Test", "Test");
    CPrintToChatEx(client, client, "CPrintToChatEx - {darkblue}%s - {darkred}%s", "Test", "Test");
    CPrintToChatAllEx(client, "CPrintToChatAllEx - {darkblue}%s - {darkred}%s", "Test", "Test");

    CReplyToCommand(client, "CReplyToCommand - {darkblue}%s - {darkred}%s", "Test", "Test");
    CReplyToCommandEx(client, client, "CReplyToCommandEx - {darkblue}%s - {darkred}%s", "Test", "Test");

    char sName[MAX_NAME_LENGTH];
    Format(sName, sizeof(sName), "{green}%N", client);

    CPrintToChat(client, "CPrintToChat - Name (Before CFormatColor): %s", sName);
    PrintToChat(client, "PrintToChat - Name (Before CFormatColor): %s", sName);
    CPrintToChat(client, "CPrintToChat - Name (After CFormatColor): %s", sName);
    PrintToChat(client, "PrintToChat - Name (After CFormatColor): %s", sName);

    Format(sName, sizeof(sName), "{green}%N", client);

    CPrintToChat(client, "Name (Before CFormatColor): %s", sName);
    CRemoveTags(sName, MAX_NAME_LENGTH);
    CPrintToChat(client, "Name (After CFormatColor): %s", sName);

    CPrintToServer("CPrintToServer - {darkblue}%s - {darkred}%s", "Test", "Test");
}