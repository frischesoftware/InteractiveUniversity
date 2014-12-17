using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for dbFFSvgElementCoordinateSystem
/// </summary>
public class dbFFSvgElementCoordinateSystem
{
	public dbFFSvgElementCoordinateSystem(List<object> _e, string _force )
	{
        _e.Add(new dbFFSvgElementShapeLINE(_force, 30, 30, 30, 160, 1, "black"));
        _e.Add(new dbFFSvgElementShapeLINE(_force, 30, 160, 160, 160, 1, "black"));
	}
}