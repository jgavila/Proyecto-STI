using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_STI
{
    public partial class Principal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                try
                {

                    GridView1.DataSource = ClsBusiness.GetListaTransacciones(DateTime.Now, DateTime.Now);
                    GridView1.DataBind();
                    lblTransacciones.Text = (GridView1.Rows.Count).ToString();
                }
                catch (Exception ex)
                {
                    Response.Redirect("Login.aspx");
                    return;
                }
            }
        }

        
    }
}
