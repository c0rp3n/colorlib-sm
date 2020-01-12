#include <sourcemod>
#include <profiler>
#include <multicolors>

public void OnPluginStart()
{
    RegConsoleCmd("sm_bench_multi", Command_BenchMulti);
}

public Action Command_BenchMulti(int client, int args)
{
    Profiler profile = new Profiler();

    profile.Start();

    for (int i = 0; i <= 10000; i++)
    {
        CPrintToChat(client, "{darkred}This {darkblue}is {green}a {lightgreen}test{default}!");
    }

    profile.Stop();

    ReplyToCommand(client, "Time needed for CPrintToChat: %f", profile.Time);

    profile.Start();

    for (int i = 0; i <= 10000; i++)
    {
        CPrintToServer("{darkred}This {darkblue}is {green}a {lightgreen}test{default}!");
    }

    profile.Stop();

    ReplyToCommand(client, "Time needed for CPrintToServer: %f", profile.Time);

    delete profile;
}
