using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

using System.Data.SqlClient;
using System.Data.Common;
using System.Collections.Generic;
 

namespace Proyecto_STI
{



    public class ClsData
    {
        private SqlConnection Con; // Obj Conexion
        
        public ClsData()
        {
            string DtsConection = @"Data Source=PTYVGPDB\GP2015PROD,1433;Initial Catalog=STI;User Id=sa;Password=posgp&08;";

            Con = new SqlConnection(DtsConection);
        }
        
        public void Abrir() // Metodo para Abrir la Conexion
        {
            Con.Open();
        }

        public void Cerrar() // Metodo para Cerrar la Conexion
        {
            Con.Close();
        }
        public DataSet Ejecutar(string Comando, string Tabla) // Metodo para Ejecutar Comandos
        {

            SqlDataAdapter CMD = new SqlDataAdapter(Comando, Con); // Creamos un DataAdapter con el Comando y la Conexion

            DataSet DS = new DataSet(); // Creamos el DataSet que Devolvera el Metodo

            CMD.Fill(DS, Tabla); // Ejecutamos el Comando en la Tabla

            return DS; // Regresamos el DataSet
        }
        
        public int ValidarUsuario(string Usuario, string pws)
        {

            int resultadoID = 0;
            string resultadoMSG = string.Empty;

            SqlCommand cmd = new SqlCommand(
                "uspLogin", Con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@pLoginName", Usuario));
            cmd.Parameters.Add(new SqlParameter("@pPassword", pws));

            SqlParameter outparamID = cmd.Parameters.Add(new SqlParameter("@ID", resultadoID));
            outparamID.Direction = ParameterDirection.Output;

            SqlParameter outparamMSG = cmd.Parameters.Add(new SqlParameter("@responseMessage", resultadoMSG));
            outparamMSG.Direction = ParameterDirection.Output;




            // execute the command
            try
            {
                cmd.ExecuteNonQuery();
                resultadoID = int.Parse(outparamID.Value.ToString());
            }
            catch
            {


            }


            return resultadoID;


        }
        
        public bool SincronizarCuentas()
        {

            bool resultado = false;

            SqlCommand cmd = new SqlCommand("Actualizar_Cuentas", Con);

            cmd.CommandType = CommandType.StoredProcedure;

            try
            {
                cmd.ExecuteNonQuery();

                resultado = true;
            }
            catch
            {
                resultado = false;

            }

            return resultado;
            
        }
        public bool SincronizarCarga()
        {

            bool resultado = false;

            SqlCommand cmd = new SqlCommand("SP_cargar_transferencia", Con);

            cmd.CommandType = CommandType.StoredProcedure;

            try
            {
                cmd.ExecuteNonQuery();

                resultado = true;
            }
            catch
            {
                resultado = false;

            }

            return resultado;

        }

        public List<ClsCompany> GetListaCompanies()
        {

            string strQuery = string.Empty;


            strQuery = "Select COD_COMPANIA, NOMBRE, PAIS, COD_CUENTA FROM COMPANIAS ORDER BY NOMBRE";


            SqlCommand commando = new SqlCommand(strQuery, Con);

            SqlDataReader reader = commando.ExecuteReader();

            List<ClsCompany> ListaItems = new List<ClsCompany>();

            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    ClsCompany Item = new ClsCompany();

                    if (reader[0] != DBNull.Value) { Item.Idcompany = reader.GetInt32(0); }
                    if (reader[1] != DBNull.Value) { Item.Company = reader.GetString(1); }
                    if (reader[2] != DBNull.Value) { Item.Pais = reader.GetString(2); }
                    if (reader[3] != DBNull.Value) { Item.Codcuenta = reader.GetString(3); }

                    ListaItems.Add(Item);
                }



            }

            reader.Close();

