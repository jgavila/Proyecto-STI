<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Transferencia.aspx.cs" Inherits="Proyecto_STI.Tranferencia" %>

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


    <style type="text/css">
        .auto-style2 {
            left: 0px;
            top: 0px;
            height: 20px;
        }

        .auto-style3 {
            left: 0px;
            top: 0px;
            height: 36px;
        }
        
        .floated {
            float:left;
                margin-right:5px;
            }
        #wrapper {
                /*width: 100%;
                height: 400px;
                border: 1px solid black;*/
                display: flex;
                align-items: center;
                justify-content: center;
            }
    </style>
   

</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar navbar-inverse" role="navigation">
            <div class="navbar-header">
                <div class="logo">
                    <h1>Sistema de Transferencia Intercompany -  Tecnología Aplicada S.A.</h1>
                </div>
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
                            <i class="fa fa-database"></i>Procesos
                            <div class="pull-right"><span class="caret"></span></div>
                        </a>
                        <ul class="templatemo-submenu">
                            <li><a href="Sincronizar.aspx"><i class="fa fa-cog"></i>Sincronización de Cuentas</a></li>
                            <li><a href="Transferencia.aspx"><i class="fa fa-exchange"></i>Transferencia entre Cuentas</a></li>
                            <li><a href="trecurrente.aspx"><i class="fa fa-refresh"></i>Transferencias Recurrentes</a></li>
                            <li><a href="CGAdicionales.aspx"><i class="fa fa-refresh"></i>Costo - Gastos Adionales</a></li>
                            <li><a href="#"><i class="fa fa-gavel"></i>Aprobaciones de Transferencias</a></li>
                        </ul>
                    </li>
                    <li><a href="Reportes.aspx"><i class="fa fa-bar-chart-o "></i>Reportes</a></li>
                    <li><a href="#"><i class="fa fa-users"></i>Usuarios</a></li>
                    <li><a href="#"><i class="fa fa-building"></i>Compañias</a></li>
                    <li><a href="#"><i class="fa fa-cog"></i>Preferencias</a></li>
                    <li><a href="javascript:;" data-toggle="modal" data-target="#confirmModal"><i class="fa fa-sign-out"></i>Salir</a></li>
                </ul>
            </div>
            <!--/.navbar-collapse -->

            <div class="templatemo-content-wrapper">
                <div class="templatemo-content">

                    <ol class="breadcrumb">
                        <li><a href="Principal.aspx">Dashboard</a></li>
                        <li class="active"><a href="#">Transferencias</a></li>
                        <li><a href="#">Aprobaciones</a></li>
                        <li><a href="#">Salir</a></li>
                    </ol>
                    <h1>Transferencias</h1>
                    <p>Se realiza la transferencias entre distintas cuentas de cada compañia</p>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-info">
                                <div class="panel-heading">Seleccione la cuenta de Origen y La cuenta de Destino, Introduzca el Monto a tranferir y Presiones el Boton [Tranferir]</div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div id="Good" runat="server" class="alert alert-success alert-dismissible" role="alert" visible="false">
                                <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                <strong>Transacción Realizada!</strong> Su registro ha sigo guardado con exito para aprobación.
                            </div>
                            <div id="Wrong" runat="server" class="alert alert-danger alert-dismissible" role="alert" visible="false">
                                <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                <strong>Error Transacción No Realizada!</strong> Su registro no se ha podido guardar .
                            </div>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col col-md-4">
                            <label for="FechaTranferencia">Fecha Transferencia:</label>
                            <div class="input-group date" data-provide="datepicker">
                                <input id="ftransferencia" type="text" class="form-control" runat="server" />
                                <%--<asp:TextBox ID="ftransferencia" runat="server" class="form-control" ></asp:TextBox>--%>
                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                            </div>
                        </div>

                    </div>
                    <br />

                    <div class="row">
                        <div class="col-md-4">
                            <div class="panel panel-warning">
                                <div class="panel-heading">DATOS DE ORIGEN (DR)</div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="panel panel-warning">
                                <div class="panel-heading">DATOS DE DESTINO (CR)</div>
                            </div>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col col-md-4">
                            <label for="CboCompanyOrigen">Compañia:</label>
                            <asp:DropDownList ID="CboCompanyOrigen" CssClass="form-control col-md-4"
                                runat="server" DataSourceID="ObjectDataSource1" DataTextField="Company"
                                DataValueField="Idcompany" AutoPostBack="True">
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"
                                SelectMethod="GetListaCompanies" TypeName="Proyecto_STI.ClsBusiness"></asp:ObjectDataSource>
                        </div>
                        <div class="col col-md-4">
                            <label for="CboCompanyDestino">Compañia:</label>
                            <asp:DropDownList ID="CboCompanyDestino" CssClass="form-control col-md-4"
                                runat="server" DataSourceID="ObjectDataSource4" DataTextField="Company"
                                DataValueField="Idcompany" AutoPostBack="True">
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="ObjectDataSource4" runat="server"
                                SelectMethod="GetListaCompanies" TypeName="Proyecto_STI.ClsBusiness"></asp:ObjectDataSource>
                        </div>
                         
                    </div>
                    <div class="row">
                        <div class="col col-md-4">
                            <label for="CboCategoriaOrigen">Categoría:</label>
                            <asp:DropDownList ID="CboCategoriaOrigen" CssClass="form-control col-md-4"
                                runat="server" DataSourceID="ObjectDataSource2" DataTextField="Categoria"
                                DataValueField="Idcategoria" AutoPostBack="True">
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server"
                                SelectMethod="GetListaCategorias" TypeName="Proyecto_STI.ClsBusiness"></asp:ObjectDataSource>
                        </div>
                        <div class="col col-md-4">
                            <label for="CboCategoriaDestino">Categoría:</label>
                            <asp:DropDownList ID="CboCategoriaDestino" CssClass="form-control col-md-4"
                                runat="server" DataSourceID="ObjectDataSource5" DataTextField="Categoria"
                                DataValueField="Idcategoria" AutoPostBack="True">
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="ObjectDataSource5" runat="server"
                                SelectMethod="GetListaCategorias" TypeName="Proyecto_STI.ClsBusiness"></asp:ObjectDataSource>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col col-md-4">
                            <label for="CboCuentaOrigen">Cuenta:</label>
                            <asp:DropDownList ID="CboCuentaOrigen" CssClass="form-control col-md-4"
                                runat="server" DataSourceID="ObjectDataSource3" DataTextField="CuentaDescripcion"
                                DataValueField="IdCuenta" AutoPostBack="True">
                            </asp:DropDownList>
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
                                DataValueField="IdCuenta" AutoPostBack="True">
                            </asp:DropDownList>
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
                            <asp:TextBox ID="txtDescripcion" runat="server" class="form-control" Text="" MaxLength="255" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col col-md-2">
                            <label for="txtMonto">Monto a Tranferir:</label>
                            <asp:TextBox ID="txtMonto" runat="server" class="form-control" Text="0.00" Style="text-align: right"></asp:TextBox>
                        </div>
                    </div>

                    <br />

                    <div class="row" style="height: 50px;">
                        <div class="col col-md-1">
                            <button type="button" id="btTransferir" data-toggle="modal" data-target="#confirmTranferir" class="btn btn-primary">Transferir</button>

                        </div>

                    </div>
                    <div class="row">

                        <div class="col-md-12">
                            <div class="panel panel-warning">
                                <div class="panel-heading">Si desea realizar transacciones en masivo seleccione el archivo en Excel con los datos ya cargados y Presiones el Boton [Cargar Transferencias]</div>
                            </div>
                        </div>
                          
                        <div class="col col-lg-4" style="height: 34px; width: 167px;">
                            <asp:Button ID="btndownload" runat="server" Text="Descargar template" class="btn btn-primary" OnClick="Btndownload_Click" />
                              
                        </div>
                        <div class="col col-lg-3" >
                            <asp:FileUpload ID="FileUpload1" runat="server" Style="padding-top: 6px;" class="btn btn-default" />

                        </div>
                        <div class="col col-lg-4"  >
                            <asp:Button ID="btncargar" runat="server" Text="Cargar Transferencias" class="btn btn-success" OnClick="BtnUpload_Click" />
                              
                        </div>
                          
                    </div>
                     <br />
                    <div class="row">
                        <div class="col-md-12">
                            <div  class="panel panel-info">
                                <div class="panel-heading">Una vez haya cargado el excel, Hacer click en el boton [Actualizar Datos]</div>
                            </div>
                        </div>
                           
                        <div class="col col-lg-10"   id="wrapper">
                            <asp:Button ID="Button3" runat="server" Text="ACTUALIZAR DATOS" class="btn btn-warning" OnClick="Updatedata_Click" />
                             
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
                     <br />
                    <div class="row" style="height: 50px;">
                        <div class="row">
                            <div class="col-md-12">
                                <div id="Div1" runat="server" class="alert alert-success alert-dismissible" role="alert" visible="false" style="padding-top: 16px; border-top-width: 10px;">
                                    <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                    <strong>Carga Realizada!</strong> Los registros han sido guardado correctamente.
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
                            <asp:Button ID="Condirmado" runat="server" Text="Sí" class="btn btn-primary" OnClick="Condirmado_Click" />
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
                $("#btTransferir").mouseover(function () {
                     
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

 

        $(document).ready(function () {
            $("#Button3").click(function () {
                $("#lblEspere").text("Espere un momento...");
                setTimeout(EjcutarSync, 1600);
            });

             
        });


    </script>
    </form>
</body>
</html>
