using System;
namespace Proyecto_STI
{
    public class ClsRecurrente
    {
        //private string _ID_CUENTA_DESDE;
        //private string _ID_CUENTA_HASTA;
        //private decimal _MONTO;
        //private string _TIPO;
        //private DateTime? _FECHA_INICIO;
        //private DateTime? _FECHA_FIN;
        //private string _DESCRIPCION;
        //private int _ID_USUARIO;

         
        private string _ORIGEN;
        private string _CUENTA_ORIGEN;
        private string _CATEGORIA_ORIGEN;
        private string _PAIS_DESTINO;
        private string _DESTINO;
        private string _CUENTA_DESTINO;
        private string _CATEGORIA_DESTINO;
       
        private decimal _MONTO;
        private string _USUARIO;
        private string _DESCRIPCION;
        private string _PAIS_ORIGEN;
        private int _ID_RECURRENTE;

        public string PAIS_ORIGEN
        {
            get { return _PAIS_ORIGEN; }
            set { _PAIS_ORIGEN = value; }
        }
        public string ORIGEN
        {
            get { return _ORIGEN; }
            set { _ORIGEN = value; }
        }
        public string CUENTA_ORIGEN
        {
            get { return _CUENTA_ORIGEN; }
            set { _CUENTA_ORIGEN = value; }
        }
        public string CATEGORIA_ORIGEN
        {
            get { return _CATEGORIA_ORIGEN; }
            set { _CATEGORIA_ORIGEN = value; }
        }
        public string PAIS_DESTINO
        {
            get { return _PAIS_DESTINO; }
            set { _PAIS_DESTINO = value; }
        }
        public string DESTINO
        {
            get { return _DESTINO; }
            set { _DESTINO = value; }
        }
        public string CUENTA_DESTINO
        {
            get { return _CUENTA_DESTINO; }
            set { _CUENTA_DESTINO = value; }
        }
        public string CATEGORIA_DESTINO
        {
            get { return _CATEGORIA_DESTINO; }
            set { _CATEGORIA_DESTINO = value; }
        }
        public decimal MONTO
        {
            get { return _MONTO; }
            set { _MONTO = value; }
        }
       
        public string USUARIO
        {
            get { return _USUARIO; }
            set { _USUARIO = value; }
        }
        public string DESCRIPCION
        {
            get { return _DESCRIPCION; }
            set { _DESCRIPCION = value; }
        }
        public int ID_RECURRENTE
        {
            get { return _ID_RECURRENTE; }
            set { _ID_RECURRENTE = value; }
        }




        //public string ID_CUENTA_DESDE
        //{
        //    get { return _ID_CUENTA_DESDE; }
        //    set { _ID_CUENTA_DESDE = value; }
        //}

        //public string ID_CUENTA_HASTA
        //{
        //    get { return _ID_CUENTA_HASTA; }
        //    set { _ID_CUENTA_HASTA = value; }
        //}
        //public decimal MONTO
        //{
        //    get { return _MONTO; }
        //    set { _MONTO = value; }
        //}
        //public string TIPO
        //{
        //    get { return _TIPO; }
        //    set { _TIPO = value; }
        //}
        //public DateTime? FECHA_INICIO
        //{
        //    get { return _FECHA_INICIO; }
        //    set { _FECHA_INICIO = value; }
        //}
        //public DateTime? FECHA_FIN
        //{
        //    get { return _FECHA_FIN; }
        //    set { _FECHA_FIN = value; }
        //}
        //public string DESCRIPCION
        //{
        //    get { return _DESCRIPCION; }
        //    set { _DESCRIPCION = value; }
        //}
        //public int ID_USUARIO
        //{
        //    get { return _ID_USUARIO; }
        //    set { _ID_USUARIO = value; }
        //}
    }
}