
package bd;

import java.util.ArrayList;
import java.util.List;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
import org.apache.commons.lang.builder.ToStringBuilder;

public class Farmacia {

    @SerializedName("puntoVenta")
    @Expose
    private Integer puntoVenta;
    @SerializedName("nombre")
    @Expose
    private String nombre;
    @SerializedName("domicilio")
    @Expose
    private Domicilio domicilio;
    @SerializedName("personas")
    @Expose
    private List<Persona> personas = new ArrayList<Persona>();
    @SerializedName("productos")
    @Expose
    private List<Producto> productos = new ArrayList<Producto>();
    @SerializedName("ventas")
    @Expose
    private List<Venta> ventas = new ArrayList<Venta>();

    /**
     * No args constructor for use in serialization
     * 
     */
    public Farmacia() {
    }

    /**
     * 
     * @param domicilio
     * @param puntoVenta
     * @param ventas
     * @param nombre
     * @param personas
     * @param productos
     */
    public Farmacia(Integer puntoVenta, String nombre, Domicilio domicilio, List<Persona> personas, List<Producto> productos, List<Venta> ventas) {
        super();
        this.puntoVenta = puntoVenta;
        this.nombre = nombre;
        this.domicilio = domicilio;
        this.personas = personas;
        this.productos = productos;
        this.ventas = ventas;
    }

    public Integer getPuntoVenta() {
        return puntoVenta;
    }

    public void setPuntoVenta(Integer puntoVenta) {
        this.puntoVenta = puntoVenta;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Domicilio getDomicilio() {
        return domicilio;
    }

    public void setDomicilio(Domicilio domicilio) {
        this.domicilio = domicilio;
    }

    public List<Persona> getPersonas() {
        return personas;
    }

    public void setPersonas(List<Persona> personas) {
        this.personas = personas;
    }

    public List<Producto> getProductos() {
        return productos;
    }

    public void setProductos(List<Producto> productos) {
        this.productos = productos;
    }

    public List<Venta> getVentas() {
        return ventas;
    }

    public void setVentas(List<Venta> ventas) {
        this.ventas = ventas;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this).append("puntoVenta", puntoVenta).append("nombre", nombre).append("domicilio", domicilio).append("personas", personas).append("productos", productos).append("ventas", ventas).toString();
    }

}
