#pragma semicolon 1
#pragma newdecls required

#include <sourcemod>
#define CL_USE_MORE_COLORS
#include <colorlib>

public void OnPluginStart()
{
    RegConsoleCmd("sm_colorlib", Command_ColorLib);
}

public Action Command_ColorLib(int client, int args)
{
    CPrintToChat(client, "CPrintToChat - {#0000AA}%s - {#AA0000}%s", "Test", "Test");
    CPrintToChatAll("CPrintToChatAll - {#0000AA}%s - {#AA0000}%s", "Test", "Test");
    CPrintToChatEx(client, client, "CPrintToChatEx - {#0000AA}%s - {#AA0000}%s", "Test", "Test");
    CPrintToChatAllEx(client, "CPrintToChatAllEx - {#0000AA}%s - {#AA0000}%s", "Test", "Test");

    //CPrintToChatTeam(CS_TEAM_T, "CPrintToTeamEx - {team 1}%s", "Hello Terrorists");
    //CPrintToChatTeam(CS_TEAM_CT, "CPrintToTeamEx - {team 2}%s", "Hello Counter Terrorist");
    CPrintToChatTeamEx(GetClientTeam(client), client, "CPrintToTeam - {teamcolor}%N", client);

    CPrintToChatAdmins(ADMFLAG_GENERIC, "CPrintToChatAdmins - {0000FF}%s", "STAAA PLS HELP ME");

    CReplyToCommand(client, "CReplyToCommand - {#0000AA}%s - {#AA0000}%s", "Test", "Test");
    CReplyToCommandEx(client, client, "CReplyToCommandEx - {#0000AA}%s - {#AA0000}%s", "Test", "Test");

    CShowActivity(client, "Command_ColorLib Usage: %s", "{FF0000}CShowActivity");
    CShowActivity2(client, "{00FF00}[ColorLib]", "Command_ColorLib Usage: %s", "{FF0000}CShowActivity2");
    CShowActivityEx(client, "{00FF00}[ColorLib]", "Command_ColorLib Usage: %s", "{FF0000}CShowActivityEx");

    CPrintToServer("CPrintToServer - {#0000AA}%s - {#AA0000}%s", "Test", "Test");

    CSayText2(client, client, "{teamcolor}Hello");

    // Remove Escape codes test
    char buffer[MAX_MESSAGE_LENGTH];
    Format(buffer, sizeof(buffer), "{0000FF}Hello {00FF00}World");
    CFormat(buffer, sizeof(buffer));
    CRemoveColors(buffer, sizeof(buffer));
    CPrintToChat(client, buffer);

    // Remove Tags test
    Format(buffer, sizeof(buffer), "Hello World");
    CRemoveTags(buffer, sizeof(buffer));
    CPrintToChat(client, buffer);

    // Dont replace invalid Tags test
    CPrintToChat(client, "{bad tags here}Hel{#FF}lo {00FF00}World");
}
