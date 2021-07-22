<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModificacionCRecurrente.aspx.cs" Inherits="Proyecto_STI.ModificacionCRecurrente" %>
 
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
          <p>En esta seccion puede ver las transaciones Recurrentes y modificar el monto</p>

          <div class="row">
              <div class="col-md-12">
                    <div class="panel panel-info">
                      <div class="panel-heading">Ingrese el número de cuenta o presione el boton mostrar datos para ver todos los registros</div>
                    </div>
              </div>
          </div> 
         <div class="row">
             <div class="col col-md-5" runat="server">
                 <label >N° de cuenta:</label> 
                 <asp:TextBox ID="txt0" runat="server" class="form-control"/>
                  <asp:Button ID="btn1" runat="server" onclick="Btnbuscar"  Text="Mostrar Datos" CssClass="btn btn-primary" />
             </div>
              
             </div>
             <div class="row" id="div1" runat="server">
             <div class="col-md-12">
                 <div class="panel panel-warning">
                                <div class="panel-heading">Escoja el o los registros que desee modificar, ingrese el monto y Presione el boton Actualizar</div>
                            </div> 
            </div>
              
             <div class="col col-md-5" runat="server">
                 <label >Monto:</label>
                 <asp:TextBox ID="txt1" runat="server" class="form-control"/>
                 <asp:Button ID="btn2" runat="server" onclick="Btnupdate"  Text="Actualizar" CssClass="btn btn-warning" />


            </div>
               
         </div>

            <br />
           
               <div class="row">
                   <div class="col col-lg-2">
                      </div>
                  <asp:Label ID="lblMensaje" runat="server" font-name="Lucida Console" font-color ="red"></asp:Label>
               </div>
            <br />
             <div class="row"> 
                 
              <div class="col-md-12" style="overflow:auto ">
                 
                  
                  <%--<asp:GridView ID="GridViewMostrar" runat="server" CssClass="table table-striped table-bordered table-responsive"  ShowHeaderWhenEmpty="True" EmptyDataText="No se encontraron registros con los datos ingresados" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" Width="938px"  >
                      <AlternatingRowStyle BackColor="#CCCCCC" />
                  </asp:GridView> --%>

                  <asp:GridView ID="GridViewMostrar" Class="table" runat="server" ShowHeaderWhenEmpty="True" EmptyDataText="Sin registro" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" >
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:TemplateField HeaderText="*">
                            <EditItemTemplate>
                                <asp:CheckBox ID="chkSelect" runat="server"  />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSelect" runat="server"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="PAIS_ORIGEN" HeaderText="PAIS ORIGEN" />
                        <asp:BoundField DataField="ORIGEN" HeaderText="ORIGEN" />
                        <asp:BoundField DataField="CUENTA_ORIGEN" HeaderText="CUENTA_ORIGEN" />
                        <asp:BoundField DataField="CATEGORIA_ORIGEN" HeaderText="CATEGORIA ORIGEN" />
                        <asp:BoundField DataField="PAIS_DESTINO" HeaderText="PAIS DESTINO" /> 
                        <asp:BoundField DataField="DESTINO" HeaderText="DESTINO" />
                        <asp:BoundField DataField="CUENTA_DESTINO" HeaderText="CUENTA_DESTINO" />
                        <asp:BoundField DataField="CATEGORIA_DESTINO" HeaderText="CATEGORIA DESTINO" />
                       
                        <asp:BoundField DataField="MONTO"  DataFormatString="{0:n}" HeaderText="MONTO" />
                       <asp:BoundField DataField="USUARIO" HeaderText="USUARIO" />
                       <asp:BoundField DataField="DESCRIPCION" HeaderText="DESCRIPCION" />
                        <asp:BoundField DataField="ID_RECURRENTE" HeaderText="ID" />
                        



                    </Columns>
                   <%-- <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="#007BFF" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />--%>
                 </asp:GridView>
                 <%-- <asp:Panel runat="server" style="overflow: auto; min-height:64px; max-height:240px"  ID="pnlPO" Visible="false">
                
                  </asp:Panel>--%>


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
