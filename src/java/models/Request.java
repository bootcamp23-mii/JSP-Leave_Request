/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author acer
 */
@Entity
@Table(name = "tb_m_request")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Request.findAll", query = "SELECT r FROM Request r")
    , @NamedQuery(name = "Request.findById", query = "SELECT r FROM Request r WHERE r.id = :id")
    , @NamedQuery(name = "Request.findByStartdate", query = "SELECT r FROM Request r WHERE r.startdate = :startdate")
    , @NamedQuery(name = "Request.findByEnddate", query = "SELECT r FROM Request r WHERE r.enddate = :enddate")
    , @NamedQuery(name = "Request.findByTotal", query = "SELECT r FROM Request r WHERE r.total = :total")
    , @NamedQuery(name = "Request.findByStatus", query = "SELECT r FROM Request r WHERE r.status = :status")})
public class Request implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "ID")
    private String id;
    @Column(name = "STARTDATE")
    @Temporal(TemporalType.DATE)
    private Date startdate;
    @Column(name = "ENDDATE")
    @Temporal(TemporalType.DATE)
    private Date enddate;
    @Column(name = "TOTAL")
    private BigInteger total;
    @Column(name = "STATUS")
    private String status;
    @JoinColumn(name = "EMPLOYEE", referencedColumnName = "ID")
    @ManyToOne(fetch = FetchType.LAZY)
    private Employee employee;
    @JoinColumn(name = "LEAVETYPE", referencedColumnName = "ID")
    @ManyToOne(fetch = FetchType.LAZY)
    private LeaveType leavetype;
    @OneToMany(mappedBy = "request", fetch = FetchType.LAZY)
    private List<RequestStatus> requestStatusList;

    public Request() {
    }
    
      public Request(String id, Date startdate, Date enddate, BigInteger total, String status, Employee employee, LeaveType leavetype) {
        this.id = id;
        this.startdate = startdate;
        this.enddate = enddate;
        this.total = total;
        this.status = status;
        this.employee = employee;
        this.leavetype = leavetype;
    }

    public Request(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getStartdate() {
        return startdate;
    }

    public void setStartdate(Date startdate) {
        this.startdate = startdate;
    }

    public Date getEnddate() {
        return enddate;
    }

    public void setEnddate(Date enddate) {
        this.enddate = enddate;
    }

    public BigInteger getTotal() {
        return total;
    }

    public void setTotal(BigInteger total) {
        this.total = total;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public LeaveType getLeavetype() {
        return leavetype;
    }

    public void setLeavetype(LeaveType leavetype) {
        this.leavetype = leavetype;
    }

    @XmlTransient
    public List<RequestStatus> getRequestStatusList() {
        return requestStatusList;
    }

    public void setRequestStatusList(List<RequestStatus> requestStatusList) {
        this.requestStatusList = requestStatusList;
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
        if (!(object instanceof Request)) {
            return false;
        }
        Request other = (Request) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "models.Request[ id=" + id + " ]";
    }
    
}
