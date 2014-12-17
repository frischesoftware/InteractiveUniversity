using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Web;
using System.Web.Http;
using System.Web.Script.Serialization;

/// <summary>
/// Summary description for FiveForcesController
/// </summary>
public class AuftragController : ApiController
{
    // GET api/<controller>
    //public System.Net.Http.HttpResponseMessage GetAuftrag()
    //{
    //    var response = this.Request.CreateResponse(HttpStatusCode.OK);
    //    response.Content = new StringContent("response!", Encoding.UTF8, "application/json");
    //    return response;

    //}
}

     
public class FiveForcesController : ApiController
{
    //public System.Net.Http.HttpResponseMessage GetFiveForces()
    //{
  

    //    //JavaScriptSerializer serializer = new JavaScriptSerializer();
    //    //?
    //   // string _kunden = serializer.Serialize(db2.Kunden.AsEnumerable());
    //    var response = this.Request.CreateResponse(HttpStatusCode.OK);
    //    response.Content = new StringContent("response!", Encoding.UTF8, "application/json");
    //    return response;
        
    //}

	public FiveForcesController()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public void PostFiveForces(string s)
    {
        var x = s;
    }
    public void Post(string s)
    {
        var x = s;
    }
}