using System;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
 

namespace Proyecto_STI
{
    public partial class Tranferencia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Page.Title = "Home page for " + User.Identity.Name;
            Div1.Visible = false;
        }

        protected void Condirmado_Click(object sender, EventArgs e)
        {

            int usuario = int.Parse(Session["usuario"].ToString());

            DateTime FechaTranferencia1 = DateTime.ParseExact(ftransferencia.Value, "MM/dd/yyyy", null);

            DateTime FechaUsrTran = DateTime.Today;

            Good.Visible = false;
            Wrong.Visible = false;
            Div1.Visible = false;
             
            try
            {

                if (ftransferencia.Value != "")
                {
                    //FechaUsrTran = DateTime.Parse(FechaTranferencia.Value);

                    ClsBusiness.GuardarTransferencia(int.Parse(CboCuentaOrigen.SelectedValue), int.Parse(CboCuentaDestino.SelectedValue), decimal.Parse(txtMonto.Text), FechaTranferencia1, usuario, txtDescripcion.Text, FechaUsrTran);
                    Good.Visible = true;
                }
                txtMonto.Text = String.Empty;
                txtDescripcion.Text = String.Empty;
                ftransferencia.Value = String.Empty;
                //CboCuentaOrigen.SelectedValue = String.Empty;
                //CboCuentaDestino.SelectedValue = String.Empty;

            }
            catch
            {
                Wrong.Visible = true;
            }


        }

        protected void BtnUpload_Click(object sender, EventArgs e)
        {
            Div1.Visible = false;
            String COMP_ORIGEN;
            String CATEGORIA_ORIGEN;
            String CUENTA_ORIGEN;

            String COMP_DESTINO;
            String CATEGORIA_DESTINO;
            String CUENTA_DESTINO;

            String DESCRIPCION;
            decimal MONTO;
            DateTime FECHA_TRANSACCION;
            String MODO;
            String RECURRENCIA;
            DateTime FECHA_INICIO;
            DateTime FECHA_FINAL;
            //try
            //{
                string path = Path.GetFileName(FileUpload1.FileName);
            //if (File.Exists(path))
            //{
                path = path.Replace(" ", "");
                    FileUpload1.SaveAs(Server.MapPath("~/ExcelFile/") + path);
                    String ExcelPath = Server.MapPath("~/ExcelFile/") + path;
                    OleDbConnection mycon = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source = " + ExcelPath + " ; Extended Properties=Excel 8.0; Persist Security Info = False");
                    mycon.Open();
                    OleDbCommand cmd = new OleDbCommand("select * from [Hoja1$]", mycon);
                    OleDbDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        COMP_ORIGEN = dr[0].ToString(); 
                        CATEGORIA_ORIGEN = dr[1].ToString();
                        CUENTA_ORIGEN = dr[2].ToString();
                        COMP_DESTINO = dr[3].ToString();
                        CATEGORIA_DESTINO = dr[4].ToString();
                        CUENTA_DESTINO = dr[5].ToString();
                        DESCRIPCION = dr[6].ToString();
                        MONTO = Convert.ToDecimal(dr[7].ToString()); 
                        FECHA_TRANSACCION = DateTime.Parse(dr[8].ToString());
                if (FECHA_TRANSACCION == DateTime.MinValue)
                {
                    //unassigned
                }

                MODO = dr[9].ToString();
                        RECURRENCIA = dr[10].ToString();
                        FECHA_INICIO = Convert.ToDateTime(dr[11].ToString());
                        FECHA_FINAL = Convert.ToDateTime(dr[12].ToString());
                        if (COMP_ORIGEN == "TECNASA Panamá")
                        {
                            COMP_ORIGEN = "1";
                        }
                        else if (COMP_ORIGEN == "TECNASA El Salvador")
                        {
                            COMP_ORIGEN = "2";
                        }
                        else if (COMP_ORIGEN == "TECNASA Nicaragua")
                        {
                            COMP_ORIGEN = "3";
                        }
                        else if (COMP_ORIGEN == "TECNASA Guatemala")
                        {
                            COMP_ORIGEN = "4";
                        }
                        else if (COMP_ORIGEN == "TECNASA Honduras")
                        {
                            COMP_ORIGEN = "5";
                        }
                        else if (COMP_ORIGEN == "TECNASA Ecuador")
                        {
                            COMP_ORIGEN = "6";
                        }
                        else if (COMP_ORIGEN == "TECNASA Costa Rica")
                        {
                            COMP_ORIGEN = "7";
                        }
                        else if (COMP_ORIGEN == "APPLICA Panamá")
                        {
                            COMP_ORIGEN = "8";
                        }
                        else if (COMP_ORIGEN == "New Horizons Nicaragua")
                        {
                            COMP_ORIGEN = "9";
                        }


                        if (COMP_DESTINO == "TECNASA Panamá")
                        {
                            COMP_DESTINO = "1";
                        }
                        else if (COMP_DESTINO == "TECNASA El Salvador")
                        {
                            COMP_DESTINO = "2";
                        }
                        else if (COMP_DESTINO == "TECNASA Nicaragua")
                        {
                            COMP_DESTINO = "3";
                        }
                        else if (COMP_DESTINO == "TECNASA Guatemala")
                        {
                            COMP_DESTINO = "4";
                        }
                        else if (COMP_DESTINO == "TECNASA Honduras")
                        {
                            COMP_DESTINO = "5";
                        }
                        else if (COMP_DESTINO == "TECNASA Ecuador")
                        {
                            COMP_DESTINO = "6";
                        }
                        else if (COMP_DESTINO == "TECNASA Costa Rica")
                        {
                            COMP_DESTINO = "7";
                        }
                        else if (COMP_DESTINO == "APPLICA Panamá")
                        {
                            COMP_DESTINO = "8";
                        }
                        else if (COMP_DESTINO == "New Horizons Nicaragua")
                        {
                            COMP_DESTINO = "9";
                        }


                        if (CATEGORIA_ORIGEN == "Activos")
                        {
                            CATEGORIA_ORIGEN = "1";
                        }
                        else if (CATEGORIA_ORIGEN == "Pasivos")
                        {
                            CATEGORIA_ORIGEN = "2";
                        }
                        else if (CATEGORIA_ORIGEN == "Capital")
                        {
                            CATEGORIA_ORIGEN = "3";
                        }
                        else if (CATEGORIA_ORIGEN == "Ingresos")
                        {
                            CATEGORIA_ORIGEN = "4";
                        }
                        else if (CATEGORIA_ORIGEN == "Costos")
                        {
                            CATEGORIA_ORIGEN = "5";
                        }
                        else if (CATEGORIA_ORIGEN == "Gastos Departamentos")
                        {
                            CATEGORIA_ORIGEN = "6";
                        }
                        else if (CATEGORIA_ORIGEN == "Gastos Generales")
                        {
                            CATEGORIA_ORIGEN = "7";
                        }

                        if (CATEGORIA_DESTINO == "Activos")
                        {
                            CATEGORIA_DESTINO = "1";
                        }
                        else if (CATEGORIA_DESTINO == "Pasivos")
                        {
                            CATEGORIA_DESTINO = "2";
                        }
                        else if (CATEGORIA_DESTINO == "Capital")
                        {
                            CATEGORIA_DESTINO = "3";
                        }
                        else if (CATEGORIA_DESTINO == "Ingresos")
                        {
                            CATEGORIA_DESTINO = "4";
                        }
                        else if (CATEGORIA_DESTINO == "Costos")
                        {
                            CATEGORIA_DESTINO = "5";
                        }
                        else if (CATEGORIA_DESTINO == "Gastos Departamentos")
                        {
                            CATEGORIA_DESTINO = "6";
                        }
                        else if (CATEGORIA_DESTINO == "Gastos Generales")
                        {
                            CATEGORIA_DESTINO = "7";
                        }




                        Savedata(COMP_ORIGEN, CATEGORIA_ORIGEN, CUENTA_ORIGEN, COMP_DESTINO, CATEGORIA_DESTINO, CUENTA_DESTINO, DESCRIPCION, MONTO, FECHA_TRANSACCION, MODO, RECURRENCIA, FECHA_INICIO, FECHA_FINAL);
                    }
                    mycon.Close();
                Wrong.Visible = false;
                //}
            //}
            //    catch
            //{

            //    Wrong.Visible = true;
            //} 

        }

        private void Savedata(String COMP_ORIGEN1, String CATEGORIA_ORIGEN1, String CUENTA_ORIGEN1, String COMP_DESTINO1, String CATEGORIA_DESTINO1, String CUENTA_DESTINO1, String DESCRIPCION1, decimal MONTO1, DateTime FECHA_TRANSACCION1, String MODO1, String RECURRENCIA1, DateTime FECHA_INICIO1, DateTime FECHA_FINAL1)

        {
            DateTime FECHA_USR_TRANSFERENCIA = DateTime.Today;

            int usuario = int.Parse(Session["usuario"].ToString());

            String query = @"INSERT INTO UPLOADTRANSACCIONES (COMP_ORIGEN,CATEGORIA_ORIGEN,CUENTA_ORIGEN,COMP_DESTINO,CATEGORIA_DESTINO,CUENTA_DESTINO,DESCRIPCION,MONTO,FECHA_TRANSACCION,MODO,ID_USUARIO,RECURRENCIA,FECHA_INICIO,FECHA_FINAL,FECHA_USR_TRANSFERENCIA) " +
             "VALUES('" + COMP_ORIGEN1 + "','" + CATEGORIA_ORIGEN1 + "','" + CUENTA_ORIGEN1 + "','" + COMP_DESTINO1 + "','" + CATEGORIA_DESTINO1 + "','" + CUENTA_DESTINO1 + "','" + DESCRIPCION1 + "','" + MONTO1 + "','" + FECHA_TRANSACCION1.ToString("yyyy-MM-dd") + "','" + MODO1 + "'," + usuario + ",'" + RECURRENCIA1 + "','" + FECHA_INICIO1.ToString("yyyy-MM-dd") + "','" + FECHA_FINAL1.ToString("yyyy-MM-dd") + "','" + FECHA_USR_TRANSFERENCIA.ToString("yyyy-MM-dd") + "')";

            String mycon = @"Data Source=PTYVGPDB\GP2015PROD,1433;Initial Catalog=STI;User Id=sa;Password=posgp&08;";
            SqlConnection con = new SqlConnection(mycon);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            con.Close();
            Div1.Visible = true;
        }

        protected void Btndownload_Click(object sender, EventArgs e)
        {
            FileInfo file = new FileInfo("C:\\Template_SIC.xlsx");
            if (file.Exists)
            {
                Response.Clear();
                Response.ClearHeaders();
                Response.ClearContent();
                Response.AddHeader("content-disposition", "attachment; filename=Template_SIC.xlsx");
                Response.AddHeader("Content-Type", "application/Excel");
                Response.ContentType = "application/vnd.xls";
                Response.AddHeader("Content-Length", file.Length.ToString());
                Response.WriteFile(file.FullName);
                Response.End();
            }
            else
            {
                Response.Write("El archivo no se ha encontrado");
            }  
             

        }

        protected void Updatedata_Click(object sender, EventArgs e)
        {
            ClsBusiness.SincronizarCarga();
            lblEspere.Text = "Listo!!";

        }
    }
}
