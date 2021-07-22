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
    public partial class SeearchCG : System.Web.UI.Page
    {
        SqlDataAdapter da = null;
        DataSet ds = null;
        SqlConnection cn = new SqlConnection(@"Data Source=PTYVGPDB\GP2015PROD,1433;Initial Catalog=STI;User Id=sa;Password=posgp&08");

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnMostrar(object Source, EventArgs e)
        {
            string Finicio = (this.finicio.Value);
            string Ffinal = (this.ffinal.Value);

            da = new SqlDataAdapter(@"Select [Nfactura] as 'Numero de factura'
              ,[FechaProcesada] as 'Fecha de inclusión'
              ,[Observacion]
              ,[Monto] ,[Id_usuario] as Usuario
              ,[FechaIngreso] as 'Fecha de Registro' 
              FROM [STI].[dbo].[CG_ADICIONAL] WHERE FechaIngreso BETWEEN '" + Finicio + "' AND '" + Ffinal + "'ORDER BY FechaIngreso ", cn);
            ds = new DataSet();
            da.Fill(ds, "vw_Transacciones");
            GridViewMostrar.DataSource = ds.Tables["vw_Transacciones"];
            GridViewMostrar.DataBind();
            cn.Close();

        }
    }
}