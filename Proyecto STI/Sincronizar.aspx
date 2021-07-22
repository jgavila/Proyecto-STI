<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sincronizar.aspx.cs" Inherits="Proyecto_STI.Sincronizar" %>

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
              <li><a href="CGAdicionales.aspx"><i class="fa fa-refresh"></i>Costo - Gastos Adionales</a></li>
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
            <li><a href="#">Transferencias</a></li>
            <li><a href="#">Aprobaciones</a></li>
            <li><a href="#">Salir</a></li>
          </ol>
          <h1>Sincronización de Cuentas</h1>
          <p>Sincroniza las cuentas contables con el sistema de GP</p>
          <div class="row">
              <div class="col-md-12">
                    <div class="panel panel-info">
                      <div class="panel-heading">Presiones el Boton Iniciar para empezar el proceso</div>
                    </div>
              </div>
          </div>
          <div class="row">
               <div class="col-md-4">
                   <button type="button" id="btIniciar" class="btn btn-primary" data-toggle="modal" data-target="#confirmSincronizar">Iniciar</button>
                   <asp:Button ID="btSincronizar" runat="server" Text="Button" style="visibility:hidden" OnClick="btSincronizar_Click" />
               </div>
          </div>
          <br />
          
          <div class="row">
              <div class="col-md-12">
                    <asp:Label ID="lblEspere" runat="server" Text=""></asp:Label>
                        <div class="progress">
                          <div class="progress-bar progress-bar-striped active"  role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 50%">
                            <span class="sr-only"></span>
                          </div>
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

      <div class="modal fade" id="confirmSincronizar" tabindex="-1" role="dialog" aria-labelledby="myModalSincronizar" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
              <h4 class="modal-title" id="myModalSincronizar">Estas seguro que desea Sincronizar?</h4>
            </div>
            <div class="modal-footer">
              <button type="button" id="confirmado" class="btn btn-primary" data-dismiss="modal">Sí</button>
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
    <script type="text/javascript">
   

        $(document).ready(function () {
            $("#confirmado").click(function () {
                $("#lblEspere").text("Espere un momento...");
                setTimeout(EjcutarSync, 1600);
            });

            function EjcutarSync() {
                $(".progress-bar").attr('aria-valuenow', '25');
                $(".progress-bar").css("width","25%");
                $(".progress-bar").attr('aria-valuenow', '50');
                $(".progress-bar").css("width", "50%");
                $(".progress-bar").attr('aria-valuenow', '100');
                $(".progress-bar").css("width", "100%");
                $("#btSincronizar").click();
                


            }

        });


    </script>


    </form>
</body>
</html>
