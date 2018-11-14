package Controlador;

import Modelo.Conexion;
import Modelo.ConsultasVenta;
import Modelo.Venta;
import Vista.VentaView;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.swing.Icon;
import javax.swing.ImageIcon;
import static javax.swing.JInternalFrame.TITLE_PROPERTY;
import javax.swing.JOptionPane;

public class ControladorVentaView implements ActionListener {

    private Venta modelo;
    private ConsultasVenta modC;
    private VentaView frm;
    

    public ControladorVentaView(Venta mod, ConsultasVenta modC, VentaView frm) {
        this.modelo = mod;
        this.modC = modC;
        this.frm = frm;
        this.frm.btnGuardar.addActionListener(this);
        this.frm.btnModificar.addActionListener(this);
        this.frm.btnEliminar.addActionListener(this);
        this.frm.btnLimpiar.addActionListener(this);
        this.frm.btnBuscar.addActionListener(this);
    }

    public void iniciar() {
        frm.setTitle("Personas");
        frm.setLocationRelativeTo(null);
        frm.txtId.setVisible(false);
    }

    @Override
    public void actionPerformed(ActionEvent e) {

        if (e.getSource() == frm.btnGuardar) {
            modelo.setStatus(frm.txtStatus.getText());
            modelo.setFecha_venta(frm.txtFecha.getText());
            modelo.setId_cliente(Integer.parseInt(frm.txtCliente.getText()));
            modelo.setId_usuario(Integer.parseInt(frm.txtUsuario.getText()));
            modelo.setTotal(Integer.parseInt(frm.txtTotal.getText()));
            if(modC.registrar(modelo))
            {
                JOptionPane.showMessageDialog(null, "Registro Guardado");
                limpiar();
            } else {
                JOptionPane.showMessageDialog(null, "Error al Guardar");
                limpiar();
            }
        }
        
        if (e.getSource() == frm.btnModificar) {
            modelo.setId(Integer.parseInt(frm.txtId.getText()));
            modelo.setStatus(frm.txtStatus.getText());
            modelo.setFecha_venta(frm.txtFecha.getText());
            modelo.setId_cliente(Integer.parseInt(frm.txtFecha.getText()));
            modelo.setId_usuario(Integer.parseInt(frm.txtUsuario.getText()));
            modelo.setTotal(Integer.parseInt(frm.txtTotal.getText()));

            if(modC.modificar(modelo))
            {
                JOptionPane.showMessageDialog(null, "Registro Modificado");
                limpiar();
            } else {
                JOptionPane.showMessageDialog(null, "Error al Modificar");
                limpiar();
            }
        }
        
        if (e.getSource() == frm.btnEliminar) {
            modelo.setId(Integer.parseInt(frm.txtId.getText()));
            
            if(modC.eliminar(modelo))
            {
                JOptionPane.showMessageDialog(null, "Registro Eliminado");
                limpiar();
            } else {
                JOptionPane.showMessageDialog(null, "Error al Eliminar");
                limpiar();
            }
        }
        
        if (e.getSource() == frm.btnBuscar) {
            int idBusqueda = Integer.parseInt(JOptionPane.showInputDialog(null, "Ingresa Id"));
            modelo.setId(idBusqueda);
            if(modC.buscar(modelo))
            {
                frm.txtId.setText(String.valueOf(modelo.getId()));
                frm.txtStatus.setText(modelo.getStatus());
                frm.txtFecha.setText(modelo.getFecha_venta());
                frm.txtCliente.setText(String.valueOf(modelo.getId_cliente()));
                frm.txtUsuario.setText(String.valueOf(modelo.getId_usuario()));
                frm.txtTotal.setText(String.valueOf(modelo.getTotal()));
                frm.btnModificar.setEnabled(true);
                frm.btnLimpiar.setEnabled(true);

            } else {
                JOptionPane.showMessageDialog(null, "No se encontro registro");
                limpiar();
            }
        }
        
        if (e.getSource() == frm.btnLimpiar) {
            limpiar();
        }

    }
    
    public void limpiar()
    {
        frm.txtId.setText(null);
        frm.txtStatus.setText(null);
        frm.txtFecha.setText(null);
        frm.txtCliente.setText(null);
        frm.txtUsuario.setText(null);
        frm.txtTotal.setText(null);
        
        frm.btnGuardar.setEnabled(false);
        frm.btnModificar.setEnabled(false);
        frm.btnEliminar.setEnabled(false);
        frm.btnLimpiar.setEnabled(false);
    }

}
