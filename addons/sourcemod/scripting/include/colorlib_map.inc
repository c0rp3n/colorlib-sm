//
// This file was generated with color_gen.py and should not be used outside of colorlib.inc
//
// Do not edit! Regenerate this file with color_gen.py
//

#if defined _colorlib_map_included
    #endinput
#endif
#define _colorlib_map_included

enum CL_Colors
{
    CL_Color_Default = 0x1,
    CL_Color_Teamcolor = 0x3,
    CL_Color_Red = 0x7,
    CL_Color_Lightred = 0xf,
    CL_Color_Darkred = 0x2,
    CL_Color_Bluegrey = 0xa,
    CL_Color_Blue = 0xb,
    CL_Color_Darkblue = 0xc,
    CL_Color_Purple = 0x3,
    CL_Color_Orchid = 0xe,
    CL_Color_Orange = 0x10,
    CL_Color_Yellow = 0x9,
    CL_Color_Gold = 0x10,
    CL_Color_Lightgreen = 0x5,
    CL_Color_Green = 0x4,
    CL_Color_Lime = 0x6,
    CL_Color_Grey = 0x8,
    CL_Color_Grey2 = 0xd,
};

CL_Colors _CL_ColorMap(char color[16])
{
    if (color[0] == 'd')
    {
        if (color[1] == 'e')
        {
            return CL_Color_Default;
        }
        else if (color[1] == 'a')
        {
            if (color[2] == 'r')
            {
                if (color[3] == 'k')
                {
                    if (color[4] == 'r')
                    {
                        return CL_Color_Darkred;
                    }
                    else if (color[4] == 'b')
                    {
                        return CL_Color_Darkblue;
                    }
                }
            }
        }
    }
    else if (color[0] == 't')
    {
        return CL_Color_Teamcolor;
    }
    else if (color[0] == 'r')
    {
        return CL_Color_Red;
    }
    else if (color[0] == 'l')
    {
        if (color[1] == 'i')
        {
            if (color[2] == 'g')
            {
                if (color[3] == 'h')
                {
                    if (color[4] == 't')
                    {
                        if (color[5] == 'r')
                        {
                            return CL_Color_Lightred;
                        }
                        else if (color[5] == 'g')
                        {
                            return CL_Color_Lightgreen;
                        }
                    }
                }
            }
            else if (color[2] == 'm')
            {
                return CL_Color_Lime;
            }
        }
    }
    else if (color[0] == 'b')
    {
        if (color[1] == 'l')
        {
            if (color[2] == 'u')
            {
                if (color[3] == 'e')
                {
                    if (color[4] == 'g')
                    {
                        return CL_Color_Bluegrey;
                    }
                    else if (color[4] == 0x0)
                    {
                        return CL_Color_Blue;
                    }
                }
            }
        }
    }
    else if (color[0] == 'p')
    {
        return CL_Color_Purple;
    }
    else if (color[0] == 'o')
    {
        if (color[1] == 'r')
        {
            if (color[2] == 'c')
            {
                return CL_Color_Orchid;
            }
            else if (color[2] == 'a')
            {
                return CL_Color_Orange;
            }
        }
    }
    else if (color[0] == 'y')
    {
        return CL_Color_Yellow;
    }
    else if (color[0] == 'g')
    {
        if (color[1] == 'o')
        {
            return CL_Color_Gold;
        }
        else if (color[1] == 'r')
        {
            if (color[2] == 'e')
            {
                if (color[3] == 'e')
                {
                    return CL_Color_Green;
                }
                else if (color[3] == 'y')
                {
                    if (color[4] == 0x0)
                    {
                        return CL_Color_Grey;
                    }
                    else if (color[4] == '2')
                    {
                        return CL_Color_Grey2;
                    }
                }
            }
        }
    }

    return CL_Color_Default;
}

