/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package crudmvc;

import Controlador.ControladorVentaView;
import Modelo.ConsultasVenta;
import Modelo.Venta;
import Vista.VentaView;

/**
 *
 * @author Chris
 */
public class CRUDMVC {

    /**
     * @param args the command line arguments
     */

    public CRUDMVC()
    {
        Venta mod = new Venta();
        ConsultasVenta modC = new ConsultasVenta();
        VentaView frm = new VentaView();
                
        ControladorVentaView ctrl = new ControladorVentaView(mod, modC, frm);
        ctrl.iniciar();
        frm.setVisible(true);
    }
    
        public static void main(String args[]) {
            CRUDMVC nuevo = new CRUDMVC();
    }
}