            return ListaItems;




        }
        public List<ClsCategorias> GetListaCategorias()
        {

            string strQuery = string.Empty;


            strQuery = "Select COD_CATEGORIA, DESCRIPCION FROM CATEGORIAS ORDER BY DESCRIPCION";


            SqlCommand commando = new SqlCommand(strQuery, Con);

            SqlDataReader reader = commando.ExecuteReader();

            List<ClsCategorias> ListaItems = new List<ClsCategorias>();

            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    ClsCategorias Item = new ClsCategorias();

                    if (reader[0] != DBNull.Value) { Item.IdCategoria = reader.GetInt32(0); }
                    if (reader[1] != DBNull.Value) { Item.Categoria = reader.GetString(1); }

                    ListaItems.Add(Item);
                }



            }

            reader.Close();

            return ListaItems;




        }
        
        public List<ClsCuentas> GetListaCuentas(int Category, int Company)
        {

            string strQuery = string.Empty;


            strQuery = @"Select ID_CUENTA, NUMERO, DESCRIPCION, COD_COMPANIA, COD_CATEGORIA 
                        FROM CUENTAS 
                        WHERE COD_COMPANIA = " + Company.ToString() + " " +
                        "AND COD_CATEGORIA = " + Category.ToString() + " " +
                        "ORDER BY NUMERO";


            SqlCommand commando = new SqlCommand(strQuery, Con);

            SqlDataReader reader = commando.ExecuteReader();

            List<ClsCuentas> ListaItems = new List<ClsCuentas>();

            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    ClsCuentas Item = new ClsCuentas();

                    if (reader[0] != DBNull.Value) { Item.IdCuenta = reader.GetInt32(0); }
                    if (reader[1] != DBNull.Value) { Item.Cuenta = reader.GetString(1); }
                    if (reader[2] != DBNull.Value) { Item.Descripcion = reader.GetString(2); }
                    if (reader[3] != DBNull.Value) { Item.Company = reader.GetInt32(3); }
                    if (reader[4] != DBNull.Value) { Item.Categoria = reader.GetInt32(4); }

                    ListaItems.Add(Item);
                }



            }

            reader.Close();

            return ListaItems;


        }
        
        public List<ClsTransacciones> GetListaTransacciones(DateTime FechaDesde, DateTime FechaHasta)
        {

            string strQuery = string.Empty;

                       
            strQuery = "Select ID_TRANSACCION, TIPO, ID_CUENTA_DESDE, ID_CUENTA_HASTA, MONTO, FECHA_TRANSACCION, ID_USUARIO, MODO, TRANSACCIONES.DESCRIPCION, APROBADA, FECHA_APROBADA, USUARIO_APROBADOR, C1.NOMBRE AS ORIGENC, C2.NOMBRE AS DESTINOC, O.NUMERO + '-' + O.DESCRIPCION AS CUENTAO,  D.NUMERO + '-' + D.DESCRIPCION AS CUENTAD FROM TRANSACCIONES LEFT JOIN CUENTAS O ON TRANSACCIONES.ID_CUENTA_DESDE = O.ID_CUENTA LEFT JOIN CUENTAS D ON TRANSACCIONES.ID_CUENTA_HASTA = D.ID_CUENTA LEFT JOIN COMPANIAS C1 ON O.COD_COMPANIA = C1.COD_COMPANIA LEFT JOIN COMPANIAS C2 ON D.COD_COMPANIA = C2.COD_COMPANIA  ";
            strQuery = strQuery + " WHERE FECHA_USR_TRANSFERENCIA >= '" + FechaDesde.ToString("yyyy-MM-dd") + " 00:00' AND FECHA_USR_TRANSFERENCIA <= '" + FechaHasta.ToString("yyyy-MM-dd") + " 23:59' ORDER BY ID_TRANSACCION ";


            SqlCommand commando = new SqlCommand(strQuery, Con);

            SqlDataReader reader = commando.ExecuteReader();

            List<ClsTransacciones> ListaItems = new List<ClsTransacciones>();

            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    ClsTransacciones Item = new ClsTransacciones();

                    if (reader[0] != DBNull.Value) { Item.IdTransaccion = reader.GetInt32(0); }
                    if (reader[1] != DBNull.Value) { Item.Tipo = reader.GetByte(1); }
                    if (reader[2] != DBNull.Value) { Item.CuentaOrigen = reader.GetInt32(2); }
                    if (reader[3] != DBNull.Value) { Item.CuentaDestino = reader.GetInt32(3); }
                    if (reader[4] != DBNull.Value) { Item.Monto = reader.GetDecimal(4); }
                    if (reader[5] != DBNull.Value) { Item.FechaTransaccion = reader.GetDateTime(5); }
                    if (reader[6] != DBNull.Value) { Item.Usuario = reader.GetInt32(6); }
                    if (reader[7] != DBNull.Value) { Item.Modo = reader.GetString(7); }
                    if (reader[8] != DBNull.Value) { Item.Descripcion = reader.GetString(8); }
                    if (reader[9] != DBNull.Value) { Item.Aprobada = reader.GetBoolean(9); }
                    if (reader[10] != DBNull.Value) { Item.FechaAprobada = reader.GetDateTime(10); }
                    if (reader[11] != DBNull.Value) { Item.Usuario_Aprobador = reader.GetInt32(11); }
                    if (reader[12] != DBNull.Value) { Item.CompanyOrigen = reader.GetString(12); }
                    if (reader[13] != DBNull.Value) { Item.CompanyDestino = reader.GetString(13); }
                    if (reader[14] != DBNull.Value) { Item.CuentaOriegenDes = reader.GetString(14); }
                    if (reader[15] != DBNull.Value) { Item.CuentaDestinoDes = reader.GetString(15); }

                    ListaItems.Add(Item);
                }



            }

            reader.Close();

            return ListaItems;


        }


        public List<ClsTransacciones> GetListaTransacciones(DateTime FechaDesde, DateTime FechaHasta, int Cuenta)
        {

            string strQuery = string.Empty;


            strQuery = "Select ID_TRANSACCION, TIPO, ID_CUENTA_DESDE, ID_CUENTA_HASTA, MONTO, FECHA_TRANSACCION, ID_USUARIO, MODO, TRANSACCIONES.DESCRIPCION, APROBADA, FECHA_APROBADA, USUARIO_APROBADOR, C1.NOMBRE AS ORIGENC, C2.NOMBRE AS DESTINOC, O.NUMERO + '-' + O.DESCRIPCION AS CUENTAO,  D.NUMERO + '-' + D.DESCRIPCION AS CUENTAD, FECHA_USR_TRANSFERENCIA FROM TRANSACCIONES LEFT JOIN CUENTAS O ON TRANSACCIONES.ID_CUENTA_DESDE = O.ID_CUENTA LEFT JOIN CUENTAS D ON TRANSACCIONES.ID_CUENTA_HASTA = D.ID_CUENTA LEFT JOIN COMPANIAS C1 ON O.COD_COMPANIA = C1.COD_COMPANIA LEFT JOIN COMPANIAS C2 ON D.COD_COMPANIA = C2.COD_COMPANIA  ";
            strQuery = strQuery + " WHERE FECHA_TRANSACCION >= '" + FechaDesde.ToString("yyyy-MM-dd") + " 00:00' AND FECHA_TRANSACCION <= '" + FechaHasta.ToString("yyyy-MM-dd") + " 23:59' AND (ID_CUENTA_DESDE = " + Cuenta.ToString() + " OR ID_CUENTA_HASTA =  " + Cuenta.ToString() + ")  ORDER BY FECHA_TRANSACCION ";


            SqlCommand commando = new SqlCommand(strQuery, Con);

            SqlDataReader reader = commando.ExecuteReader();

            List<ClsTransacciones> ListaItems = new List<ClsTransacciones>();

            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    ClsTransacciones Item = new ClsTransacciones();

                    if (reader[0] != DBNull.Value) { Item.IdTransaccion = reader.GetInt32(0); }
                    if (reader[1] != DBNull.Value) { Item.Tipo = reader.GetInt32(1); }
                    if (reader[2] != DBNull.Value) { Item.CuentaOrigen = reader.GetInt32(2); }
                    if (reader[3] != DBNull.Value) { Item.CuentaDestino = reader.GetInt32(3); }
                    if (reader[4] != DBNull.Value) { Item.Monto = reader.GetDecimal(4); }
                    if (reader[5] != DBNull.Value) { Item.FechaTransaccion = reader.GetDateTime(5); }
                    if (reader[6] != DBNull.Value) { Item.Usuario = reader.GetInt32(6); }
                    if (reader[7] != DBNull.Value) { Item.Modo = reader.GetString(7); }
                    if (reader[8] != DBNull.Value) { Item.Descripcion = reader.GetString(8); }
                    if (reader[9] != DBNull.Value) { Item.Aprobada = reader.GetBoolean(9); }
                    if (reader[10] != DBNull.Value) { Item.FechaAprobada = reader.GetDateTime(10); }
                    if (reader[11] != DBNull.Value) { Item.Usuario_Aprobador = reader.GetInt32(11); }
                    if (reader[12] != DBNull.Value) { Item.CompanyOrigen = reader.GetString(12); }
                    if (reader[13] != DBNull.Value) { Item.CompanyDestino = reader.GetString(13); }
                    if (reader[14] != DBNull.Value) { Item.CuentaOriegenDes = reader.GetString(14); }
                    if (reader[15] != DBNull.Value) { Item.CuentaDestinoDes = reader.GetString(15); }
                    if (reader[16] != DBNull.Value) { Item.FechaTransferencia = reader.GetDateTime(16); }


                    ListaItems.Add(Item);
                }



            }

            reader.Close();

            return ListaItems;


        }
        
        public int GuardarTransferencia(int CuentaOrg, int CuentaDes, decimal Monto,DateTime Fecha_Transacccion, int Usuario, string Descripcion, DateTime FechaUsrTran)
        {
            int resultado = 0;
            string xQuery = string.Empty;
            xQuery = "INSERT INTO TRANSACCIONES(ID_CUENTA_DESDE,ID_CUENTA_HASTA,MONTO,FECHA_TRANSACCION,ID_USUARIO,DESCRIPCION,FECHA_USR_TRANSFERENCIA)";
            xQuery = xQuery + " VALUES(@ORIGEN,@DESTINO,@MONTO,@FECHA_TRANSACCION, @USUARIO,@DESCRIPCION,@FECHA_USRTRAN);SELECT CAST(scope_identity() AS int)";

            try
            {
                SqlCommand cmd = new SqlCommand(xQuery, Con);
                


                cmd.Parameters.AddWithValue("@ORIGEN", CuentaOrg);
                cmd.Parameters.AddWithValue("@DESTINO", CuentaDes);
                cmd.Parameters.AddWithValue("@MONTO", Monto);
                cmd.Parameters.AddWithValue("@FECHA_TRANSACCION", Fecha_Transacccion);
                cmd.Parameters.AddWithValue("@USUARIO", Usuario);
                cmd.Parameters.AddWithValue("@DESCRIPCION", Descripcion);
                cmd.Parameters.AddWithValue("@FECHA_USRTRAN", FechaUsrTran);

                resultado = (int)cmd.ExecuteScalar();



            }
            catch
            {
                resultado = 0;

            }

            return resultado;


        }

        public List<ClsMostrar> GetMostarTransacciones(DateTime FechaDesde, DateTime FechaHasta)
        {

            string strQuery = string.Empty;


            strQuery = @"Select [ID_TRANSACCION],[ORIGEN] ,[CUENTA_ORIGEN],[CATEGORIA_ORIGEN],[PAIS_DESTINO] ,[DESTINO] ,[CUENTA_DESTINO]
                    ,[CATEGORIA_DESTINO] ,[MONTO] ,[FECHA_TRANSACCION] ,[USUARIO],[DESCRIPCION] 
                    WHERE FECHA_TRANSACCION >= '" + FechaDesde.ToString("yyyy-MM-dd") + " 00:00' AND FECHA_TRANSACCION <= '" 
                    + FechaHasta.ToString("yyyy-MM-dd") + " 23:59' ORDER BY FECHA_TRANSACCION ";


            SqlCommand commando = new SqlCommand(strQuery, Con);

            SqlDataReader reader = commando.ExecuteReader();

            List<ClsMostrar> ListaItems = new List<ClsMostrar>();

            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    ClsMostrar Item = new ClsMostrar();

                    if (reader[0] != DBNull.Value) { Item.IdTransaccion = reader.GetInt32(0); }
                    if (reader[1] != DBNull.Value) { Item.CUENTA_ORIGEN = reader.GetInt32(1); }
                    if (reader[2] != DBNull.Value) { Item.CATEGORIA_ORIGEN = reader.GetString(2); }
                    if (reader[3] != DBNull.Value) { Item.MONTO = reader.GetDecimal(3); }
                    if (reader[4] != DBNull.Value) { Item.FECHA_TRANSACCION = reader.GetDateTime(4); }
                    if (reader[5] != DBNull.Value) { Item.DESCRIPCION = reader.GetString(6); }
                    if (reader[6] != DBNull.Value) { Item.ORIGEN = reader.GetString(7); }
                    if (reader[7] != DBNull.Value) { Item.DESTINO = reader.GetString(8); }
                    if (reader[8] != DBNull.Value) { Item.CUENTA_DESTINO = reader.GetInt32(9); }
                    if (reader[9] != DBNull.Value) { Item.CATEGORIA_DESTINO = reader.GetString(10); }

                    //if (reader[1] != DBNull.Value) { Item.Tipo = reader.GetByte(1); }

                    //if (reader[6] != DBNull.Value) { Item.Usuario = reader.GetInt32(6); }
                    //if (reader[7] != DBNull.Value) { Item.Modo = reader.GetString(7); }

                    //if (reader[9] != DBNull.Value) { Item.Aprobada = reader.GetBoolean(9); }
                    //if (reader[10] != DBNull.Value) { Item.FechaAprobada = reader.GetDateTime(10); }
                    //if (reader[11] != DBNull.Value) { Item.Usuario_Aprobador = reader.GetInt32(11); }

                    ListaItems.Add(Item);
                }



            }

            reader.Close();

            return ListaItems;


        }

        public int GuardarTRecurrencia(int CuentaOrg, int CuentaDes, decimal Monto, string Tipo, DateTime Finicio, DateTime Ffin, string Descripcion, int Usuario)
        {
            int resultado = 0;
            string xQuery = string.Empty;
            xQuery = "INSERT INTO RECURRENTES(ID_CUENTA_DESDE,ID_CUENTA_HASTA,MONTO,TIPO,FECHA_INICIO,FECHA_FIN,DESCRIPCION,ID_USUARIO)";
            xQuery = xQuery + "VALUES(@ORIGEN,@DESTINO,@MONTO,@TIPO,@FECHA_INICIO,@FECHA_FINAL,@DESCRIPCION,@USUARIO);SELECT CAST(scope_identity() AS int)";

            try
            {
                SqlCommand cmd = new SqlCommand(xQuery, Con);
                
                cmd.Parameters.AddWithValue("@ORIGEN", CuentaOrg);
                cmd.Parameters.AddWithValue("@DESTINO", CuentaDes);
                cmd.Parameters.AddWithValue("@MONTO", Monto);
                cmd.Parameters.AddWithValue("@TIPO", Tipo);
                cmd.Parameters.AddWithValue("@FECHA_INICIO", Finicio);
                cmd.Parameters.AddWithValue("@FECHA_FINAL", Ffin);
                cmd.Parameters.AddWithValue("@DESCRIPCION", Descripcion);
                cmd.Parameters.AddWithValue("@USUARIO", Usuario);
                
                //cmd.Parameters.AddWithValue("@FECHA_USRTRAN", FechaUsrTran);

                resultado = (int)cmd.ExecuteScalar();
                
            }
            catch
            {
                resultado = 0;

            }

            return resultado;


        }

        public int GuardarCGAdicional(string numfactura, DateTime fechaingreso, DateTime fechaprocesada, string Observacion, decimal Monto, int Procesado, string Idusuario)
        {
            int resultado = 0;
            string xQuery = string.Empty;
            xQuery = "INSERT INTO CG_ADICIONAL(Nfactura,FechaIngreso,FechaProcesada,Observacion,Monto,Procesado,Id_usuario)";
            xQuery = xQuery + " VALUES(@NUMFACTURA,@FECHAINGRESO,@FECHAPROCESADA,@OBSERVACION, @MONTON,@PROCESADO,@IDUSUARIO);SELECT CAST(scope_identity() AS int)";

            try
            {
                SqlCommand cmd = new SqlCommand(xQuery, Con);
                
                cmd.Parameters.AddWithValue("@NUMFACTURA", numfactura);
                cmd.Parameters.AddWithValue("@FECHAINGRESO", fechaingreso);
                cmd.Parameters.AddWithValue("@FECHAPROCESADA", fechaprocesada);
                cmd.Parameters.AddWithValue("@OBSERVACION", Observacion);
                cmd.Parameters.AddWithValue("@MONTON", Monto);
                cmd.Parameters.AddWithValue("@PROCESADO", Procesado);
                cmd.Parameters.AddWithValue("@IDUSUARIO", Idusuario);

                resultado = (int)cmd.ExecuteScalar();
                
            }
            catch
            {
                resultado = 0;

            }

            return resultado;


        }

        public List<ClsRecurrente> GetListR(string ID_CUENTA_DESDE)
        {
            List<ClsRecurrente> lst_PO = new List<ClsRecurrente>();
            string strQuery = String.Empty;
             
            //strQuery = @"Select [ID_CUENTA_DESDE] as ID,[ID_CUENTA_HASTA],[MONTO] 
            //        ,[TIPO] ,[FECHA_INICIO]  ,[FECHA_FIN]    ,[DESCRIPCION]
            //        ,[ID_USUARIO] FROM [STI].[dbo].[vw_TRecurrentes]   ";

            strQuery = @"Select [PAIS_ORIGEN] ,[ORIGEN] ,[CUENTA_ORIGEN],[CATEGORIA_ORIGEN]
                        ,[PAIS_DESTINO] ,[DESTINO],[CUENTA_DESTINO] ,[CATEGORIA_DESTINO] ,[MONTO] ,[USUARIO]
                           ,[DESCRIPCION] ,[ID_RECURRENTE]  FROM [STI].[dbo].[vw_TRecurrentes]";
             
            SqlCommand command = new SqlCommand(strQuery, Con);

            command.Parameters.AddWithValue("@ID_CUENTA_DESDE", ID_CUENTA_DESDE);

            SqlDataReader reader = command.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    ClsRecurrente PO = new ClsRecurrente();

                    if (reader.IsDBNull(0)) { PO.PAIS_ORIGEN = ""; } else { PO.PAIS_ORIGEN = reader.GetString(0); }
                    if (reader.IsDBNull(1)) { PO.ORIGEN = ""; } else { PO.ORIGEN = reader.GetString(1); }
                    if (reader.IsDBNull(2)) { PO.CUENTA_ORIGEN = ""; } else { PO.CUENTA_ORIGEN = reader.GetString(2); }
                    if (reader.IsDBNull(3)) { PO.CATEGORIA_ORIGEN = null; } else { PO.CATEGORIA_ORIGEN = reader.GetString(3); }
                    if (reader.IsDBNull(4)) { PO.PAIS_DESTINO = null; } else { PO.PAIS_DESTINO = reader.GetString(4); }
                    if (reader.IsDBNull(5)) { PO.DESTINO = null; } else { PO.DESTINO = reader.GetString(5); }
                    if (reader.IsDBNull(6)) { PO.CUENTA_DESTINO = ""; } else { PO.CUENTA_DESTINO = reader.GetString(6); }
                    if (reader.IsDBNull(7)) { PO.CATEGORIA_DESTINO = ""; } else { PO.CATEGORIA_DESTINO = reader.GetString(7); }

                    if (reader.IsDBNull(8)) { PO.MONTO = 0; } else { PO.MONTO = reader.GetDecimal(8); }
                    if (reader.IsDBNull(9)) { PO.USUARIO = ""; } else { PO.USUARIO = reader.GetString(9); }
                    if (reader.IsDBNull(10)) { PO.DESCRIPCION = ""; } else { PO.DESCRIPCION = reader.GetString(10); }
                    if (reader.IsDBNull(11)) { PO.ID_RECURRENTE = 0; } else { PO.ID_RECURRENTE = reader.GetInt32(11); }


                    lst_PO.Add(PO);
                }
                reader.Close();
            }
            return lst_PO;
        }
        public bool UpdateTRData(string txtone, int  id)
        {
            string strQuery;
            SqlCommand CmdActualizar;
            bool flgActualizado;

            strQuery = " UPDATE RECURRENTES SET MONTO = " + txtone +" WHERE ID_RECURRENTE = " + id +"";

            CmdActualizar = new SqlCommand(strQuery, Con);

            try
            {
                CmdActualizar.ExecuteNonQuery();

                flgActualizado = true;
            }

            catch (Exception ex)
            {
                flgActualizado = false;
            }

            return flgActualizado;
        }

    }



}