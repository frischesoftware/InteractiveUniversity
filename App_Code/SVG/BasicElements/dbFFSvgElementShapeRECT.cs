using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public partial class dbFFSvgElementShapeRECT
{
    public string force { get; set; }
    public string shape { get; set; }
    public int x { get; set; }
    public int y { get; set; }
    public string color { get; set; }
    public int move_x { get; set; }
    public int move_y { get; set; }
    public string fill { get; set; }
    public string stroke { get; set; }
    public string id { get; set; }
    public string _class { get; set; }

    public dbFFSvgElementShapeRECT(string _force, int _x, int _y, string _color, int _move_x, int _move_y, string _fill = "#ccc", string _stroke = "#ccc", string _id = null, string __class = null)
    {
        force = _force;
        shape = "rect";
        x = _x;
        y = _y;
        color = _color;
        move_x = _move_x;
        move_y = _move_y;
        fill = _fill;
        stroke = _stroke;
        id = _id;
        _class = __class;

    }
}