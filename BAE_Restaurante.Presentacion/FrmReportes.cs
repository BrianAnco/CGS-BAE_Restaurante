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
using BAE_Restaurante.Presentacion.Reportes;

using System.Windows.Forms.DataVisualization.Charting;
using System.Collections;
using System.IO;

namespace BAE_Restaurante.Presentacion
{
    public partial class FrmReportes : Form
    {
        public FrmReportes()
        {
            InitializeComponent();
        }

        private void btnVenta_Click(object sender, EventArgs e)
        {
            dgvReportes.DataSource = PedidoNegocios.ListarProductoMasVendido();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            dgvReportes.DataSource = PedidoNegocios.ListarComidaMasVendida();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            dgvReportes.DataSource = PedidoNegocios.ListarVentasTipoComida();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            dgvReportes.DataSource = PedidoNegocios.ListarMejoresClientes();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            //dgvReportes.DataSource = PedidoNegocios.BuscarPedidosFechas(fechaInicio.Value, fechaFin.Value);
            FrmFlujoCaja mv = new FrmFlujoCaja();
            mv.Show();
        }

        private void button4_Click_1(object sender, EventArgs e)
        {
            FrmPedidosFecha mv = new FrmPedidosFecha();
            mv.Show();
        }
    }
}
