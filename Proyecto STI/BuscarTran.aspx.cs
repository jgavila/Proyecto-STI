using System;
using System.Data;
using System.Data.SqlClient;
 

namespace Proyecto_STI
{
    public partial class BuscarTran : System.Web.UI.Page
    {
        SqlDataAdapter da = null;
        DataSet ds = null;
        SqlConnection cn = new SqlConnection(@"Data Source=PTYVGPDB\GP2015PROD,1433;Initial Catalog=STI;User Id=sa;Password=posgp&08");

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Btnbuscar(object Source, EventArgs e)
        {
            string Ncuenta = (this.txt1.Value);
            string Descripcion = (this.txt2.Value);

            da = new SqlDataAdapter(@"Select [ID_TRANSACCION] as ID,[ORIGEN],[CUENTA_ORIGEN] 
                    ,[CATEGORIA_ORIGEN] 
                    ,[PAIS_DESTINO]  ,[DESTINO]    ,[CUENTA_DESTINO]
                    ,[CATEGORIA_DESTINO],[MONTO],[FECHA_TRANSACCION] ,[USUARIO],[DESCRIPCION]
                   FROM [STI].[dbo].[vw_Transacciones] WHERE  (DESCRIPCION LIKE '%" + Descripcion + "%' OR DESCRIPCION IS NULL) OR CUENTA_DESTINO ='" + Ncuenta + "' OR CUENTA_DESTINO IS NULL ORDER BY FECHA_TRANSACCION ", cn);



            ds = new DataSet();
            da.Fill(ds, "vw_Transacciones");
            GridViewMostrar.DataSource = ds.Tables["vw_Transacciones"];
            GridViewMostrar.DataBind();
            cn.Close();

        }
    }
}