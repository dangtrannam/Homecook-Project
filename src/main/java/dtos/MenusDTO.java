package dtos;

import javax.persistence.*;

@Entity
@Table(name = "Menus", schema = "dbo", catalog = "homecook")
public class MenusDTO {
    private int menuId;
    private String menuName;
    private boolean isServing;
    private AccountsDTO accountsByHomeCookId;

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
    @Column(name = "IsServing", nullable = false)
    public boolean isServing() {
        return isServing;
    }

    public void setServing(boolean serving) {
        isServing = serving;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        MenusDTO menusDTO = (MenusDTO) o;

        if (menuId != menusDTO.menuId) return false;
        if (menuName != null ? !menuName.equals(menusDTO.menuName) : menusDTO.menuName != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = menuId;
        result = 31 * result + (menuName != null ? menuName.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "HomeCookID", referencedColumnName = "UserID", nullable = false)
    public AccountsDTO getAccountsByHomeCookId() {
        return accountsByHomeCookId;
    }

    public void setAccountsByHomeCookId(AccountsDTO accountsByHomeCookId) {
        this.accountsByHomeCookId = accountsByHomeCookId;
    }
}
