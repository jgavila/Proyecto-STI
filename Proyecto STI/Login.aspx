<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Proyecto_STI.Login" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sistema de Transferencia Intercompany</title>
    <meta name="viewport" content="width=device-width">   
    <link rel="stylesheet" href="css/templatemo_main.css">     
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    
</head>
<body>
    <div class="container">    
        <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
            <div class="panel panel-info" >
                    
                    <div>
                          <img class="img-responsive"" src="images/intercompany.jpg" />
                    </div>      
                
                    <div class="panel-heading">
                        <div class="panel-title" style="text-align:center">Sistema de Transferencia Intercompany</div>
                        
                    </div>     

                    <div style="padding-top:30px" class="panel-body" >

                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                            
                        <form id="loginform" class="form-horizontal" role="form" runat="server">
                                    
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                        <asp:TextBox ID="TxtMemberID"  class="form-control" name="username" value="" placeholder="Introduzca su usuario" runat="server"></asp:TextBox>
                                    </div>
                                
                               <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                        <asp:TextBox ID="TxtPws" class="form-control" name="password" placeholder="Introduzca su contraseña" runat="server" TextMode="Password"></asp:TextBox>
                               </div>
                                    

                                <div style="margin-top:10px" class="form-group">
                                    
                                    <div class="col-sm-12" >
                                        <asp:Label ID="lblMsg" runat="server" style="color: #CC0000; text-align: justify" Visible="False"></asp:Label>
                                    </div>
                                    <!-- Button -->

                                    <div class="col-sm-12 controls">
                                      <asp:Button ID="btAceptar" class="btn btn-success" runat="server" Text="Aceptar" OnClick="btAceptar_Click" />
                                      <asp:Button ID="btCancelar"  class="btn btn-primary" runat ="server" Text="Cancelar" />
                                   
                                    </div>
                                </div>

    
                            </form>     



                        </div>                     
                    </div>  
        </div>
 
    </div>
    <script src="js/bootstrap.min.js"></script>

</body>
</html>
