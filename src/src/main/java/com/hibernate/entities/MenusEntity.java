package com.hibernate.entities;

import javax.persistence.*;

@Entity
@Table(name = "Menus", schema = "dbo", catalog = "homecook")
public class MenusEntity {
    private int menuId;
    private String menuName;
    private boolean status;

    @Id
    @Column(name = "MenuID", nullable = false)
    public int getMenuId() {
        return menuId;
    }

    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }

    @Basic
    @Column(name = "MenuName", nullable = false, length = 100)
    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    @Basic
    @Column(name = "Status", nullable = false)
    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        MenusEntity that = (MenusEntity) o;

        if (menuId != that.menuId) return false;
        if (status != that.status) return false;
        if (menuName != null ? !menuName.equals(that.menuName) : that.menuName != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = menuId;
        result = 31 * result + (menuName != null ? menuName.hashCode() : 0);
        result = 31 * result + (status ? 1 : 0);
        return result;
    }
}
