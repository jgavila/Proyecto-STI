using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_STI
{
    public partial class ModificacionCRecurrente : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            div1.Visible = false;
        }
        protected void Loaddata()
        {
            txt1.Text = "";
            string ID_CUENTA_DESDE = txt0.Text;
             
            List<ClsRecurrente> listPO = ClsBusiness.GetListR(ID_CUENTA_DESDE);
            GridViewMostrar.DataSource = listPO;
            GridViewMostrar.DataBind();
        }
        protected void Btnbuscar(object Source, EventArgs e)
        {
            Loaddata();

            if (GridViewMostrar.Rows.Count > 0)
            {
               
                div1.Visible = true;
                 
            }
             
        }

        protected void Btnupdate(object sender, EventArgs e)
        {
            //btn1.Visible = true;
            div1.Visible = true;
             
            foreach (GridViewRow row in GridViewMostrar.Rows)
            {
                CheckBox chkSelect = row.FindControl("chkSelect") as CheckBox;

                if (chkSelect.Checked == true)
                {
                    ClsBusiness.UpdateTR(txt1.Text, int.Parse(row.Cells[12].Text));
               
                }
            }

            Loaddata();

        }

    }
}