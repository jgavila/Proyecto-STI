<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BuscarTran.aspx.cs" Inherits="Proyecto_STI.BuscarTran" %>

 
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sistema de Transferencia Intercompany</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width" />        
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/templatemo_main.css" />
    <link href="css/bootstrap-datepicker3.min.css" rel="stylesheet" />
   
</head>
<body>
    <form id="form1" runat="server">
  <div class="navbar navbar-inverse" role="navigation">
      <div class="navbar-header">
        <div class="logo"><h1>Sistema de Transferencia Intercompany -  Tecnología Aplicada S.A.</h1></div>
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button> 
      </div>   
    </div>
    <div class="template-page-wrapper">
      <div class="navbar-collapse collapse templatemo-sidebar">
        <ul class="templatemo-sidebar-menu">
        <!--

          <li>
            <form class="navbar-form">
              <input type="text" class="form-control" id="templatemo_search_box" placeholder="Search...">
              <span class="btn btn-default">Go</span>
            </form>
          </li>
        -->
          <li class="active"><a href="Principal.aspx"><i class="fa fa-home"></i>Dashboard</a></li>
          <li class="sub open">
            <a href="javascript:;">
              <i class="fa fa-database"></i> Procesos <div class="pull-right"><span class="caret"></span></div>
            </a>
            <ul class="templatemo-submenu">
              <li><a href="Sincronizar.aspx"><i class="fa fa-cog"></i> Sincronización de Cuentas</a></li>
              <li><a href="Transferencia.aspx"><i class="fa fa-exchange"></i> Transferencia entre Cuentas</a></li>
              <li><a href="trecurrente.aspx"><i class="fa fa-refresh"></i> Transferencias Recurrentes</a></li>   
                <li><a href="buscartran.aspx"><i class="fa fa-refresh"></i>Busqueda de Transacciones</a></li>
              <li><a href="CGAdicionales.aspx"><i class="fa fa-refresh"></i>Costo - Gastos Adicionales</a></li>
                <li><a href="#"><i class="fa fa-gavel"></i> Aprobaciones de Transferencias</a></li>
            </ul>
          </li>
          <li><a href="Reportes.aspx"><i class="fa fa-bar-chart-o "></i> Reportes</a></li>
          <li><a href="#"><i class="fa fa-users"></i> Usuarios</a></li>
          <li><a href="#"><i class="fa fa-building"></i> Compañias</a></li>
          <li><a href="#"><i class="fa fa-cog"></i> Preferencias</a></li>
          <li><a href="javascript:;" data-toggle="modal" data-target="#confirmModal"><i class="fa fa-sign-out"></i>Salir</a></li>
        </ul>
      </div><!--/.navbar-collapse -->

      <div class="templatemo-content-wrapper">
        <div class="templatemo-content">

             <ol class="breadcrumb">
            <li class="active"><a href="Principal.aspx">Dashboard</a></li>
            <li><a href="Principal.aspx">Atras</a></li>
            <li><a href="Principal.aspx">Salir</a></li>
          </ol>
          <h1>Buscar Transacciones</h1>
          <p>En esta seccion puede ver las transaciones de fechas especificas</p>

          <div class="row">
              <div class="col-md-12">
                    <div class="panel panel-info">
                      <div class="panel-heading">Ingrese el número de cuenta o una descripción, luego precione el boton mostrar</div>
                    </div>
              </div>
          </div> 
         <div class="row">
             <div class="col col-md-4">
                 <label  >N° de cuenta:</label>
                  <input id="txt1" type="text" class="form-control" runat="server"  />
                  
            </div>
              <div class="col col-md-4">
                 <label >Descripción:</label>
                  <input id="txt2" type="text"  class="form-control" runat="server"  />

            </div>
         </div>
            <br />
               <div class="row">
                   <div class="col col-lg-2">
                       <asp:Button ID="btn1" runat="server" onclick="Btnbuscar"  Text="Mostrar" CssClass="btn btn-primary" />
                       <%--<asp:Button ID="btn2" runat="server" onclick="Download"  Text="Descarga" CssClass="btn btn-primary" />--%>
                   </div>
                  <asp:Label ID="lblMensaje" runat="server" font-name="Lucida Console" font-color ="red"></asp:Label>
               </div>
            <br />
             <div class="row"> 
                 
              <div class="col-md-12" style="overflow:auto ">
                  <asp:GridView ID="GridViewMostrar" runat="server" CssClass="table table-striped table-bordered table-responsive"  ShowHeaderWhenEmpty="True" EmptyDataText="No se encontraron registros con los datos ingresados" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" Width="938px"  >
                      <AlternatingRowStyle BackColor="#CCCCCC" />
                  </asp:GridView> 
              </div> 
             </div>    

        </div>

      </div>

      <footer class="templatemo-footer">
        <div class="templatemo-copyright">
          <p>Copyright &copy; 2018 Tecnología Aplicada S.A.</p>
        </div>
      </footer>
    </div>
     
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap-datepicker.min.js"></script>
    <script src="js/Chart.min.js"></script>
    <script src="js/templatemo_script.js"></script>
    
    </form>
</body>
</html>
