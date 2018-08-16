using System;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace app_crm
{
    public partial class registro_inicial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    load_ddl();
                }
                else
                {
                }
            }
            catch
            {
                Response.Redirect("acceso.aspx");
            }
        }

        private void load_ddl()
        {
            ddl_colonia_empresa.Items.Insert(0, new ListItem("Seleccionar", "0"));
        }

        private void guarda_registro()
        {
            Guid guid_nempresa = Guid.NewGuid();
            string str_rs = nombre_empresa.Value.ToUpper();
            string str_telefono = telefono_empresa.Value;
            string str_email = email_empresa.Value;
            string str_callenum = callenum_empresa.Value.ToUpper();
            string str_cp = codigo_cp.Value;
            int int_colony = Convert.ToInt32(ddl_colonia_empresa.SelectedValue);
            int int_idcodigocp = 0;
            Guid guid_nusuario = Guid.NewGuid();

            //string str_nombres = nombres_admin.Value.ToUpper();
            //string str_apaterno = apaterno_admin.Value.ToUpper();
            //string str_amaterno = amaterno_admin.Value.ToUpper();
            //string str_usuairo = usuario_admin.Value;
            //string str_password = encriptar.Encrypt(clave_admin.Value);

            using (db_crmEntities db_sepomex = new db_crmEntities())
            {
                var tbl_sepomex = (from c in db_sepomex.dd_sepomex
                                   where c.d_codigo == str_cp
                                   where c.id_asenta_cpcons == int_colony
                                   select c).ToList();

                int_idcodigocp = tbl_sepomex[0].id_codigo;
            }

            using (var m_empresa = new db_crmEntities())
            {
                var i_empresa = new dd_empresa

                {
                    empresaID = guid_nempresa,
                    estatusID = 1,
                    nombre = str_rs,
                    telefono = str_telefono,
                    email = str_email,
                    callenum = str_callenum,
                    id_codigo = int_idcodigocp,
                    fecha_registro = DateTime.Now,
                };

                m_empresa.dd_empresa.Add(i_empresa);
                m_empresa.SaveChanges();
            }

            //using (var m_usuario = new db_crmEntities())
            //{
            //    var i_usuario = new dd_usuarios
            //    {
            //        usuarioID = guid_nusuario,
            //        estatusID = 1,
            //        tipo_usuarioID = 2,
            //        nombres = str_nombres,
            //        a_paterno = str_apaterno,
            //        a_materno = str_amaterno,
            //        codigo_usuarios = str_usuairo,
            //        clave = str_password,
            //        fecha_registro = DateTime.Now,
            //        empresaID = guid_nempresa
            //    };
            //    m_usuario.dd_usuarios.Add(i_usuario);
            //    m_usuario.SaveChanges();
            //}

            limpiar_textbox();
            Mensaje("Datos de Empresa y Administrador agregados con éxito.");
        }

        private void limpiar_textbox()
        {
            ddl_colonia_empresa.Items.Insert(0, new ListItem("Seleccionar", "0"));

            nombre_empresa.Value = null;
            telefono_empresa.Value = null;
            email_empresa.Value = null;
            callenum_empresa.Value = null;
            codigo_cp.Value = null;

            municipio_empresa.Value = null;
            estado_empresa.Value = null;

            //nombres_admin.Value = null;
            //apaterno_admin.Value = null;
            //amaterno_admin.Value = null;

            //usuario_admin.Value = null;
            //clave_admin.Value = null;
        }

        private string RemoveSpecialCharacters(string str)
        {
            return Regex.Replace(str, @"[^0-9A-Za-z]", "", RegexOptions.None);
        }

        public static string RemoveAccentsWithRegEx(string inputString)
        {
            Regex replace_a_Accents = new Regex("[á|à|ä|â]", RegexOptions.Compiled);
            Regex replace_e_Accents = new Regex("[é|è|ë|ê]", RegexOptions.Compiled);
            Regex replace_i_Accents = new Regex("[í|ì|ï|î]", RegexOptions.Compiled);
            Regex replace_o_Accents = new Regex("[ó|ò|ö|ô]", RegexOptions.Compiled);
            Regex replace_u_Accents = new Regex("[ú|ù|ü|û]", RegexOptions.Compiled);
            inputString = replace_a_Accents.Replace(inputString, "a");
            inputString = replace_e_Accents.Replace(inputString, "e");
            inputString = replace_i_Accents.Replace(inputString, "i");
            inputString = replace_o_Accents.Replace(inputString, "o");
            inputString = replace_u_Accents.Replace(inputString, "u");
            return inputString;
        }

        //private void genera_usuario()
        //{
        //    try
        //    {
        //        string str_nombres = RemoveSpecialCharacters(RemoveAccentsWithRegEx(nombres_admin.Value.ToLower()));
        //        string[] separados;

        //        separados = str_nombres.Split(" ".ToCharArray());

        //        string str_apaterno = RemoveSpecialCharacters(RemoveAccentsWithRegEx(apaterno_admin.Value.ToLower()));
        //        string str_amaterno = RemoveSpecialCharacters(RemoveAccentsWithRegEx(amaterno_admin.Value.ToLower()));

        //        string codigo_usuario = str_nombres + "_" + left_right_mid.left(str_apaterno, 2) + left_right_mid.left(str_amaterno, 2);
        //        usuario_admin.Value = codigo_usuario;
        //    }
        //    catch
        //    {
        //        Mensaje("Se requiere minimo 2 letras por cada campo(nombre,apellido paterno, apellido materno) para generar el usuario.");
        //    }
        //}

        protected void btn_salir_admin_Click(object sender, EventArgs e)
        {
            Response.Redirect("acceso.aspx");
        }

        protected void btn_guardar_admin_Click(object sender, EventArgs e)
        {
            guarda_registro();
        }

        private void Mensaje(string contenido)
        {
            lblModalTitle.Text = "CRM";
            lblModalBody.Text = contenido;
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
            upModal.Update();
        }

        private void datos_sepomex(string str_codigo)
        {
            using (db_crmEntities db_sepomex = new db_crmEntities())
            {
                var tbl_sepomex = (from c in db_sepomex.dd_sepomex
                                   where c.d_codigo == str_codigo
                                   select c).ToList();

                ddl_colonia_empresa.DataSource = tbl_sepomex;
                ddl_colonia_empresa.DataTextField = "d_asenta";
                ddl_colonia_empresa.DataValueField = "id_asenta_cpcons";
                ddl_colonia_empresa.DataBind();

                if (tbl_sepomex.Count == 1)
                {
                    municipio_empresa.Value = tbl_sepomex[0].d_mnpio;
                    estado_empresa.Value = tbl_sepomex[0].d_estado;
                    rfv_colonia_empresa.Enabled = true;

                    codigo_cp.Focus();
                }
                if (tbl_sepomex.Count > 1)
                {
                    ddl_colonia_empresa.Items.Insert(0, new ListItem("Seleccionar", "0"));

                    municipio_empresa.Value = tbl_sepomex[0].d_mnpio;
                    estado_empresa.Value = tbl_sepomex[0].d_estado;
                    rfv_colonia_empresa.Enabled = true;

                    codigo_cp.Focus();
                }
                else if (tbl_sepomex.Count == 0)
                {
                    ddl_colonia_empresa.Items.Clear();
                    ddl_colonia_empresa.Items.Insert(0, new ListItem("Seleccionar", "0"));
                    municipio_empresa.Value = null;
                    estado_empresa.Value = null;
                    rfv_colonia_empresa.Enabled = false;

                    codigo_cp.Focus();
                }
            }
        }

        protected void btn_cp_Click(object sender, EventArgs e)
        {
            string cod_cp;
            cod_cp = codigo_cp.Value;

            datos_sepomex(cod_cp); ;
        }

        protected void btn_cargar_img_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                FileUpload1.SaveAs(MapPath("~/img/" + FileUpload1.FileName));
                System.Drawing.Image img1 = System.Drawing.Image.FromFile(MapPath("~/img/") + FileUpload1.FileName);
                img_empresa.ImageUrl = "~/img/" + FileUpload1.FileName;
            }
        }
    }
}