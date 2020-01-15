#pragma semicolon 1
#pragma newdecls required

#include <sourcemod>
#include <cstrike>
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

    CPrintToChatTeam(CS_TEAM_T, "CPrintToTeamEx - {team 1}%s", "Hello Terrorists");
    CPrintToChatTeam(CS_TEAM_CT, "CPrintToTeamEx - {team 2}%s", "Hello Counter Terrorist");
    CPrintToChatTeamEx(GetClientTeam(client), client, "CPrintToTeam - {teamcolor}%N", client);

    CPrintToChatAdmins(ADMFLAG_GENERIC, "CPrintToChatAdmins - {blue}%s", "STAFF PLS HELP ME");

    CReplyToCommand(client, "CReplyToCommand - {darkblue}%s - {darkred}%s", "Test", "Test");
    CReplyToCommandEx(client, client, "CReplyToCommandEx - {darkblue}%s - {darkred}%s", "Test", "Test");

    CShowActivity(client, "Command_ColorLib Usage: %s", "{red}CShowActivity");
    CShowActivity2(client, "{green}[ColorLib]", "Command_ColorLib Usage: %s", "{red}CShowActivity2");
    CShowActivityEx(client, "{green}[ColorLib]", "Command_ColorLib Usage: %s", "{red}CShowActivityEx");

    CPrintToServer("CPrintToServer - {darkblue}%s - {darkred}%s", "Test", "Test");

    CSayText2(client, client, "{teamcolor}Hello");
}