
package bd;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
import org.apache.commons.lang.builder.ToStringBuilder;

public class Laboratorio {

    @SerializedName("id")
    @Expose
    private Integer id;
    @SerializedName("domicilio")
    @Expose
    private Domicilio__ domicilio;

    /**
     * No args constructor for use in serialization
     * 
     */
    public Laboratorio() {
    }

    /**
     * 
     * @param domicilio
     * @param id
     */
    public Laboratorio(Integer id, Domicilio__ domicilio) {
        super();
        this.id = id;
        this.domicilio = domicilio;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Domicilio__ getDomicilio() {
        return domicilio;
    }

    public void setDomicilio(Domicilio__ domicilio) {
        this.domicilio = domicilio;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this).append("id", id).append("domicilio", domicilio).toString();
    }

}
