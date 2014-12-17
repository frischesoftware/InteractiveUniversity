using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public partial class dbFFSvgElementShapeHEART // fixed => vordefinierte Punkte
{
    public string force { get; set; }
    public string shape { get; set; } // Name des shapes, auch info, daß es fixed ist
    public string blob { get; set; }
    public int size_x { get; set; }
    public int size_y { get; set; }
    public int move_x { get; set; }
    public int move_y { get; set; }

    public dbFFSvgElementShapeHEART(string _force_shortname, int _size, int _move_x, int _move_y)
    {
        force = _force_shortname;
        shape = "fixedpath";  //eigene Klassen im Backend, "fixedpath" für sowas clientside, damit der Code dort klein bleibt.
        blob = "M140,20C " +
                "73,20 " + "20,74 " + "20,140 " +
                "20,275 " + "156,310 " + "248,443 " +
                "336,311 " + "477,270 " + "477,140 " +
                "477,74 " + "423,20 " + "357,20 " +
                "309,20 " + "267,48 " + "248,89 " +
                "229,48 " + "188,20 " +
                "140,20Z ";
        size_x = _size;
        size_y = _size;
        move_x = _move_x;
        move_y = _move_y;
    }
}
