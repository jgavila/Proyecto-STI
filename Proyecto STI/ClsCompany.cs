using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Proyecto_STI
{
    public class ClsCompany
    {




        private int idcompany;
        public int Idcompany
        {
            get { return idcompany; }
            set { idcompany = value; }
        }

        private string company;
        public string Company
        {
            get { return company; }
            set { company = value; }
        }

        private string pais;
        public string Pais
        {
            get { return pais; }
            set { pais = value; }
        }

        private string codcuenta;
        public string Codcuenta
        {
            get { return codcuenta; }
            set { codcuenta = value; }
        }

    }
}