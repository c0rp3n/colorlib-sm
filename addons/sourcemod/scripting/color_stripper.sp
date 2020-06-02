#pragma semicolon 1
#pragma newdecls required

#include <sourcemod>
#include <sdktools>
#include <colorlib>

public Plugin myinfo =
{
    name = "ColorLib Color Stripper Example",
    author = "c0rp3n",
    description = "",
    version = "1.0.0",
    url = "github.com/c0rp3n/colorlib-sm"
};

public void OnPluginStart()
{
    HookEvent("player_changename", Event_NameChange, EventHookMode_Pre);

    for (int i = 1; i < MaxClients; ++i)
    {
        if (IsClientInGame(i))
        {
            OnClientPutInServer(i);
        }
    }
}

public void OnClientPutInServer(int client)
{
    char buffer[64];
    GetClientName(client, buffer, sizeof(buffer));
    CRemoveTags(buffer, sizeof(buffer));
    if (buffer[0] != 0)
    {
        SetClientName(client, buffer);
    }
}

public Action Event_NameChange(Event event, const char[] name, bool dontBroadcast)
{
    int client = GetClientOfUserId(event.GetInt("userid"));

    char buffer[64];
    GetEventString(event, "newname", buffer, sizeof(buffer));

    CRemoveTags(buffer, sizeof(buffer));
    if (buffer[0] == 0)
    {
        return Plugin_Stop;
    }
    SetClientName(client, buffer);

    return Plugin_Continue;
}
