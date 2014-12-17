using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for FFVerdict
/// </summary>

[JsonObject(MemberSerialization = MemberSerialization.OptIn)]
public class FFVerdict
{
    [JsonProperty(PropertyName = "force")]
    public string Force { get; set; }

    [JsonProperty(PropertyName = "verdict")]
    public string Verdict { get; set; }

}