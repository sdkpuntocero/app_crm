<%@ Page Title="" Language="C#" MasterPageFile="~/sitio.Master" AutoEventWireup="true" CodeBehind="acceso.aspx.cs" Inherits="app_crm.acceso" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:UpdatePanel ID="up_acceso" runat="server">
        <ContentTemplate>
            <div class="section">
                <div class="container">
                    <div class="col-md-12 text-center">
                        <!-- Login Form -->
                        <div class="nb-login">
                            <asp:Image CssClass="center-block img-responsive img-thumbnail" ID="Image1" runat="server" ImageUrl="~/img/img_std.png" Width="128" Height="128" />
                            <br />
                            <h5 class="scenter">Control de Acceso</h5>
                            <div class="form-group text-left">
                                <h5>
                                    <label class="control-label">*Usuario</label>

                                </h5>
                                <input class="form-control input-box" type="text" id="usuario" runat="server" placeholder="Capturar Usuario" required />

                            </div>
                            <div class="form-group text-left">
                                <h5>
                                    <label class="control-label">*Contraseña</label>

                                </h5>
                                <input class="form-control input-box" type="password" id="clave" runat="server" placeholder="Capturar Usuario" required />

                            </div>
                            <div class="form-group">
                                <h5>
                                    <asp:LinkButton CssClass="text-left fuente_css01" ID="lkb_registro" runat="server" Visible="false" Text="Registrar" OnClick="lkb_registro_Click"></asp:LinkButton>
                                </h5>
                            </div>
                            <asp:Button CssClass="btn btn-block fuente_css02" ID="lbtn_acceso" runat="server" Text="Entrar" TabIndex="3" OnClick="lbtn_acceso_Click" />
                            <%-- <div class="center or">OR</div>
					<h3 class="center">Sign In Using</h3>
					<div class="social">
						<a href="#" class="facebook"><i class="fa fa-facebook"></i>&nbsp; Login with Facebook</a>
						<a href="#" class="twitter"><i class="fa fa-twitter"></i>&nbsp; Login with Twitter</a>
						<a href="#" class="google-plus"><i class="fa fa-google-plus"></i>&nbsp; Login with Google Plus</a>
					</div>--%>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <!-- Bootstrap Modal Dialog -->
    <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">
                                <asp:Label CssClass="fuente_css02" ID="lblModalTitle" runat="server" Text=""></asp:Label></h4>
                        </div>
                        <div class="modal-body">
                            <asp:Label CssClass="fuente_css02" ID="lblModalBody" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="modal-footer">
                            <button class="btn fuente_css02" data-dismiss="modal" aria-hidden="true">Ok</button>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
