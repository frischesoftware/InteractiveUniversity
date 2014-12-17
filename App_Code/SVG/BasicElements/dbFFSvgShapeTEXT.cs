using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;



public partial class dbFFSvgShapeTEXT
{
    public string force { get; set; }
    public string shape { get; set; }
    public string text { get; set; }
    public int move_x { get; set; }
    public int move_y { get; set; }
    public int textsize { get; set; }

    public dbFFSvgShapeTEXT(string _force, string _text, int _move_x, int _move_y, int _textsize)
    {
        force = _force;
        shape = "text";
        text = _text;
        move_x = _move_x;
        move_y = _move_y;
        textsize = _textsize;
    }
}