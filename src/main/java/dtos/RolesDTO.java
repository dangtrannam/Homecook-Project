package dtos;

import javax.persistence.*;

@Entity
@Table(name = "Roles", schema = "dbo", catalog = "homecook")
public class RolesDTO {
    private int roleId;
    private String roleName;

    @Id
    @Column(name = "RoleID", nullable = false)
    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    @Basic
    @Column(name = "RoleName", nullable = false, length = 20)
    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        RolesDTO rolesDTO = (RolesDTO) o;

        if (roleId != rolesDTO.roleId) return false;
        if (roleName != null ? !roleName.equals(rolesDTO.roleName) : rolesDTO.roleName != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = roleId;
        result = 31 * result + (roleName != null ? roleName.hashCode() : 0);
        return result;
    }
}
