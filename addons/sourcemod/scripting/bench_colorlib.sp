#include <sourcemod>
#include <profiler>
#include <colorlib>

public void OnPluginStart()
{
    RegConsoleCmd("sm_bench_lib", Command_BenchLib);
}

public Action Command_BenchLib(int client, int args)
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
