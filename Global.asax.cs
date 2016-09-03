using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace WebSolutionChart
{
    public class Global : System.Web.HttpApplication
    {

        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
        }
        void Application_BeginRequest(Object Sender, EventArgs e)
        {

            if (Request.Path.IndexOf(".asmx") != -1)
            {

                HandleAjax(HttpContext.Current);

                return;
            };

        }

        private static void HandleAjax(HttpContext context)
        {

            int dotasmx = context.Request.Path.IndexOf(".asmx");
            string path = context.Request.Path.Substring(0, dotasmx + 5);

            string pathInfo = context.Request.Path.Substring(dotasmx + 5);

            context.RewritePath(path, pathInfo, context.Request.Url.Query);

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

    }
}
