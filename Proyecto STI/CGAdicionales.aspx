<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CGAdicionales.aspx.cs" Inherits="Proyecto_STI.CGAdicionales" %>

<!DOCTYPE html>

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
              <li><a href="seearchcg.aspx"><i class="fa fa-refresh"></i>Busqueda de CG Adicionales</a></li>
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
        <div class="templatemo-content" style="padding-bottom: 10px;">

          <ol class="breadcrumb">
            <li><a href="Principal.aspx">Dashboard</a></li>
            <li  class="active"><a href="#">Transferencias</a></li>
            <li><a href="#">Aprobaciones</a></li>
            <li><a href="#">Salir</a></li>
          </ol>
          <h1>Costos - Gastos Adicionales</h1>
          <p>Bienvenido</p>

          <div class="row">
              <div class="col-md-12">
                    <div class="panel panel-info">
                      <div class="panel-heading">Ingresar todo los datos solicitados, luego click en Guardar</div>
                    </div>
              </div>
          </div> 
          <div class="row">
            <div class="col-md-12">
                <div id="Good" runat="server"  class="alert alert-success alert-dismissible" role="alert" visible="false" >
                    <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <strong>Modificación Realizada!</strong> Su registro ha sigo guardado con exito para aprobación.
                </div>
                <div id="Wrong" runat="server" class="alert alert-danger alert-dismissible" role="alert" visible ="false">
                    <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <strong>Error Modificación No Realizada!</strong> Su registro no se ha podido guardar .
                </div>        
             </div>
          </div>

         <br />

           <div class="row">
               <div class="col col-md-4">
                   <label for="txtnfactura">Numero de factura a aplicar </label>
                   <asp:TextBox ID="txtnfactura" runat="server" class="form-control" ></asp:TextBox>
               </div>
           </div>

           <div class="row">
             <div class="col col-md-4">
                 <label for="fechaprocesada">Fecha de inclusión</label>
                 <div class="input-group date" data-provide="datepicker">
                  <input id="fechaprocesada" type="text" class="form-control" runat="server" />
                  <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                </div>
            </div>    

          </div>

            <div class="row">
               <div class="col col-md-7">
                 
                   <label for="txtobserv">Observación:</label>
                   <asp:TextBox ID="txtobserv" runat="server" class="form-control" text="" MaxLength="255" TextMode="MultiLine"></asp:TextBox>
               </div>
           </div>
 

           <div class="row">
               <div class="col col-md-2">
                   <label for="txtMonto">Monto:</label>
                   <asp:TextBox ID="txtMonto" runat="server" class="form-control" text="0.00" style="text-align:right"  ></asp:TextBox>
               </div>
           </div>
           
           <br />
             
           <div class="row">
               <div class="col col-md-2">
                   <button type="button" id="btTransferir" data-toggle="modal" data-target="#confirmTranferir" class="btn btn-primary">Guardar</button>
                    
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

      <div class="modal fade" id="confirmTranferir" tabindex="-1" role="dialog" aria-labelledby="myModalLabelTran" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
              <h4 class="modal-title" id="myModalLabelTran">Esta seguro que desea guardar el cambio?</h4>
            </div>
          
            <div class="modal-footer">
              <asp:Button ID="Condirmado" runat="server" Text="Sí" class="btn btn-primary" OnClick="Guardar_Click"/>
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
    <script src="js/bootstrap-datepicker.min.js"></script>
    <script src="js/Chart.min.js"></script>
    <script src="js/templatemo_script.js"></script>
    
    <script type="text/javascript">

        $(document).ready(function () {
            
            $('.input-group.date').datepicker({
                format: 'mm/dd/yyyy',
                todayBtn: 'linked',
                //clearBtn: true,
                autoclose: true,
                todayHighlight: true,
                toggleActive: true
              
            });
             
        });
         
    </script>
    </form>
</body>
</html>
