using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public partial class dbFFSvgElementShapeLINE
{
    public string force { get; set; }
    public string shape { get; set; }
    public int x1 { get; set; }
    public int y1 { get; set; }
    public int x2 { get; set; }
    public int y2 { get; set; }
    public int stroke { get; set; }
    public string color { get; set; }

    public dbFFSvgElementShapeLINE(string _force, int _x1, int _y1, int _x2, int _y2, int _stroke, string _color)
    {
            force = _force;
            shape = "line";
            x1 = _x1;
            y1 = _y1;
            x2 = _x2;
            y2 = _y2;
            stroke = _stroke;
            color = _color;
        }
}