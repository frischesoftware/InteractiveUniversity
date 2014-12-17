using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public partial class dbFFInfo
{
    public string force { get; set; }
    public string shape { get; set; } // "info" (kein SVG)
    public string force_shortname { get; set; }
    public string force_fullname { get; set; }
    public string factor_shortname { get; set; }
    public string factor_fullname { get; set; }
    public string factor_auspraegung { get; set; }
    public string description { get; set; }

    public dbFFInfo(string _force, string _description)
    {
        force = _force;
        shape = "info";
        description = _description;
    }
}
