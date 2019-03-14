/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author AdhityaWP
 */
@Entity
@Table(name = "tb_m_leave_desc")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "LeaveDesc.findAll", query = "SELECT l FROM LeaveDesc l")
    , @NamedQuery(name = "LeaveDesc.findById", query = "SELECT l FROM LeaveDesc l WHERE l.id = :id")
    , @NamedQuery(name = "LeaveDesc.findByDescription", query = "SELECT l FROM LeaveDesc l WHERE l.description = :description")})
public class LeaveDesc implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "ID")
    private String id;
    @Column(name = "DESCRIPTION")
    private String description;
    @OneToMany(mappedBy = "description", fetch = FetchType.LAZY)
    private List<LeaveHistory> leaveHistoryList;

    public LeaveDesc() {
    }

    public LeaveDesc(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @XmlTransient
    public List<LeaveHistory> getLeaveHistoryList() {
        return leaveHistoryList;
    }

    public void setLeaveHistoryList(List<LeaveHistory> leaveHistoryList) {
        this.leaveHistoryList = leaveHistoryList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof LeaveDesc)) {
            return false;
        }
        LeaveDesc other = (LeaveDesc) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "models.LeaveDesc[ id=" + id + " ]";
    }
    
}
