#include <shell>
#include <string>

#define CL_UNIT_TEST
#include <colorlib>

public void main()
{
    char message[256] = "{red}Red \\{default}vs \\{blue}Blue";
    char expected[]   = "\x07Red {default}vs {blue}Blue";

    CFormat(message, sizeof(message));
    bool passed = StrEqual(message, expected, true);

    print(passed ? "PASSED\n" : "FAILED\n");
}
