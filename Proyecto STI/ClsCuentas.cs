using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Proyecto_STI
{
    public class ClsCuentas
    {

        private string cuenta;

        public string Cuenta
        {
            get { return cuenta; }
            set { cuenta = value; }
        }

        private string descripcion;

        public string Descripcion
        {
            get { return descripcion; }
            set { descripcion = value; }
        }

        private int categoria;
        public int Categoria
        {
            get { return categoria; }
            set { categoria = value; }
        }

        private int company;
        public int Company
        {
            get { return company; }
            set { company = value; }
        }

        private int idCuenta;
        public int IdCuenta
        {
            get { return idCuenta; }
            set { idCuenta = value; }
        }


        public string CuentaDescripcion
        {
            get { return cuenta + " - " + descripcion; }
        }

    }
}