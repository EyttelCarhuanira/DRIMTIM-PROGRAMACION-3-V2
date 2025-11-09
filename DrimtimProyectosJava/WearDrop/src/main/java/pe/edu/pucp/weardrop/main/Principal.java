/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.pucp.weardrop.main;

import java.sql.Connection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import pe.edu.pucp.weardrop.almacen.Almacen;
import pe.edu.pucp.weardrop.almacen.Lote;
import pe.edu.pucp.weardrop.almacen.MovimientoAlmacen;
import pe.edu.pucp.weardrop.almacen.MovimientoAlmacen_X_Lote;
import pe.edu.pucp.weardrop.almacen.TipoMovimiento;
import pe.edu.pucp.weardrop.almacen.bo.AlmacenBOImpl;
import pe.edu.pucp.weardrop.almacen.bo.LoteBOImpl;
import pe.edu.pucp.weardrop.almacen.bo.MovimientoAlmacenBOImpl;
import pe.edu.pucp.weardrop.almacen.bo.MovimientoAlmacen_X_Lote_BOImpl;
import pe.edu.pucp.weardrop.almacen.boi.AlmacenBOI;
import pe.edu.pucp.weardrop.almacen.boi.LoteBOI;
import pe.edu.pucp.weardrop.almacen.boi.MovimientoAlmacenBOI;
import pe.edu.pucp.weardrop.almacen.boi.MovimientoAlmacen_X_Lote_BOI;
import pe.edu.pucp.weardrop.almacen.dao.AlmacenDAO;
import pe.edu.pucp.weardrop.almacen.dao.MovimientoAlmacenDAO;
import pe.edu.pucp.weardrop.almacen.mysql.AlmacenImpl;
import pe.edu.pucp.weardrop.almacen.mysql.MovimientoAlmacenImpl;
import pe.edu.pucp.weardrop.clasificacionropa.Vigencia;
import pe.edu.pucp.weardrop.comprastienda.CondicionPago;


import pe.edu.pucp.weardrop.comprastienda.Proveedor;
import pe.edu.pucp.weardrop.comprastienda.dao.ProveedorDAO;
import pe.edu.pucp.weardrop.comprastienda.mysql.ProveedorImpl;

import pe.edu.pucp.weardrop.personal.Cargo;
import pe.edu.pucp.weardrop.personal.CuentaUsuario;
import pe.edu.pucp.weardrop.personal.Empleado;
import pe.edu.pucp.weardrop.personal.Persona;
import pe.edu.pucp.weardrop.personal.TipoCuenta;
import pe.edu.pucp.weardrop.personal.bo.CuentaUsuarioBOImpl;
import pe.edu.pucp.weardrop.personal.bo.EmpleadoBOImpl;
import pe.edu.pucp.weardrop.personal.boi.CuentaUsuarioBOI;
import pe.edu.pucp.weardrop.personal.dao.CargoDAO;
import pe.edu.pucp.weardrop.personal.dao.CuentaUsuarioDAO;
import pe.edu.pucp.weardrop.personal.dao.EmpleadoDAO;
import pe.edu.pucp.weardrop.personal.dao.TipoCuentaDAO;
import pe.edu.pucp.weardrop.personal.mysql.CargoImpl;
import pe.edu.pucp.weardrop.personal.mysql.CuentaUsuarioImpl;
import pe.edu.pucp.weardrop.personal.mysql.EmpleadoImpl;
import pe.edu.pucp.weardrop.personal.mysql.TipoCuentaImpl;
import pe.edu.pucp.weardrop.prendas.Casaca;
import pe.edu.pucp.weardrop.prendas.Falda;

import pe.edu.pucp.weardrop.prendas.Material;
import pe.edu.pucp.weardrop.prendas.Polo;
import pe.edu.pucp.weardrop.prendas.Prenda;
import pe.edu.pucp.weardrop.prendas.TipoCasaca;
import pe.edu.pucp.weardrop.prendas.TipoCuello;
import pe.edu.pucp.weardrop.prendas.TipoFalda;
import pe.edu.pucp.weardrop.prendas.TipoManga;
import pe.edu.pucp.weardrop.prendas.dao.CasacaDAO;
import pe.edu.pucp.weardrop.prendas.dao.FaldaDAO;
import pe.edu.pucp.weardrop.prendas.dao.PoloDAO;
import pe.edu.pucp.weardrop.prendas.mysql.CasacaImpl;
import pe.edu.pucp.weardrop.prendas.mysql.FaldaImpl;
import pe.edu.pucp.weardrop.prendas.mysql.PoloImpl;

//import pe.edu.pucp.weardrop.config.DBManager;
import pe.edu.pucp.weardrop.tienda.Tienda;
import pe.edu.pucp.weardrop.ventas.Cliente;
import pe.edu.pucp.weardrop.ventas.TipoDeCliente;
import pe.edu.pucp.weardrop.ventas.dao.ClienteDAO;
import pe.edu.pucp.weardrop.ventas.mysql.ClienteImpl;

