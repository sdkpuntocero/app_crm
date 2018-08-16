using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace app_crm
{
    public partial class acceso : System.Web.UI.Page
    {
        private static Guid guid_idusuario;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                inf_user();

                //string clave = encriptar.Decrypt("2noLO5x80toGyzk8PXWoWA==");
            }
            else
            {
            }
        }


        private void inf_user()
        {
            try
            {
                if (valida_inicio() == true)
                {
             
                    lkb_registro.Visible = false;
                }
                else
                {
 
                    lkb_registro.Visible = true;
                    Mensaje(1);
                }
            }
            catch
            {
                Mensaje(2);
            }
        }

        protected void lkb_registro_Click(object sender, EventArgs e)
        {
            Response.Redirect("registro_inicial.aspx");
        }

        protected void lbtn_acceso_Click(object sender, EventArgs e)
        {
            string str_codigousuario, str_clave, str_valida_clave;
            int int_idtypeuser, int_iduserstatus;

            str_codigousuario = usuario.Value;
            str_clave = encriptar.Encrypt(clave.Value);

            try
            {
                using (db_crmEntities m_usuariof = new db_crmEntities())
                {
                    var i_usuariof = (from c in m_usuariof.dd_usuarios
                                      where c.codigo_usuarios == str_codigousuario
                                      select c).FirstOrDefault();

                    guid_idusuario = i_usuariof.usuarioID;
                    str_valida_clave = i_usuariof.clave;
                    int_idtypeuser = int.Parse(i_usuariof.tipo_usuarioID.ToString());
                    int_iduserstatus = int.Parse(i_usuariof.estatusID.ToString());

                    if (str_valida_clave == str_clave && int_iduserstatus == 1)
                    {
                        Session["ss_id_user"] = guid_idusuario;

                        Response.Redirect("panel.aspx");
                    }
                    else
                    {
                        Mensaje(3);
                    }
                }
            }
            catch
            {
                Mensaje(4);
            }
        }

        public bool valida_inicio()
        {
            int int_fusuarios;

            using (db_crmEntities edm_usuarios = new db_crmEntities())
            {
                var i_usuarios = (from c in edm_usuarios.dd_usuarios
                                  where c.tipo_usuarioID == 2
                                  select c).ToList();
                if (i_usuarios.Count == 0)
                {
                    int_fusuarios = 0;
                }
                else
                {
                    int_fusuarios = 1;
                }
            }



            if (int_fusuarios == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        private void Mensaje(int mensajeID)
        {

            string contenido;

            using (db_crmEntities edm_mensajes = new db_crmEntities())
            {
                var i_mensajes = (from c in edm_mensajes.fact_mensajes
                                  where c.mensajesID == mensajeID
                                  select c).FirstOrDefault();
                contenido = i_mensajes.desc_mensajes;
            }

            lblModalTitle.Text = "CRM";
            lblModalBody.Text = contenido;
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
            upModal.Update();
        }
    }
}