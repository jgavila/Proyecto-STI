using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Proyecto_STI
{
    public class ClsTransacciones
    {


        private int idTransaccion;
        public int IdTransaccion
        {
            get { return idTransaccion; }
            set { idTransaccion = value; }
        }


        private int cuentaOrigen;
        public int CuentaOrigen
        {
            get { return cuentaOrigen; }
            set { cuentaOrigen = value; }
        }

        private int cuentaDestino;
        public int CuentaDestino
        {
            get { return cuentaDestino; }
            set { cuentaDestino = value; }
        }





        private int tipo;
        public int Tipo
        {
            get { return tipo; }
            set { tipo = value; }
        }

        private int usuario;
        public int Usuario
        {
            get { return usuario; }
            set { usuario = value; }
        }

        private int usuario_aprobador;
        public int Usuario_Aprobador
        {
            get { return usuario_aprobador; }
            set { usuario_aprobador = value; }
        }

        decimal monto;
        public decimal Monto
        {
            get { return monto; }
            set { monto = value; }
        }

        DateTime fechaTransaccion;
        public DateTime FechaTransaccion
        {
            get { return fechaTransaccion; }
            set { fechaTransaccion = value; }
        }

        DateTime fechaaprobada;
        public DateTime FechaAprobada
        {
            get { return fechaaprobada; }
            set { fechaaprobada = value; }
        }

        DateTime fechaausrtran;
        public DateTime FechaTransferencia
        {
            get { return fechaausrtran; }
            set { fechaausrtran = value; }
        }


        string modo;
        public string Modo
        {
            get { return modo; }
            set { modo = value; }
        }

        string descripcion;
        public string Descripcion
        {
            get { return descripcion; }
            set { descripcion = value; }
        }

        bool aprobada;
        public bool Aprobada
        {
            get { return aprobada; }
            set { aprobada = value; }
        }

        public string AprobadaName
        {
            get {

                string valorRet;

                if (aprobada == false)
                {
                    valorRet = "No";
                }
                else
                {
                    valorRet = "Sí";
                }

                return valorRet;

            }
           
        }

        string companyOrigen;
        public string CompanyOrigen
        {
            get { return companyOrigen; }
            set { companyOrigen = value; }
        }

        string companyDestino;
        public string CompanyDestino
        {
            get { return companyDestino; }
            set { companyDestino = value; }
        }


        string cuentaOriegenDes;
        public string CuentaOriegenDes
        {
            get { return cuentaOriegenDes; }
            set { cuentaOriegenDes = value; }
        }

        string cuentaDestinoDes;
        public string CuentaDestinoDes
        {
            get { return cuentaDestinoDes; }
            set { cuentaDestinoDes = value; }
        }

        public System.Security.Principal.IPrincipal User { get; set; }

    }
}