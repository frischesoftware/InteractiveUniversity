<%@ Application Language="C#" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="System.Linq" %>
<%@ Import Namespace="System.Web" %>
<%@ Import Namespace="System.Web.Http" %>
<%@ Import Namespace="System.Web.Http.WebHost" %>
<%@ Import Namespace="System.Web.Routing" %>
<%@ Import Namespace="System.Web.Security" %>
<%@ Import Namespace="System.Web.SessionState" %>
<%@ Import Namespace="System.Net" %>




<script RunAt="server">
    #region Classes To Provide Session Support For WebApi


    public class MyHttpControllerHandler : System.Web.Http.WebHost.HttpControllerHandler, IRequiresSessionState
    {
        public MyHttpControllerHandler(System.Web.Routing.RouteData routeData)
            : base(routeData)
        { }
    }

    public class MyHttpControllerRouteHandler : System.Web.Http.WebHost.HttpControllerRouteHandler
    {
        protected override IHttpHandler GetHttpHandler(System.Web.Routing.RequestContext requestContext)
        {
            return new MyHttpControllerHandler(requestContext.RouteData);
        }
    }
    #endregion Classes To Provide Session Support For WebApi

    void Application_Start(object sender, EventArgs e)
    {
           //System.Web.Routing.RouteTable.Routes.MapHttpRoute(
           //     name: "DefaultApi",
           //     routeTemplate: "api/{controller}/{id}",
           //     defaults: new { id = System.Web.Http.RouteParameter.Optional }
           // ).RouteHandler = new MyHttpControllerRouteHandler();

    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
