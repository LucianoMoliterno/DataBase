
package bd;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
import org.apache.commons.lang.builder.ToStringBuilder;

public class Producto {

    @SerializedName("codigo")
    @Expose
    private Integer codigo;
    @SerializedName("tipoProducto")
    @Expose
    private String tipoProducto;
    @SerializedName("descripcion")
    @Expose
    private String descripcion;
    @SerializedName("laboratorio")
    @Expose
    private Laboratorio laboratorio;
    @SerializedName("precio")
    @Expose
    private Integer precio;

    /**
     * No args constructor for use in serialization
     * 
     */
    public Producto() {
    }

    /**
     * 
     * @param descripcion
     * @param codigo
     * @param precio
     * @param tipoProducto
     * @param laboratorio
     */
    public Producto(Integer codigo, String tipoProducto, String descripcion, Laboratorio laboratorio, Integer precio) {
        super();
        this.codigo = codigo;
        this.tipoProducto = tipoProducto;
        this.descripcion = descripcion;
        this.laboratorio = laboratorio;
        this.precio = precio;
    }

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getTipoProducto() {
        return tipoProducto;
    }

    public void setTipoProducto(String tipoProducto) {
        this.tipoProducto = tipoProducto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Laboratorio getLaboratorio() {
        return laboratorio;
    }

    public void setLaboratorio(Laboratorio laboratorio) {
        this.laboratorio = laboratorio;
    }

    public Integer getPrecio() {
        return precio;
    }

    public void setPrecio(Integer precio) {
        this.precio = precio;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this).append("codigo", codigo).append("tipoProducto", tipoProducto).append("descripcion", descripcion).append("laboratorio", laboratorio).append("precio", precio).toString();
    }

}
