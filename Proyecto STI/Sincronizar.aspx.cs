using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_STI
{
    public partial class Sincronizar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btSincronizar_Click(object sender, EventArgs e)
        {
            
            ClsBusiness.SincronizarCuentas();
            lblEspere.Text = "Listo!!";

        }
    }
}