using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
public partial class dbFFSvgElementShapePATH  //dbFFSvgEllipticalArc
{
    public string force { get; set; }
    public string shape { get; set; } // path (aber: kein gewöhnlicher path...)
    public string[] path { get; set; }
    public string fill { get; set; } // none
    public string stroke { get; set; } //black
    public int strokeWidth { get; set; }
    public int move_x { get; set; }
    public int move_y { get; set; }

    public dbFFSvgElementShapePATH(string _force, string[] _path, string _fill, string _stroke, int _strokeWidth, int _move_x, int _move_y)
    {

        force = _force;
        shape = "path";
        path = _path;
        fill = _fill;
        stroke = _stroke;
        strokeWidth = _strokeWidth;
        move_x = _move_x;
        move_y = _move_y;

    }
}
