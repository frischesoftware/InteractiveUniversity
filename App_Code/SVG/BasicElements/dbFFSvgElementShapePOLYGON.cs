using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public partial class dbFFSvgElementShapePOLYGON
{
    public string force { get; set; }
    public string shape { get; set; }
    public string fill { get; set; }
    public int width { get; set; }
    public string[] points { get; set; }
    public int move_x { get; set; }
    public int move_y { get; set; }

    public dbFFSvgElementShapePOLYGON(string _force, string _fill, int _width, string[] _points, int _move_x, int _move_y)
    {     
            force = _force;
            shape = "polygon";
            fill = _fill;
            width = _width;
            points = _points;
            move_x = _move_x;
            move_y = _move_y;     
    }
}
