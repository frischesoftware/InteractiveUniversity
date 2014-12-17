using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for dbFFSvgElementShapeTRIANGLE
/// </summary>
public class dbFFSvgElementShapeTRIANGLE   // Wie HEART
{
    public string force { get; set; }
    public string shape { get; set; } // Name des shapes, auch info, daß es fixed ist
    public string blob { get; set; }
    public int size_x { get; set; }
    public int size_y { get; set; }
    public int move_x { get; set; }
    public int move_y { get; set; }
    public string id { get; set; }
    public string _class { get; set; }


    public dbFFSvgElementShapeTRIANGLE(string _force_shortname, int _size, int _move_x, int _move_y, string _id=null, string __class = null  )
	{
        force = _force_shortname;
        shape = "fixedpath";
        blob = "m224.5332,333.20502l36.56903,-63.99603l36.56982,63.99603l-73.13885,0z";
        size_x = _size;
        size_y = _size;
        move_x = _move_x;
        move_y = _move_y;
        id = _id;
        _class = __class;
	}
}