import pe.edu.pucp.weardrop.promocion.dao.PromocionComboDAO;
import pe.edu.pucp.weardrop.promocion.dao.PromocionConjuntoDAO;
import pe.edu.pucp.weardrop.promocion.mysql.PromocionComboImpl;
import pe.edu.pucp.weardrop.promocion.mysql.PromocionConjuntoImpl;
import pe.edu.pucp.weardrop.promocionesdescuentos.PromocionCombo;
import pe.edu.pucp.weardrop.promocionesdescuentos.PromocionConjunto;
//import pe.edu.pucp.weardrop.config.DBManager;
import pe.edu.pucp.weardrop.tienda.Tienda;

/**
 *
 * @author Leonardo T
 */
public class Principal {
    public static void main(String[] args) throws ParseException, Exception{
 
//        Tienda tienda=new Tienda(1, "WearDrop", "Pasillo 1");
//        
//        SOLO EXISTIRÁ UNA TIENDA


        
//        Tienda tienda=new Tienda(1, "WearDrop", "Pasillo 1");
//
//SOLO EXISTIRÁ UNA TIENDA
          //COMPROBAACION DEL CRUD PARA LA CLASE Almacen
            //EN EL TEST EN EL PROYECTO DA.
            
          //COMPROBACIÓN DEL CRUD PARA LA CLASE MovimientoAlmacen
//        System.out.println("Movimiento Almacen: ");
//        SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
//        MovimientoAlmacen mov1=new MovimientoAlmacen(4, sdf.parse("19-06-2006"), "Almacen K8", "Almacen K9", TipoMovimiento.Mov_Interno);
//        MovimientoAlmacen mov2=new MovimientoAlmacen(1, sdf.parse("20-07-2006"), "Almacen K9", "Almacen K8", TipoMovimiento.Mov_Interno);
////        
//        MovimientoAlmacenDAO daoMovAlmacen=new MovimientoAlmacenImpl();
//        daoMovAlmacen.insertar(mov1);
//        daoMovAlmacen.insertar(mov2);
//        mov1.setIdAlmacen(3);
//        mov1.setIdMovimiento(1);
//        daoMovAlmacen.modificar(mov1);
////        
//        daoMovAlmacen.eliminar(1);
//        
//        MovimientoAlmacen mov3=daoMovAlmacen.obtenerPorId(1);
//        mov3.mostrarMovAlmacen();
//        ArrayList<MovimientoAlmacen> listaMov=daoMovAlmacen.listarTodos();
//        for(MovimientoAlmacen datMov: listaMov){
//            datMov.mostrarMovAlmacen();
//            System.out.println();
//        }



// Prueba Proveedor
//        /*
//        Proveedor pruebaProve  = new Proveedor(1, 20503644968L,
//            "Naomi", 986368555, 
//            "Av. Simón Bolívar 1515, Pueblo Libre, Lima"
//                , true,
//            new ArrayList<>());
//        */
//        ProveedorDAO mysqlPrubea = new ProveedorImpl();
//        
//        mysqlPrubea.eliminar(1);
//        
//       
//        pruebaProve.setTelefono(986268588);
//        mysqlPrubea.modificar(pruebaProve);
//        Proveedor pruebaBusqueda = mysqlPrubea.obtenerPorId(1);
//        System.out.println(pruebaBusqueda.getNombre());
//        for(Proveedor prob : mysqlPrubea.listarTodos()){
//            System.out.println(prob.getNombre());
//        }


// Prueba Polo
//        Polo pruebaPolo = new Polo(0, "Polo piqué básico", 0, 29.90, 25.00, 280.00, 10, TipoManga.MangaCorta, "Liso", TipoCuello.Redondo, "Blanco", Material.Algodon, true);
//
//        PoloDAO mysqlPolo = new PoloImpl();
//        
//        mysqlPolo.insertar(pruebaPolo);
//        pruebaPolo.setColor("Amarillo");
//        pruebaPolo.setEstampado("Pokemon - Pikachu");
//        pruebaPolo.setTipoManga(TipoManga.MangaLarga);
//        mysqlPolo.modificar(pruebaPolo);
//        
//        Polo busquedaPrueba = mysqlPolo.obtenerPorId(1);
//        System.out.println(busquedaPrueba.getNombre());
//        for(Polo prob : mysqlPolo.listarTodos()){
//              System.out.println(prob.getNombre());
//        }


// Prueba Falda

//        Falda pruebaFalda = new Falda(0, "Falda plisada midi", 0, 59.90, 49.00, 540.00, 8, TipoFalda.Plisada, 70.0, true, false, "Negro", Material.Poliester, true);
//
//        FaldaDAO mysqlFalda = new FaldaImpl();
//
//        mysqlFalda.insertar(pruebaFalda);
//
//        // Modificaciones de prueba
//        pruebaFalda.setColor("Granate");
//        pruebaFalda.setLargo(75.0);                    
//        pruebaFalda.setConVolantes(true);
//        pruebaFalda.setTipoFalda(TipoFalda.Midi);
//
//        mysqlFalda.modificar(pruebaFalda);
//
//        // Búsqueda y listado
//        Falda busquedaPruebaFalda = mysqlFalda.obtenerPorId(1);
//        System.out.println(busquedaPruebaFalda.getNombre());
//
//        for (Falda f : mysqlFalda.listarTodos()) {
//            System.out.println(f.getNombre());
//        }



//       
//        System.out.println("Fin de codigo");

       
//Prueba CRUD Cargo
//        Cargo carg = new Cargo();
//        CargoDAO mysqlCargo = new CargoImpl();
        
//        carg.setAbreviatura('A');
//        carg.setDescripcion("Administrador");
//        mysqlCargo.insertar(carg);
        
//        carg.setIdCargo(2);
//        carg.setAbreviatura('L');
//        carg.setDescripcion("LUCHADOR");
//        carg.setActivo(true);
//        mysqlCargo.modificar(carg);
        
//        mysqlCargo.eliminar(2);

//        carg = mysqlCargo.obtenerPorId(3);
//        System.out.println(carg.getAbreviatura()+ " " + carg.getDescripcion() +
//                " " + carg.isActivo());
        
//        ArrayList<Cargo> listCargo = mysqlCargo.listarTodos();
//        for(Cargo car : listCargo){
//            System.out.println(car.getAbreviatura()+ " " + car.getDescripcion() +
//                " " + car.isActivo());
//        }

//        System.out.println("Fin de codigo");
       
            //Prueba Boleta Insertar
//         Boleta boleta = new Boleta();
//         boleta.setDNI("29202022");
//         SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
//         try{
//             boleta.setFecha(sdf.parse("2025-28-09"));
//         }catch(ParseException ex){
//             System.out.println("EEROR DE CONVERSION DE FECHA "+ ex.getMessage());
//         }
//         boleta.setIGV(0.18);
//         boleta.setCorrelativo("ES123");
//         boleta.setTotal(1200.00);
//         boleta.setMetodoDePago("Tarjeta");
//         
//         BoletaDAO daoBoleta = new BoletaImpl();
//         daoBoleta.insertar(boleta);
         
 //Prueba Boleta Insertar
//           BoletaDAO daoBoleta = new BoletaImpl();
//           
//           Boleta boleta = daoBoleta.obtenerPorId(1);
//                
//           
//           System.out.println();
//        

//       
//        System.out.println("Fin de codigo");
//        
//            SimpleDateFormat sdf= new SimpleDateFormat("dd-MM-yyyy");
////            
//            Vigencia vigen=new Vigencia(1,sdf.parse("19-07-1444"),sdf.parse("19-06-1232"));
//           PromocionComboDAO mysqlPromocion = new PromocionComboImpl();
//           PromocionCombo promCombo=new PromocionCombo(1,"Promocion Hola",true,true,3,3,vigen);
//           PromocionComboDAO promComboDao=new PromocionComboImpl();
//           promComboDao.insertar(promCombo);
//           promCombo.setNombre("PROM REAL V2");
//           promComboDao.modificar(promCombo);
//           PromocionCombo prom2=promComboDao.obtenerPorId(1);
//           System.out.println(prom2.getCantidadGratis());
//           
//          for (PromocionCombo f : promComboDao.listarTodos()) {
//            System.out.println(f.getCantidadGratis());
//        }
//           Vigencia vigen2=new Vigencia(2,sdf.parse("20-07-1444"),sdf.parse("31-06-1232"));
//           PromocionConjunto promConjunto2=new PromocionConjunto(2,"Promocion Holabroooo",true,true,10,vigen2);
//           PromocionConjuntoDAO promConjuntoDao=new PromocionConjuntoImpl();
//           
//           promConjuntoDao.insertar(promConjunto2);
//            promConjunto2.setNombre("NOES LO Q PIENSAS");
//            promConjuntoDao.modificar(promConjunto2);
//            PromocionConjunto prom1=promConjuntoDao.obtenerPorId(2);
//           System.out.println(prom1.getPorcentajePromocion());
//             System.out.println(promConjunto2.getPorcentajePromocion());
//             for (PromocionConjunto f : promConjuntoDao.listarTodos()) {
//            System.out.println(f.getIdPromocion());
//        }
        //Ejemplo de fallo 
//        Almacen datAlmacen=new Almacen();
//        datAlmacen.setIdTienda(0);
//        datAlmacen.setStock(0);
//        AlmacenBOI almacenBO=new AlmacenBOImpl();
//        almacenBO.insertar(datAlmacen);
        
//        MovimientoAlmacen datMov=new MovimientoAlmacen();
//        MovimientoAlmacenBOI movBO=new MovimientoAlmacenBOImpl();
//        movBO.insertar(datMov);
        
        //Sale el error de Almacen que es null xq no hay nada en datAlmacen
//        Lote datLote=new Lote();
//        LoteBOI loteBO=new LoteBOImpl();
//        loteBO.insertar(datLote);
    }
}
