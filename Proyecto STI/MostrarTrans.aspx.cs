using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Web.Services.Description;

namespace Proyecto_STI
{
    public partial class buscartransacciones : System.Web.UI.Page
    {
        SqlDataAdapter da = null;
        DataSet ds = null;
        SqlConnection cn = new SqlConnection(@"Data Source=PTYVGPDB\GP2015PROD,1433;Initial Catalog=STI;User Id=sa;Password=posgp&08");
         
        protected void Page_Load(object sender, EventArgs e)
        {
             
        }

          protected void btnMostrar(object Source, EventArgs e)
        {
            string Finicio = (this.finicio.Value);
            string Ffinal = (this.ffinal.Value);

            da = new SqlDataAdapter(@"Select [ID_TRANSACCION] as ID,[ORIGEN],[CUENTA_ORIGEN] 
                    ,[CATEGORIA_ORIGEN] 
                    ,[PAIS_DESTINO]  ,[DESTINO]    ,[CUENTA_DESTINO]
                    ,[CATEGORIA_DESTINO],[MONTO],[FECHA_TRANSACCION] ,[USUARIO],[DESCRIPCION]
                    FROM [STI].[dbo].[vw_Transacciones] WHERE FECHA_TRANSACCION BETWEEN '" + Finicio + "' AND '" + Ffinal + "'ORDER BY FECHA_TRANSACCION ", cn);
            ds = new DataSet();
                da.Fill(ds, "vw_Transacciones");
                GridViewMostrar.DataSource = ds.Tables["vw_Transacciones"];
                GridViewMostrar.DataBind();
                cn.Close(); 
      
        }

        protected void Download(object Source, EventArgs e)
        {
            string Finicio = (this.finicio.Value);
            string Ffinal = (this.ffinal.Value);

            Response.Redirect("http://ptyvgpdb/ReportServer_GP2015PROD/Pages/ReportViewer.aspx?%2fSTI%2fTransacciones_intercompany&rs:Command=Render&Finicio=" + Finicio+" &Ffinal="+Ffinal+"&rs:Format=CSV");
                                                                                                                                                         //&Finicio =% 2708 / 01 / 2019 % 27 % 20 & Ffinal =% 2708 / 15 / 2019 % 27 & rs:Format = CSV

        }

    }
}