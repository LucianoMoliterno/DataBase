
package bd;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
import org.apache.commons.lang.builder.ToStringBuilder;

public class ObraSocial {

    @SerializedName("nombre")
    @Expose
    private String nombre;
    @SerializedName("numeroAfiliado")
    @Expose
    private Integer numeroAfiliado;

    /**
     * No args constructor for use in serialization
     * 
     */
    public ObraSocial() {
    }

    /**
     * 
     * @param numeroAfiliado
     * @param nombre
     */
    public ObraSocial(String nombre, Integer numeroAfiliado) {
        super();
        this.nombre = nombre;
        this.numeroAfiliado = numeroAfiliado;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Integer getNumeroAfiliado() {
        return numeroAfiliado;
    }

    public void setNumeroAfiliado(Integer numeroAfiliado) {
        this.numeroAfiliado = numeroAfiliado;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this).append("nombre", nombre).append("numeroAfiliado", numeroAfiliado).toString();
    }

}
