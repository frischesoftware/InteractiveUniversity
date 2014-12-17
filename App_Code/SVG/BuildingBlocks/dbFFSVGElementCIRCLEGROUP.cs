using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for dbFFSVGElementCIRCLEGROUP
/// </summary>
public class dbFFSVGElementCIRCLEGROUP
{
    // all same sizes
	public dbFFSVGElementCIRCLEGROUP(List<object> _e, string _force_shortname, int _x, int[] _rows, string _description)
	{
        for (int i = 0; i < _rows.Count(); i++)
        {
            _e.Add(new dbFFSvgElementShapeCIRCLE(_force_shortname, 20, "white", _x, _rows[i] ));
        }
        _e.Add(new dbFFSvgShapeTEXT(_force_shortname, _description, _x, 180, 12));
	}

    // one is quite bigger than the rest
    public dbFFSVGElementCIRCLEGROUP(List<object> _e, string _force_shortname, int _x, int[] _rows, string _description, int _countBigOnes)
    {
        for (int i = 0; i < _rows.Count(); i++)
        {
            _e.Add(new dbFFSvgElementShapeCIRCLE(_force_shortname, 20, "white", _x, _rows[i]));
        }
        _e.Add(new dbFFSvgShapeTEXT(_force_shortname, _description, _x, 180, 12));
    }
}