using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class dbKANBANSvgMAP
{
    public dbKANBANSvgMAP(List<object> _e, int stages)
    {
        if (stages == 2)// 1 Maschine, 1 Store
        {
            _e.Add(new dbKANBANSvgMaschine(_e, 70));
            _e.Add(new dbKANBANSvgStore1(_e, 250));
            _e.Add(new dbKANBANSvgStore2(_e, 400));
        }
    }
}
public class dbKANBANSvgMaschine
{
    public dbKANBANSvgMaschine(List<object> _e, int offset_x)
    {
        //int offset_x = 70;
        int height = 150;
        int width = 90;

        _e.Add(new dbFFSvgElementShapeRECT("1", width, height, "grey", offset_x, 20, "darkgrey", "darkgrey"));
        _e.Add(new dbFFSvgElementShapeCIRCLE("1", 20, "white", offset_x + width / 2, 50, "prod"));
        _e.Add(new dbFFSvgShapeTEXT("1", "Assembly", offset_x, height, 20));
    }
}

public class dbKANBANSvgStore1
{
    public dbKANBANSvgStore1(List<object> _e, int x)
    {
        int height = 150;
        int width = 90;

        _e.Add(new dbFFSvgElementShapeRECT("1", width, height, "grey", x, 20, "lightblue", "lightblue"));

        for (int i = 0; i < 15; i++)
        {
            var _x = x + i % 3 * 30;
            var _y = 20 + i / 3 * 30;
            _e.Add(new dbFFSvgElementShapeRECT("1", 30, 30, "grey", _x, _y, "grey", "darkblue"));
        }


        _e.Add(new elEUROSTUECK(_e, 250, "s1_p1_1", "s1_p1"));

     
        _e.Add(new dbFFSvgElementShapeRECT("1", 7, 7, "red", x + 25 - 10, 120, "red", "red", "s1_p2_1", "s1_p2"));
        _e.Add(new dbFFSvgElementShapeRECT("1", 7, 7, "red", x + 50 - 10, 120, "red", "red", "s1_p2_2", "s1_p2"));
        _e.Add(new dbFFSvgElementShapeRECT("1", 7, 7, "red", x + 25 - 10, 145, "red", "red", "s1_p2_3", "s1_p2"));
        _e.Add(new dbFFSvgElementShapeRECT("1", 7, 7, "red", x + 50 - 10, 145, "red", "red", "s1_p2_4", "s1_p2"));

        /*            _e.Add(new dbFFSvgElementShapeTRIANGLE("1", 10, offset_x + 25, 100, "s1_p2_1", "s1_p2"));*/    
        _e.Add(new dbFFSvgShapeTEXT("1", "Store1", x, height, 20));
    }
}


public class dbKANBANSvgStore2
{
    public dbKANBANSvgStore2(List<object> _e, int x)
    {
        int height = 150;
        int width = 90;
        string backgroundcolor = "lightblue";
        _e.Add(new dbFFSvgElementShapeRECT("1", width, height, backgroundcolor, x, 20, "lightblue", "lightblue"));

        // 2 Produktteile
        int  y = 50;
        int diameter_outer = 20;
        int diameter_inner = 8;
        int abstand_links = 5;


        int _x;
        int _y;
        int zeile = 0;        
        int maxnumber = 4;
        int stückprozeile=maxnumber;
        stückprozeile = getMaxNumberOfItemsPerLineInStore(width, diameter_outer, maxnumber);

        for (int i = 0; i < maxnumber; i++)
        {            
            _x = x + i % stückprozeile * (5 + diameter_outer + 5);
            _y = y + i / stückprozeile* (5 + diameter_outer + 5);
            var ii = i + 1;
            _e.Add(new elEUROSTUECK_OUTER(_e, diameter_outer, diameter_inner, backgroundcolor, _x, _y, "s2_p1_" + ii, "s2_p1"));
        }

        stückprozeile = getMaxNumberOfItemsPerLineInStore(width, diameter_inner, maxnumber);

        for (int i = 0; i < maxnumber; i++)
        {
            _x = x + i % stückprozeile * (5 + diameter_inner + 5);  // Modulo
            _y = y + i / stückprozeile* (5 + diameter_inner + 5); // Integer Division
            var ii = i + 1;
            _e.Add(new elEUROSTUECK_INNER(_e, diameter_inner, _x, _y+70, "s2_p1_i_" + ii, "s2_p2"));
        }


        _e.Add(new dbFFSvgShapeTEXT("1", "Store2", x, height, 20));
    }

    private static int getMaxNumberOfItemsPerLineInStore(int width, int diameter, int maxnumber)
    {
        int stückprozeile = 99;
        for (int i = 0; i < maxnumber; i++)
        {
            if (i * (5 + diameter + 5) >= width)
            {
                stückprozeile = i;
                break;
            }
        }
        return stückprozeile;
    }
}


public class elEUROSTUECK
{
    public elEUROSTUECK(List<object> _e, int x, string _id, string _class)
    {
        int y = 50;
        _e.Add(new elEUROSTUECK_OUTER(_e, 20, 8, "purple", x, y, _id, _class));

    }
}

public class elEUROSTUECK_OUTER // Ein Äußerer Ring und ein Inneres Kreiselement
{
    public elEUROSTUECK_OUTER(List<object> _e, int diameter_outer, int diameter_inner, string backgroundcolor, int x, int y, string _id, string _class)
    {
        
        
        _e.Add(new dbFFSvgElementShapeCIRCLE("1", diameter_outer, "green", x, y, _id, _class));
        _e.Add(new dbFFSvgElementShapeCIRCLE("1", diameter_inner, backgroundcolor,
            x + (diameter_outer / 2) - (diameter_inner / 2),
            y + (diameter_outer / 2) - (diameter_inner / 2),
            _id, _class));
    }
}

public class elEUROSTUECK_INNER 
{
    public elEUROSTUECK_INNER(List<object> _e, int diameter_inner, int x, int y, string _id, string _class)
    {
        {
            _e.Add(new dbFFSvgElementShapeCIRCLE("1", diameter_inner, "green",
                       x + (diameter_inner / 2),
                       y + (diameter_inner / 2),
                       _id, _class));
        }
    }
}