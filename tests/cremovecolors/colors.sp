#include <shell>
#include <string>

#define CL_UNIT_TEST
#include <colorlib>

public void main()
{
    char message[256] = "\x07Red \x01vs \x0BBlue";
    char expected[]   = "Red vs Blue";

    CRemoveColors(message, sizeof(message));
    bool passed = StrEqual(message, expected, true);

    print(passed ? "PASSED\n" : "FAILED\n");
}
