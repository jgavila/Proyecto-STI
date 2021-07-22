using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_STI
{
    public partial class CGAdicionales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Guardar_Click(object sender, EventArgs e)
        {

            //int usuario = int.Parse(Session["usuario"].ToString());
           string usuario = Environment.UserName;

            DateTime fechaingreso = DateTime.Today;

            Good.Visible = false;
            Wrong.Visible = false;


            try
            {
                
                DateTime fprocesada = DateTime.ParseExact(fechaprocesada.Value, "MM/dd/yyyy", null);
                   
                ClsBusiness.GuardarCGAdicionales(txtnfactura.Text, fechaingreso, fprocesada, txtobserv.Text, decimal.Parse(txtMonto.Text),0, usuario);
                    Good.Visible = true; 



            }
            catch
            {
                Wrong.Visible = true;
            }


        }
    }
}