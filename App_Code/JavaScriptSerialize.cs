using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

/// <summary>
/// Summary description for JavaScriptSerialize
/// </summary>
public static class JavaScriptSerialize
{
    public static string Serialize(object o)
    {
        JavaScriptSerializer js = new JavaScriptSerializer();
        return js.Serialize(o);
    }

   
}