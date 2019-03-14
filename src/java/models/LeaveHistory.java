/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author AdhityaWP
 */
@Entity
@Table(name = "tb_t_leave_history")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "LeaveHistory.findAll", query = "SELECT l FROM LeaveHistory l")
    , @NamedQuery(name = "LeaveHistory.findById", query = "SELECT l FROM LeaveHistory l WHERE l.id = :id")
    , @NamedQuery(name = "LeaveHistory.findByDatetime", query = "SELECT l FROM LeaveHistory l WHERE l.datetime = :datetime")
    , @NamedQuery(name = "LeaveHistory.findByTotal", query = "SELECT l FROM LeaveHistory l WHERE l.total = :total")})
public class LeaveHistory implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "ID")
    private String id;
    @Column(name = "DATETIME")
    @Temporal(TemporalType.DATE)
    private Date datetime;
    @Column(name = "TOTAL")
    private BigInteger total;
    @JoinColumn(name = "DESCRIPTION", referencedColumnName = "ID")
    @ManyToOne(fetch = FetchType.LAZY)
    private LeaveDesc description;
    @JoinColumn(name = "EMPLOYEE", referencedColumnName = "ID")
    @ManyToOne(fetch = FetchType.LAZY)
    private Employee employee;

    public LeaveHistory() {
    }

    public LeaveHistory(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getDatetime() {
        return datetime;
    }

    public void setDatetime(Date datetime) {
        this.datetime = datetime;
    }

    public BigInteger getTotal() {
        return total;
    }

    public void setTotal(BigInteger total) {
        this.total = total;
    }

    public LeaveDesc getDescription() {
        return description;
    }

    public void setDescription(LeaveDesc description) {
        this.description = description;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
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
        if (!(object instanceof LeaveHistory)) {
            return false;
        }
        LeaveHistory other = (LeaveHistory) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "models.LeaveHistory[ id=" + id + " ]";
    }
    
}
