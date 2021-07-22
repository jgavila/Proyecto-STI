using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Proyecto_STI
{
    public class ClsMostrar
    {
        public int IdTransaccion { get; set; }
        public string ORIGEN { get; set; }
        public int CUENTA_ORIGEN { get; set; }
        public string CATEGORIA_ORIGEN { get; set; }
        public string PAIS_DESTINO { get; set; }
        public string DESTINO { get; set; }
        public int CUENTA_DESTINO { get; set; }
        public string CATEGORIA_DESTINO { get; set; }
        public decimal MONTO { get; set; }
        public DateTime FECHA_TRANSACCION { get; set; }
        public string USUARIO { get; set; }
        public string DESCRIPCION { get; set; }
        

    }
}