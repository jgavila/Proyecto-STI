using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_STI
{
    public partial class trecurrente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //FechaTranferencia.Value = DateTime.Now.ToString("MM/dd/yyyy");
            Page.Title = "Home page for " + User.Identity.Name;

        }
        protected void Guardar_Click(object sender, EventArgs e)
        {

            int usuario = int.Parse(Session["usuario"].ToString());
            
            Good.Visible = false;
            Wrong.Visible = false;

            try
            {
                DateTime FechaI = DateTime.ParseExact(finicio.Value, "MM/dd/yyyy", null);
                DateTime FechaF = DateTime.ParseExact(ffinal.Value, "MM/dd/yyyy", null);
                
                if (ffinal.Value != "" )
                {
                    ClsBusiness.GuardarTRecurrencia(int.Parse(CboCuentaOrigen.SelectedValue), int.Parse(CboCuentaDestino.SelectedValue), decimal.Parse(txtMonto.Text), Cborecurrencia.SelectedValue, FechaI, FechaF, txtDescripcion.Text, usuario);
                    Good.Visible = true;
                }

               
            }
            catch
            {
                Wrong.Visible = true;
            }


        }



    }
}