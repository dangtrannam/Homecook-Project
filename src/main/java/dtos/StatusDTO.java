package dtos;

import javax.persistence.*;

@Entity
@Table(name = "Status", schema = "dbo", catalog = "homecook")
public class StatusDTO {
    private int statusId;
    private String status;

    @Id
    @Column(name = "StatusID", nullable = false)
    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    @Basic
    @Column(name = "Status", nullable = false, length = 20)
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        StatusDTO statusDTO = (StatusDTO) o;

        if (statusId != statusDTO.statusId) return false;
        if (status != null ? !status.equals(statusDTO.status) : statusDTO.status != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = statusId;
        result = 31 * result + (status != null ? status.hashCode() : 0);
        return result;
    }
}
