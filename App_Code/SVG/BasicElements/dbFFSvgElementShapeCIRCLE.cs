using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public partial class dbFFSvgElementShapeCIRCLE
{
    public string force { get; set; }
    public string shape { get; set; }
    public int size { get; set; }
    public string color { get; set; }
    public int move_x { get; set; }
    public int move_y { get; set; }
    public string id { get; set; } // id für das html - element
    public string _class { get; set; }

    public dbFFSvgElementShapeCIRCLE(string _force, int _size, string _color, int _move_x, int _move_y, string _id=null, string __class=null)
    {
        force = _force;
        shape = "circle";
        size = _size;
        color = _color;
        move_x = _move_x;
        move_y = _move_y;
        id = _id;
        _class = __class;
    }
}
