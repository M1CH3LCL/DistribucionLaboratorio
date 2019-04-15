﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Controlador
{
    public partial class FrmPadre : Form
    {
        #region atributos
        cDocente aDocente = new cDocente();
        cUsuario aUsuario = new cUsuario();
        #endregion atributos
        public FrmPadre()
        {
            InitializeComponent();
        }

        public cDocente ADocente { get => aDocente; set => aDocente = value; }
        public cUsuario AUsuario { get => aUsuario; set => aUsuario = value; }
    }
}