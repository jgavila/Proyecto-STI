using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_STI
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btAceptar_Click(object sender, EventArgs e)
        {


            int resultado = ClsBusiness.ValidarUsuario(TxtMemberID.Text, TxtPws.Text);




            if (resultado != 0)
            {

                Session["usuario"] = resultado;
                Session["usuario_name"] = TxtMemberID.Text;

                Response.Redirect("Principal.aspx");

            }
            else
            {

                lblMsg.Text = "Usuario o Contraseña Invalida";

            }


        }
    }
}