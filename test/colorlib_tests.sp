#pragma semicolon 1
#pragma newdecl required

#include <shell>
#include <string>

#include <colorlib>

void test_cformat()
{
    strcopy(_CL_buffer, sizeof(_CL_buffer), "{red}Hello {bad tag}World!");
    CFormat(_CL_buffer, sizeof(_CL_buffer));
    if (strncmp(_CL_buffer, "\x07Hello {bad tag}World!", true) == 0)
    {
        print("[PASSED] ");
    }
    else
    {
        print("[FAILED] ");
    }
    print("test_cformat\n");
}

int main()
{
    print("running tests:\n");
    test_cformat();
    print("tests complete\n");
}
