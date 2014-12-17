using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for dbFFSvgElementFIXVARCOSTS
/// </summary>
public class dbFFSvgElementFIXVARCOSTS
{
	public dbFFSvgElementFIXVARCOSTS(List<object> _e, string _force_shortname,int _row, int _column)
	{
        _e.Add(new dbFFSvgElementShapeRECT(_force_shortname, 20, 30, "black", _column, _row, "#ccc", "black"));
        _e.Add(new dbFFSvgElementShapeLINE(_force_shortname, _column, _row + 10, _column + 20, _row + 10, 1, "blue"));
        _e.Add(new dbFFSvgShapeTEXT(_force_shortname, "var", _column + 3, _row - 3, 12));
        _e.Add(new dbFFSvgShapeTEXT(_force_shortname, "fix", _column + 3, _row + 10, 12));

	}
}