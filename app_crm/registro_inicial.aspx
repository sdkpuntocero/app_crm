<%@ Page Title="" Language="C#" MasterPageFile="~/sitio.Master" AutoEventWireup="true" CodeBehind="registro_inicial.aspx.cs" Inherits="app_crm.registro_inicial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="section">
        <div class="container">
            <div class="form-group">
                <div class="row">
                    <br />
                    <div class="panel panel-default" id="pnl_empresa" runat="server" visible="true">
                        <div class="panel-heading">
                            <h3 class="text-center fuente_css02">Registro de Empresa</h3>
                        </div>
                        <div class="panel-body">
                            <div class="row">

                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <div class="col-lg-4">
                                            <asp:Image CssClass="center-block img-responsive img-thumbnail" ID="img_empresa" runat="server" ImageUrl="~/img/img_std.png" Width="128" Height="128" />
                                            <br />
                                            <asp:FileUpload CssClass="form-control" ID="FileUpload1" runat="server" />
                                            <br />
                                            <div class="form-group text-right">
                                                <asp:Button CssClass="btn btn-info" ID="btn_cargar_img" runat="server" Text="Subir" OnClick="btn_cargar_img_Click" />
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:PostBackTrigger ControlID="btn_cargar_img" />
                                    </Triggers>
                                </asp:UpdatePanel>

                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <div class="col-lg-4">
                                            <div class="form-group text-left">
                                                <h5>
                                                    <label class="control-label fuente_css02">*Nombre de Empresa</label>
                                                </h5>
                                                <input class="form-control" type="text" id="nombre_empresa" runat="server" placeholder="letras y números" required background-color="gray" />
                                                <h5>
                                                    <label class="control-label fuente_css02">Teléfono</label>
                                                </h5>
                                                <input class="form-control" type="tel" id="telefono_empresa" runat="server" placeholder="(000) 000-00000000" pattern="\([0-9]{3}\)[ ][0-9]{3}[-][0-9]{8}" title="Un número de teléfono válido consiste en un código de lada de 3 dígitos entre paréntesis, un espacio,un código de área de 3 dígitos. un guión (-) y el número telefónico con valores del 0 al 9" />
                                                <br />
                                                <h5>
                                                    <label class="control-label fuente_css02">Correo electrónico</label>
                                                </h5>
                                                
                                                <input class="form-control" type="email" id="email_empresa" runat="server" placeholder="xxxx@xxxx.xxx" />
                                                <h5>
                                                    <label class="control-label fuente_css02">*Calle ý número</label>
                                                </h5>
                                                <input class="form-control" type="text" id="callenum_empresa" runat="server" placeholder="letras y números" required />
                                            </div>

                                        </div>
                                        <div class="col-lg-4 text-left">
                                            <h5>
                                                <label class="control-label fuente_css02">*Código Postal</label>
                                            </h5>
                                            <div class="input-group">

                                                <input type="text" class="form-control fuente_css02" placeholder="5 números (0-9)" id="codigo_cp" runat="server" required pattern="[0-9]{5}" title="Un código postal valido consiste en 5 numeros con valores del 0-9">

                                                <span class="input-group-btn">
                                                    <asp:Button CssClass="btn btn-info" ID="btn_cp" runat="server" Text="validar" OnClick="btn_cp_Click" />
                                                </span>
                                            </div>
                                            <h5>
                                                <label class="control-label fuente_css02">*Colonia</label>
                                            </h5>
                                            <asp:DropDownList CssClass="form-control" ID="ddl_colonia_empresa" runat="server" ></asp:DropDownList>
                                            <div class="text-right">
                                                <asp:RequiredFieldValidator ID="rfv_colonia_empresa" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="ddl_colonia_empresa" InitialValue="0" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                            </div>
                                            <h5>
                                                <label class="control-label fuente_css02">Municipio</label>
                                            </h5>
                                            <input class="form-control" type="text" id="municipio_empresa" runat="server" placeholder="Muestra Municipio" disabled />
                                            <h5>
                                                <label class="control-label fuente_css02">Estado</label>
                                            </h5>
                                            <input class="form-control" type="text" id="estado_empresa" runat="server" placeholder="Muestra Estado" disabled/>
                                            <br />
                                           <div class="form-group text-right">
                                            
                                                <label class="control-label fuente_css02">Guardar para agregar administrador</label>
                                            
                                                <asp:Button CssClass="btn btn-info text-right" ID="btn_guardar_admin" runat="server" Text="Ir" OnClick="btn_guardar_admin_Click" />
                                            </div>
                                            
                                        </div>
                                        <%--        <div class="col-lg-3">
                                            <div class="form-group text-left">
                                                <h5>
                                                    <label class="control-label">*Nombre(s)</label>
                                                </h5>
                                                <input class="form-control" type="text" id="nombres_admin" runat="server" placeholder="Captura Nombre(s)" required />
                                            </div>
                                            <div class="form-group text-left">
                                                <h5>
                                                    <label class="control-label">Apellido Paterno</label>
                                                </h5>
                                                <input class="form-control" type="text" id="apaterno_admin" runat="server" placeholder="Captura Apellido Paterno" />
                                            </div>
                                            <div class="form-group text-left">
                                                <h5>
                                                    <label class="control-label">Apellido Materno</label>
                                                </h5>
                                                <input class="form-control" type="text" id="amaterno_admin" runat="server" placeholder="Captura Apellido Materno" />
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <div class="form-group text-left">
                                                <h5>
                                                    <label class="control-label">*Usuario</label>
                                                </h5>
                                                <input class="form-control" type="text" id="usuario_admin" runat="server" placeholder="Captura Usuario" />
                                            </div>
                                            <div class="form-group text-left">
                                                <h5>
                                                    <label class="control-label">*Contraseña</label>
                                                </h5>
                                                <input class="form-control" type="text" id="clave_admin" runat="server" placeholder="Captura Contraseña" />
                                            </div>
                                            <div class="text-right">
                                                <br />
                                                <asp:Button CssClass="btn" ID="btn_salir_admin" runat="server" Text="Salir" OnClick="btn_salir_admin_Click" />
                                     
                                            </div>
                                        </div>--%>
                                    </ContentTemplate>
                                </asp:UpdatePanel>



                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="window.location.href='/acceso.aspx'">x</button>
                            <h4 class="modal-title">

                                <asp:Label ID="lblModalTitle" CssClass="fuente_css02" runat="server" Text=""></asp:Label>
                            </h4>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="lblModalBody" CssClass="fuente_css02" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="modal-footer">
                            <button class="btn" data-dismiss="modal" aria-hidden="true" onclick="window.location.href='/acceso.aspx'">Ok </button>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
