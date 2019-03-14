/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
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
@Table(name = "tb_m_employee")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Employee.findAll", query = "SELECT e FROM Employee e")
    , @NamedQuery(name = "Employee.findById", query = "SELECT e FROM Employee e WHERE e.id = :id")
    , @NamedQuery(name = "Employee.findByName", query = "SELECT e FROM Employee e WHERE e.name = :name")
    , @NamedQuery(name = "Employee.findByGendertype", query = "SELECT e FROM Employee e WHERE e.gendertype = :gendertype")
    , @NamedQuery(name = "Employee.findByLeavetotal", query = "SELECT e FROM Employee e WHERE e.leavetotal = :leavetotal")
    , @NamedQuery(name = "Employee.findByEmail", query = "SELECT e FROM Employee e WHERE e.email = :email")
    , @NamedQuery(name = "Employee.findByPassword", query = "SELECT e FROM Employee e WHERE e.password = :password")})
public class Employee implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "ID")
    private String id;
    @Column(name = "NAME")
    private String name;
    @Column(name = "GENDERTYPE")
    private String gendertype;
    @Column(name = "LEAVETOTAL")
    private BigInteger leavetotal;
    @Column(name = "EMAIL")
    private String email;
    @Column(name = "PASSWORD")
    private String password;
    @Lob
    @Column(name = "PHOTO")
    private byte[] photo;
    @OneToMany(mappedBy = "employee", fetch = FetchType.LAZY)
    private List<Request> requestList;
    @JoinColumn(name = "MARRIEDSTATUS", referencedColumnName = "ID")
    @ManyToOne(fetch = FetchType.LAZY)
    private MarriedStatus marriedstatus;
    @OneToMany(mappedBy = "idmanager", fetch = FetchType.LAZY)
    private List<Employee> employeeList;
    @JoinColumn(name = "IDMANAGER", referencedColumnName = "ID")
    @ManyToOne(fetch = FetchType.LAZY)
    private Employee idmanager;
    @JoinColumn(name = "JOB", referencedColumnName = "ID")
    @ManyToOne(fetch = FetchType.LAZY)
    private Job job;
    @OneToMany(mappedBy = "employee", fetch = FetchType.LAZY)
    private List<LeaveHistory> leaveHistoryList;

    public Employee() {
    }

    public Employee(String id, String name, String gendertype, BigInteger leavetotal, String email, String password, MarriedStatus marriedstatus, Employee idmanager, Job job) {
        this.id = id;
        this.name = name;
        this.gendertype = gendertype;
        this.leavetotal = leavetotal;
        this.email = email;
        this.password = password;
        this.marriedstatus = marriedstatus;
        this.idmanager = idmanager;
        this.job = job;
    }

    public Employee(String id, BigInteger leavetotal) {
        this.id = id;
        this.leavetotal = leavetotal;
    }
    

    public Employee(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGendertype() {
        return gendertype;
    }

    public void setGendertype(String gendertype) {
        this.gendertype = gendertype;
    }

    public BigInteger getLeavetotal() {
        return leavetotal;
    }

    public void setLeavetotal(BigInteger leavetotal) {
        this.leavetotal = leavetotal;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public byte[] getPhoto() {
        return photo;
    }

    public void setPhoto(byte[] photo) {
        this.photo = photo;
    }

    @XmlTransient
    public List<Request> getRequestList() {
        return requestList;
    }

    public void setRequestList(List<Request> requestList) {
        this.requestList = requestList;
    }

    public MarriedStatus getMarriedstatus() {
        return marriedstatus;
    }

    public void setMarriedstatus(MarriedStatus marriedstatus) {
        this.marriedstatus = marriedstatus;
    }

    @XmlTransient
    public List<Employee> getEmployeeList() {
        return employeeList;
    }

    public void setEmployeeList(List<Employee> employeeList) {
        this.employeeList = employeeList;
    }

    public Employee getIdmanager() {
        return idmanager;
    }

    public void setIdmanager(Employee idmanager) {
        this.idmanager = idmanager;
    }

    public Job getJob() {
        return job;
    }

    public void setJob(Job job) {
        this.job = job;
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
        if (!(object instanceof Employee)) {
            return false;
        }
        Employee other = (Employee) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "models.Employee[ id=" + id + " ]";
    }
    
}
