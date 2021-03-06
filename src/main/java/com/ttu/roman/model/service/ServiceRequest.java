package com.ttu.roman.model.service;

import com.ttu.roman.model.user.AbstractCustomer;
import com.ttu.roman.model.user.Employee;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


@Entity
@Table(name = "service_request", schema = "public", catalog = "ri")
public class ServiceRequest {

    @Id
    @SequenceGenerator(name="service_request_id", initialValue=4, allocationSize=1, schema = "public", catalog = "ri", sequenceName = "service_request_id")
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "service_request_id")
    @Column(name = "service_request", nullable = false, insertable = true, updatable = true, length = 10, precision = 0)
    private Integer serviceRequest;

    @OneToOne(mappedBy = "serviceRequest", fetch = FetchType.EAGER)
    private ServiceOrder serviceOrder;

    @ManyToOne
    @JoinColumn(name = "service_request_status_type_fk")
    private ServiceRequestStatusType serviceRequestStatusType;

    @ManyToOne
    @JoinColumn(name = "customer_fk")
    private AbstractCustomer customer;

    @OneToOne
    @JoinColumn(name="created_by")
    private Employee createdBy;

    @Basic
    @Column(name = "created", nullable = true, insertable = true, updatable = true, length = 29, precision = 6)
    private Timestamp created;

    @Basic
    @Column(name = "service_desc_by_customer", nullable = true, insertable = true, updatable = true, length = 2147483647, precision = 0)
    @Size(min = 20)
    private String serviceDescByCustomer;

    @Basic
    @Column(name = "service_desc_by_employee", nullable = true, insertable = true, updatable = true, length = 2147483647, precision = 0)
    @Size(min = 20)
    private String serviceDescByEmployee;

    public Integer getServiceRequest() {
        return serviceRequest;
    }

    public void setServiceRequest(Integer serviceRequest) {
        this.serviceRequest = serviceRequest;
    }

    public Employee getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(Employee createdBy) {
        this.createdBy = createdBy;
    }

    public Timestamp getCreated() {
        return created;
    }

    public void setCreated(Timestamp created) {
        this.created = created;
    }

    public String getServiceDescByCustomer() {
        return serviceDescByCustomer;
    }

    public void setServiceDescByCustomer(String serviceDescByCustomer) {
        this.serviceDescByCustomer = serviceDescByCustomer;
    }

    public String getServiceDescByEmployee() {
        return serviceDescByEmployee;
    }

    public void setServiceDescByEmployee(String serviceDescByEmployee) {
        this.serviceDescByEmployee = serviceDescByEmployee;
    }

    public ServiceRequestStatusType getServiceRequestStatusType() {
        return serviceRequestStatusType;
    }

    public void setServiceRequestStatusType(ServiceRequestStatusType serviceRequestStatusType) {
        this.serviceRequestStatusType = serviceRequestStatusType;
    }

    public ServiceOrder getServiceOrder() {
        return serviceOrder;
    }

    public void setServiceOrder(ServiceOrder serviceOrder) {
        this.serviceOrder = serviceOrder;
    }

    public AbstractCustomer getCustomer() {
        return customer;
    }

    public void setCustomer(AbstractCustomer customer) {
        this.customer = customer;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ServiceRequest that = (ServiceRequest) o;

        if (serviceRequest != null ? !serviceRequest.equals(that.serviceRequest) : that.serviceRequest != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        return serviceRequest != null ? serviceRequest.hashCode() : 0;
    }

    @Override
    public String toString() {
        return "ServiceRequest{" +
                "createdBy=" + createdBy +
                ", serviceDescByEmployee='" + serviceDescByEmployee + '\'' +
                ", created=" + created +
                ", serviceDescByCustomer='" + serviceDescByCustomer + '\'' +
                ", serviceRequestStatusType=" + serviceRequestStatusType +
                ", serviceRequest=" + serviceRequest +
                ", customer=" + customer +
                '}';
    }
}
