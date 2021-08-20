using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BAE_Restaurante.Negocios;

namespace BAE_Restaurante.Presentacion
{
    public partial class FrmEmpresa : Form
    {
        public FrmEmpresa()
        {
            InitializeComponent();
        }

        private void FrmEmpresa_Load(object sender, EventArgs e)
        {
            this.ListarEmpresa();
        }

        private void ListarEmpresa()
        {
            try
            {
                dgvEmpresa.DataSource = EmpresaNegocios.Listar();
                txtNombre.Text = Convert.ToString(dgvEmpresa.Rows[0].Cells[1].Value);
                txtRuc.Text = Convert.ToString(dgvEmpresa.Rows[1].Cells[1].Value);
                txtTelefono.Text = Convert.ToString(dgvEmpresa.Rows[2].Cells[1].Value);
                txtCelular.Text = Convert.ToString(dgvEmpresa.Rows[3].Cells[1].Value);
                txtDireccion.Text = Convert.ToString(dgvEmpresa.Rows[4].Cells[1].Value);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message + ex.StackTrace);
            }
        }
    }
}
