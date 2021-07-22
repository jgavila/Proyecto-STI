using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace Proyecto_STI
{
    public class ClsBusiness
    { 
        public ClsBusiness()
        {
             
        } 
        public static int ValidarUsuario(string Usuario, string pws)
        {
            ClsData Data = new ClsData();
            int Resultado;
            Data.Abrir();
            Resultado = Data.ValidarUsuario(Usuario, pws);
            Data.Cerrar();

            return Resultado;
             
        }

        public static List<ClsTransacciones> GetListaTransacciones(DateTime FechaDesde, DateTime FechaHasta)
        {
            ClsData Data = new ClsData();
            List<ClsTransacciones> Resultado;
            Data.Abrir();
            Resultado = Data.GetListaTransacciones(FechaDesde, FechaHasta);
            Data.Cerrar();

            return Resultado;



        }

        public static List<ClsTransacciones> GetListaTransacciones(DateTime FechaDesde, DateTime FechaHasta, int Cuenta)
        {
            ClsData Data = new ClsData();
            List<ClsTransacciones> Resultado;
            Data.Abrir();
            Resultado = Data.GetListaTransacciones(FechaDesde, FechaHasta,Cuenta);
            Data.Cerrar();

            return Resultado;



        }

        public static List<ClsMostrar> GetMostarTransacciones(DateTime FechaDesde, DateTime FechaHasta)
        {
            ClsData Data = new ClsData();
            List<ClsMostrar> Resultado;
            Data.Abrir();
            Resultado = Data.GetMostarTransacciones(FechaDesde, FechaHasta);
            Data.Cerrar();

            return Resultado;



        }
        
        public static bool SincronizarCuentas()
        {
            ClsData Data = new ClsData();
            bool Resultado;
            Data.Abrir();
            Resultado = Data.SincronizarCuentas();
            Data.Cerrar();

            return Resultado;


        }

        
        public static bool SincronizarCarga()
        {
            ClsData Data = new ClsData();
            bool Resultado;
            Data.Abrir();
            Resultado = Data.SincronizarCarga();
            Data.Cerrar();

            return Resultado;


        }

        public static List<ClsCuentas> GetListaCuentas(int Category, int Company)
        {

            ClsData Data = new ClsData();
            List<ClsCuentas> Resultado;
            Data.Abrir();
            Resultado = Data.GetListaCuentas(Category, Company);
            Data.Cerrar();

            return Resultado;

        }

        public static List<ClsCategorias> GetListaCategorias()
        {

            ClsData Data = new ClsData();
            List<ClsCategorias> Resultado;
            Data.Abrir();
            Resultado = Data.GetListaCategorias();
            Data.Cerrar();

            return Resultado;

        }

        public static List<ClsCompany> GetListaCompanies()
        {

            ClsData Data = new ClsData();
            List<ClsCompany> Resultado;
            Data.Abrir();
            Resultado = Data.GetListaCompanies();
            Data.Cerrar();

            return Resultado;

        }
               
        public static int GuardarTransferencia(int CuentaOrg, int CuentaDes, decimal Monto,DateTime Fecha_Transacccion, int Usuario, string Descripcion, DateTime FechaUsrTran)
        {

            ClsData Data = new ClsData();
            int Resultado;
            Data.Abrir();
            Resultado = Data.GuardarTransferencia(CuentaOrg, CuentaDes, Monto, Fecha_Transacccion, Usuario, Descripcion, FechaUsrTran);
            Data.Cerrar();

            return Resultado;


        }

        public static int GuardarTRecurrencia(int CuentaOrg, int CuentaDes, decimal Monto, string Tipo, DateTime Finicio, DateTime Ffin, string Descripcion, int Usuario)

        {

            ClsData Data = new ClsData();
            int Resultado;
            Data.Abrir();
            Resultado = Data.GuardarTRecurrencia(CuentaOrg, CuentaDes, Monto, Tipo, Finicio, Ffin,Descripcion, Usuario);
            Data.Cerrar();

            return Resultado;


        }

        public static int GuardarCGAdicionales(string numfactura, DateTime fechaingreso, DateTime fechaprocesada, string Observacion, decimal Monto, int Procesado, string Idusuario)

        {

            ClsData Data = new ClsData();
            int Resultado;
            Data.Abrir();
            Resultado = Data.GuardarCGAdicional(numfactura, fechaingreso, fechaprocesada, Observacion, Monto, Procesado, Idusuario);
            Data.Cerrar();

            return Resultado;


        }

        public static List<ClsRecurrente> GetListR(string ID_CUENTA_DESDE)
        {
            List<ClsRecurrente> Lista_PO = new List<ClsRecurrente>();

            ClsData Data = new ClsData();

            Data.Abrir();
            Lista_PO = Data.GetListR(ID_CUENTA_DESDE);
            Data.Cerrar();

            return Lista_PO;

            
        }
        public static bool UpdateTR(string txtone, int id)
        {
            ClsData Data = new ClsData();
            bool RegActualizado;

            Data.Abrir();
            RegActualizado = Data.UpdateTRData(txtone, id);
            Data.Cerrar();

            return RegActualizado;
        }

    }
}