<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Principal.aspx.cs" Inherits="Proyecto_STI.Principal" %>

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
                <li><a href="buscartran.aspx"><i class="fa fa-refresh"></i>Busqueda de Transacciones</a></li>
                <li><a href="ModificacionCRecurrente.aspx"><i class="fa fa-refresh"></i>Busqueda de Transacciones Recurrentes</a></li>
                <li><a href="seearchcg.aspx"><i class="fa fa-refresh"></i>Busqueda de CG Adicionales</a></li>
                <li><a href="#"><i class="fa fa-gavel"></i> Aprobaciones de Transferencias</a></li>
            </ul>
          </li>
          <li><a href="Reportes.aspx"><i class="fa fa-bar-chart-o "></i> Reportes</a></li>
          <li><a href="#"><i class="fa fa-users"></i> Usuarios</a></li>
            <li><a href="#"><i class="fa fa-building"></i> Compañias</a></li>
          <li><a href="preferences.html"><i class="fa fa-cog"></i> Preferencias</a></li>
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
          <h1>Dashboard</h1>
          <p>Se muestra las distintas transacciones realizadas asi como las aprobaciones y solicitudes pendientes</p>

          <div class="margin-bottom-30">
            <div class="row">
              <div class="col-md-12">
                <ul class="nav nav-pills">
                  <li class="active"><a href="#">Transferencias Hoy <span class="badge"><asp:Label ID="lblTransacciones" runat="server" Text="0" /></span></a></li>
                  <li class="active"><a href="#">Aprobaciones Pendientes <span class="badge"><asp:Label ID="lblAprobaciones" runat="server" Text="0"/></span></a></li>
                  <li class="active"><a href="#">Solicitudes <span class="badge"><asp:Label ID="lblSolicitudes" runat="server" Text="0"/></span></a></li>
                    <li class="active"><a href="MostrarTrans.aspx">Buscar Transacciones <span class="badge"><asp:Label ID="lblMostrar" runat="server" Text="?" /></span></a></li>
                </ul>          
              </div>
            </div>
          </div>  

          <div class="row"> 
              <div class="col-md-12"> 
                   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames = "IdTransaccion" 
                                 CssClass="table">
                                <Columns>
                                    <asp:BoundField DataField="FechaTransaccion" HeaderText="Fecha-Hora" 
                                        DataFormatString="{0:dd-MM-yyyy HH:mm}">
                                    <ControlStyle Font-Size="Smaller" />
                                    <FooterStyle Font-Size="Smaller" />
                                    <HeaderStyle CssClass="panel-heading" Font-Size="Smaller" />
                                     <ItemStyle Font-Size="Smaller" Wrap="False" />
                                     </asp:BoundField>
                                    
                                    <asp:BoundField DataField="Monto" HeaderText="Monto" DataFormatString="{0:#,##0.00}">
                                    <ControlStyle Font-Size="Smaller" />
                                    <HeaderStyle CssClass="panel-heading" Font-Size="Smaller" />
                                    <ItemStyle Font-Size="Smaller" Wrap="False" />
                                    </asp:BoundField>
                                    


                                    <asp:BoundField DataField="Descripcion" HeaderText="Descripción">
                                    <ControlStyle Font-Size="Smaller" />
                                    <HeaderStyle CssClass="panel-heading" Font-Size="Smaller" />
                                    <ItemStyle Font-Size="Smaller" />
                                    </asp:BoundField>
 
                                    
                                    <asp:BoundField DataField="CompanyOrigen" HeaderText="Compañia Origen">
                                    <ControlStyle Font-Size="Smaller" />
                                    <HeaderStyle CssClass="panel-heading" Font-Size="Smaller" />
                                    <ItemStyle Font-Size="Smaller" />
                                    </asp:BoundField>

                                    <asp:BoundField DataField="cuentaOriegenDes" HeaderText="Cuenta Origen">
                                    <ControlStyle Font-Size="Smaller" />
                                    <HeaderStyle CssClass="panel-heading" Font-Size="Smaller" />
                                    <ItemStyle Font-Size="Smaller" />
                                    </asp:BoundField>

                                     <asp:BoundField DataField="companyDestino" HeaderText="Compañia Destino">
                                    <ControlStyle Font-Size="Smaller" />
                                    <HeaderStyle CssClass="panel-heading" Font-Size="Smaller" />
                                    <ItemStyle Font-Size="Smaller" />
                                    </asp:BoundField>                                                                   
 
                                    <asp:BoundField DataField="cuentaDestinoDes" HeaderText="Cuenta Destino">
                                    <ControlStyle Font-Size="Smaller" />
                                    <HeaderStyle CssClass="panel-heading" Font-Size="Smaller" />
                                    <ItemStyle Font-Size="Smaller" />
                                    </asp:BoundField>

                                    <asp:BoundField DataField="AprobadaName" HeaderText="Aprobada">
                                    <ControlStyle Font-Size="Smaller" />
                                    <HeaderStyle CssClass="panel-heading" Font-Size="Smaller" />
                                    <ItemStyle Font-Size="Smaller" />
                                    </asp:BoundField>                                       
                                    
                                    
                                                                    
                                </Columns>
                            </asp:GridView>           
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
    <script type="text/javascript">



    </script>
    </form>
</body>
</html>
