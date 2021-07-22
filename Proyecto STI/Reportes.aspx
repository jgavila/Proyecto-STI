<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reportes.aspx.cs" Inherits="Proyecto_STI.Reportes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Sistema de Transferencia Intercompany</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width" />        
    <link rel="stylesheet" href="css/templatemo_main.css" />
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
       
          <li class="active"><a href="Principal.aspx"><i class="fa fa-home"></i>Dashboard</a></li>
          <li class="sub open">
            <a href="javascript:;">
              <i class="fa fa-database"></i> Procesos <div class="pull-right"><span class="caret"></span></div>
            </a>
            <ul class="templatemo-submenu">
              <li><a href="Sincronizar.aspx"><i class="fa fa-cog"></i> Sincronización de Cuentas</a></li>
              <li><a href="Transferencia.aspx"><i class="fa fa-exchange"></i> Transferencia entre Cuentas</a></li>
              <li><a href="trecurrente.aspx"><i class="fa fa-refresh"></i> Transferencias Recurrentes</a></li>             
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
          <h1>REPORTES</h1>
          <h4>Transacciones Intercompany</h4>
          <div class="row">
              <div class="col-md-12">
                    <div class="panel panel-info">
                      <div class="panel-heading"><P>Click en la imagen para abrir reportes</P></div>
                    </div>
              </div>
          </div>
            <div class="panel-body">
 
                <div class="row vertical-align">
                    <div class="col-sm-4">
                        <a href="MostrarTrans.aspx" target="_blank">
                            <img src="images/interco.jpg"  style="width:200px;height:200px;margin:0 auto;border-radius: 84px 84px 84px 84px;-moz-border-radius: 84px 84px 84px 84px;-webkit-border-radius: 54px 54px 54px 54px;border: 15px solid #bce8f1;" class="img-responsive"/>
                            <h4 class="text-center">TRANSACCIONES INTERCOMPANY</h4></a>
                      
                    </div>
                    <div class="col-sm-4">
                        <a href="http://ptyvgpdb/ReportServer_GP2015PROD/Pages/ReportViewer.aspx?%2fSTI%2fReporte_Resumen&rs:Command=Render"target="_blank" title="">
                            <img src="images/resumen.png"  style="width:200px;height:200px;margin:0 auto;border-radius: 84px 84px 84px 84px;-moz-border-radius: 84px 84px 84px 84px;-webkit-border-radius: 54px 54px 54px 54px;border: 15px solid #bce8f1;"class="img-responsive"/>
                            <h4 class="text-center">REPORTE RESUMEN</h4></a>
                        
                    </div>
                    <div class="col-sm-4">
                        <a href="http://ptyvgpdb/ReportServer_GP2015PROD/Pages/ReportViewer.aspx?%2fSTI%2fReporte_Soluciones&rs:Command=Render"target="_blank" title="">
                            <img src="images/soluciones.jpg"  style="width:200px;height:200px;margin:0 auto;border-radius: 84px 84px 84px 84px;-moz-border-radius: 84px 84px 84px 84px;-webkit-border-radius: 54px 54px 54px 54px;border: 15px solid #bce8f1;" class="img-responsive"/>
                            <h4 class="text-center">REPORTE SOLUCIONES</h4></a>
                        
                    </div>
               

                </div>

            </div>
        </div>
      </div>
      <!-- Modal -->
      <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
              <h4 class="modal-title" id="myModalLabel">Esta seguro que desea Salir?</h4>
            </div>
            <div class="modal-footer">
              <a href="Login.aspx" class="btn btn-primary">Sí</a>
              <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
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
    <script src="js/Chart.min.js"></script>
    <script src="js/templatemo_script.js"></script>

    </form>
</body>
</html>
