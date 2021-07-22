<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="trecurrente.aspx.cs" Inherits="Proyecto_STI.trecurrente" %>

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
            <li><a href="Principal.aspx">Dashboard</a></li>
            <li  class="active"><a href="#">Transferencias</a></li>
            <li><a href="#">Aprobaciones</a></li>
            <li><a href="#">Salir</a></li>
          </ol>
          <h1>Transferencias Recurrentes</h1>
          <%--<p> Se realiza la transferencias entre distintas cuentas de cada compañia</p>--%>

          <div class="row">
              <div class="col-md-12">
                    <div class="panel panel-info">
                      <div class="panel-heading">Ingrese todo los datos solicitados antes de guardar y muy importante la Recurrencia con la que se va ejecutar esta transferencia</div>
                    </div>
              </div>
          </div> 
          <div class="row">
            <div class="col-md-12">
                <div id="Good" runat="server"  class="alert alert-success alert-dismissible" role="alert" visible="false" >
                    <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <strong>Transacción Realizada!</strong> Su registro ha sigo guardado con exito para aprobación.
                </div>
                <div id="Wrong" runat="server" class="alert alert-danger alert-dismissible" role="alert" visible ="false">
                    <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <strong>Error Transacción No Realizada!</strong> Su registro no se ha podido guardar, Revise que todo los campos esten llenos!.
                </div>        
             </div>
          </div>


         <div class="row">
             <%--<div class="col col-md-4">
                 <label for="FechaTranferencia">Fecha Transferencia:</label>
                 <div class="input-group date" data-provide="datepicker">
                  <input id="FechaTranferencia" type="text" class="form-control" runat="server" data-date-format="dd/mm/yyyy"/>
                  <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                </div>
            </div>  --%>  

              <div class="col col-md-4">
                 <label for="FechaTranferencia">Fecha Inicio:</label>
                 <div class="input-group date" data-provide="datepicker">
                  <input id="finicio" type="text"  readonly ="true" class="form-control" runat="server"  />
                  <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                </div>
                 
                
            </div>
              <div class="col col-md-4">
                 <label for="FechaTranferencia">Fecha Final:</label>
                 <div class="input-group date" data-provide="datepicker">
                  <input id="ffinal" type="text"  readonly ="true" class="form-control" runat="server"  />
                  <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                </div>
            </div>

         </div>
         <br />

          <div class="row">
              <div class="col-md-4">
                    <div class="panel panel-warning">
                      <div class="panel-heading">DATOS DE ORIGEN</div>
                    </div>
              </div>

              <div class="col-md-4">
                    <div class="panel panel-warning">
                      <div class="panel-heading">DATOS DE DESTINO</div>
                    </div>
              </div>
          </div> 
            
            
            <div class="row">
               <div class="col col-md-4">
                    <label for="CboCompanyOrigen">Compañia:</label>
                    <asp:DropDownList ID="CboCompanyOrigen" CssClass="form-control col-md-4" 
                     runat="server" DataSourceID="ObjectDataSource1" DataTextField="Company" 
                     DataValueField="Idcompany" AutoPostBack="True"></asp:DropDownList> 
                     <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                     SelectMethod="GetListaCompanies" TypeName="Proyecto_STI.ClsBusiness">
                     </asp:ObjectDataSource>
               </div>
               <div class="col col-md-4">
                    <label for="CboCompanyDestino">Compañia:</label>
                    <asp:DropDownList ID="CboCompanyDestino" CssClass="form-control col-md-4" 
                     runat="server" DataSourceID="ObjectDataSource4" DataTextField="Company" 
                     DataValueField="Idcompany" AutoPostBack="True"></asp:DropDownList> 
                     <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" 
                     SelectMethod="GetListaCompanies" TypeName="Proyecto_STI.ClsBusiness">
                     </asp:ObjectDataSource>
               </div>




           </div>
          <div class="row">
               <div class="col col-md-4">
                    <label for="CboCategoriaOrigen">Categoría:</label>
                    <asp:DropDownList ID="CboCategoriaOrigen" CssClass="form-control col-md-4" 
                     runat="server" DataSourceID="ObjectDataSource2" DataTextField="Categoria" 
                     DataValueField="Idcategoria" AutoPostBack="True"></asp:DropDownList> 
                     <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
                     SelectMethod="GetListaCategorias" TypeName="Proyecto_STI.ClsBusiness">
                     </asp:ObjectDataSource>
               </div>
               <div class="col col-md-4">
                    <label for="CboCategoriaDestino">Categoría:</label>
                    <asp:DropDownList ID="CboCategoriaDestino" CssClass="form-control col-md-4" 
                     runat="server" DataSourceID="ObjectDataSource5" DataTextField="Categoria" 
                     DataValueField="Idcategoria" AutoPostBack="True"></asp:DropDownList> 
                     <asp:ObjectDataSource ID="ObjectDataSource5" runat="server" 
                     SelectMethod="GetListaCategorias" TypeName="Proyecto_STI.ClsBusiness">
                     </asp:ObjectDataSource>
               </div>


           </div>
           <div class="row">
               <div class="col col-md-4">
                    <label for="CboCuentaOrigen">Cuenta:</label>
                    <asp:DropDownList ID="CboCuentaOrigen" CssClass="form-control col-md-4" 
                     runat="server" DataSourceID="ObjectDataSource3" DataTextField="CuentaDescripcion" 
                     DataValueField="IdCuenta" AutoPostBack="True"></asp:DropDownList> 
                     <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" 
                     SelectMethod="GetListaCuentas" TypeName="Proyecto_STI.ClsBusiness">
                         <SelectParameters>
                             <asp:ControlParameter ControlID="CboCategoriaOrigen" DefaultValue="0" Name="Category" PropertyName="SelectedValue" Type="Int32" />
                             <asp:ControlParameter ControlID="CboCompanyOrigen" DefaultValue="0" Name="Company" PropertyName="SelectedValue" Type="Int32" />
                         </SelectParameters>
                     </asp:ObjectDataSource>
               </div>
               <div class="col col-md-4">
                    <label for="CboCuentaDestino">Cuenta:</label>
                    <asp:DropDownList ID="CboCuentaDestino" CssClass="form-control col-md-4" 
                     runat="server" DataSourceID="ObjectDataSource6" DataTextField="CuentaDescripcion" 
                     DataValueField="IdCuenta" AutoPostBack="True"></asp:DropDownList> 
                     <asp:ObjectDataSource ID="ObjectDataSource6" runat="server" 
                     SelectMethod="GetListaCuentas" TypeName="Proyecto_STI.ClsBusiness">
                         <SelectParameters>
                             <asp:ControlParameter ControlID="CboCategoriaDestino" DefaultValue="0" Name="Category" PropertyName="SelectedValue" Type="Int32" />
                             <asp:ControlParameter ControlID="CboCompanyDestino" DefaultValue="0" Name="Company" PropertyName="SelectedValue" Type="Int32" />
                         </SelectParameters>
                     </asp:ObjectDataSource>
               </div>


           </div>


           <div class="row">
               <div class="col col-md-8">
                 
                   <label for="txtDescripcion">Descripción:</label>
                   <asp:TextBox ID="txtDescripcion" runat="server" class="form-control" text="" MaxLength="255" TextMode="MultiLine"></asp:TextBox>
               </div>
           </div>
 

           <div class="row">
               <div class="col col-md-2">
                   <label for="txtMonto">Monto a Tranferir:</label>
                   <asp:TextBox ID="txtMonto" runat="server" class="form-control" text="0.00" style="text-align:right"  ></asp:TextBox>
               </div>
               <div class="col col-md-2">
                <label for="Cborecurrencia">Recurrencia:</label>
                    <asp:DropDownList ID="Cborecurrencia" CssClass="form-control col-md-4" 
                     runat="server" >
                         
                            <asp:ListItem Text="Diario" Value="D"></asp:ListItem>
                            <asp:ListItem Text="Semanal" Value="S"></asp:ListItem>
                            <asp:ListItem Text="Quincenal" Value="Q"></asp:ListItem>
                            <asp:ListItem Text="Mensual" Value="M"></asp:ListItem>
                            <asp:ListItem Text="Anual" Value="A"></asp:ListItem>
                    </asp:DropDownList>     
               </div>

           </div>
           
           <br />
             
           <div class="row">
               <div class="col col-md-2">
                   <button type="button" id="btGuardar" data-toggle="modal" data-target="#confirmTranferir" class="btn btn-success">Guardar</button>
                     
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
              <h4 class="modal-title" id="myModalLabelTran">Esta seguro que desea realizar la siguiente Tranferencia?</h4>
            </div>
            <div>
                <div>
                    <asp:Label ID="Label1" runat="server" Text="Origen:"></asp:Label>
                    <asp:Label ID="lblCompanyOrigen" runat="server" Text=""></asp:Label>
                    <asp:Label ID="Label4" runat="server" Text="|"></asp:Label>
                    <asp:Label ID="lblCuentaOrigen" runat="server" Text=""></asp:Label>
                </div>
                <div>
                    <asp:Label ID="Label2" runat="server" Text="Destino:"></asp:Label>
                    <asp:Label ID="lblCompanyDestino" runat="server" Text=""></asp:Label>
                    <asp:Label ID="Label5" runat="server" Text="|"></asp:Label>
                    <asp:Label ID="lblCuentaDestino" runat="server" Text=""></asp:Label>
                </div>
                <div>
                    <asp:Label ID="Label3" runat="server" Text="Monto:"></asp:Label>
                    <asp:Label ID="lblMonto" runat="server" Text=""></asp:Label>
                </div>
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
            $("#btGuardar").mouseover(function () {

                
                $("#lblMonto").text($("#txtMonto").val());
                $("#lblCompanyOrigen").text($("#CboCompanyOrigen option:selected").text());
                $("#lblCuentaOrigen").text($("#CboCuentaOrigen option:selected").text());
                $("#lblCompanyDestino").text($("#CboCompanyDestino option:selected").text());
                $("#lblCuentaDestino").text($("#CboCuentaDestino option:selected").text());
                


            });


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
