/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.pucp.weardrop.almacen;

import java.util.ArrayList;

/*@author Leonardo*/
public class Almacen {
    //Atributos
    private int id;
    private String nombre;
    private String ubicacion;
    private int stock;
    private int idTienda;
    private boolean activo;
    
    //Relaciones Lote y Movimiento Almacen
    private final ArrayList<MovimientoAlmacen> movimientos;
    private final ArrayList<Lote>lotes;
    
    //Constructor por defecto.
    public Almacen() {
        this.movimientos=new ArrayList<>();
        this.lotes=new ArrayList<>();
    }
    
    
    //Constructor Con parametros, Solo Atributos
    public Almacen(String nombre, String ubicacion, int stock, int idTienda) {
        this.nombre = nombre;
        this.ubicacion = ubicacion;
        this.stock = stock;
        this.idTienda = idTienda;
        this.activo=true;
        this.movimientos=new ArrayList<>();
        this.lotes=new ArrayList<>();
    }
    //Constructor copia, para el ArrayList de Tienda
    public Almacen(Almacen datAlmacen){
        this.id=datAlmacen.id;
        this.nombre=datAlmacen.nombre;
        this.stock=datAlmacen.stock;
        this.ubicacion=datAlmacen.ubicacion;
        this.activo=datAlmacen.activo;
        this.idTienda=datAlmacen.idTienda;
        this.movimientos=new ArrayList<>(datAlmacen.movimientos);
        this.lotes=new ArrayList<>(datAlmacen.lotes);
    }

    //Mostrar Almacen
    public void mostrarAlmacen(){
        System.out.println("IdAlmacen: "+this.id);
        System.out.println("Nombre: "+this.nombre);
        System.out.println("Ubicacion: "+this.ubicacion);
        System.out.println("Activo: "+this.activo);
        System.out.println("Stock: "+this.stock);
        System.out.println("idTienda: "+this.idTienda);
        //Faltarían movimientos y lotes...
        for (MovimientoAlmacen datMov: this.movimientos){
            datMov.mostrarMovAlmacen();
            System.out.println();
        }
        
        for (Lote datLote: this.lotes){
            datLote.mostrarLote();
            System.out.println();
        }
    }
    //Getters y Setters
    public boolean isActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }
    
    public int getIdTienda() {
        return idTienda;
    }

    public void setIdTienda(int idTienda) {
        this.idTienda = idTienda;
    }
    public String getNombre() {
        return nombre;
    }
    //Setter de Nombre
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }
    
    
}
