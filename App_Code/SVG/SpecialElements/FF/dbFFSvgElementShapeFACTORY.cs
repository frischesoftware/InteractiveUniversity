using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for dbFFSvgElementShapeFACTORY
/// </summary>
public class dbFFSvgElementShapeFACTORY
{
    public string force { get; set; }
    public string shape { get; set; } // Name des shapes, auch info, daß es fixed ist
    public string blob { get; set; }
    public int size_x { get; set; }
    public int size_y { get; set; }
    public int move_x { get; set; }
    public int move_y { get; set; }


    public dbFFSvgElementShapeFACTORY(string _force, int _size, int _move_x, int _move_y)
	{
        force = _force;
        shape = "fixedpath";
        blob = "M480,288L448,0h-64l-32,288h-32v-64l-64,64v-64l-64,64v-64l-64,64v-64l-64,64v-64L0,288v224h512V288H480z M96,416H32v-32h64" +
    "V416z M96,352H32v-32h64V352z M192,416h-64v-32h64V416z M192,352h-64v-32h64V352z M288,416h-64v-32h64V416z M288,352h-64v-32h64V352z";
        size_x = 25;
        size_y = 25;
        move_x = _move_x;
        move_y = _move_y;
	}
}