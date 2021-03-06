package com.ttu.roman.model.service;

import com.ttu.roman.model.invoice.InvoiceRow;

import javax.persistence.*;
import java.math.BigInteger;
import java.sql.Timestamp;
import java.util.List;
import java.util.Set;


@Entity
@Table(name = "service_action", schema = "public", catalog = "ri")
public class ServiceAction {
    @Id
    @SequenceGenerator(name="service_action_id", initialValue=200, allocationSize=1, schema = "public", catalog = "ri", sequenceName = "service_action_id")
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "service_action_id")
    @Column(name = "service_action", nullable = false, insertable = true, updatable = true, length = 10, precision = 0)
    private Integer serviceAction;

    @OneToMany(mappedBy = "serviceAction")
    private Set<InvoiceRow> invoiceRows;

    @ManyToOne
    @JoinColumn(name = "service_action_status_type_fk")
    private ServiceActionStatusType serviceActionStatusType;

    @ManyToOne
    @JoinColumn(name = "service_type_fk")
    private  ServiceType serviceType;

    @ManyToOne
    @JoinColumn(name = "service_order_fk")
    private  ServiceOrder serviceOrder;

    @ManyToOne
    @JoinColumn(name = "service_device_fk")
    private ServiceDevice serviceDevice;

    @Basic
    @Column(name = "service_amount", nullable = true, insertable = true, updatable = true, length = 131089, precision = 0)
    private BigInteger serviceAmount;

    @Basic
    @Column(name = "price", nullable = true, insertable = true, updatable = true, length = 131089, precision = 0)
    private BigInteger price;

    @Basic
    @Column(name = "action_description", nullable = true, insertable = true, updatable = true, length = 2147483647, precision = 0)
    private String actionDescription;

    @Basic
    @Column(name = "created", nullable = true, insertable = true, updatable = true, length = 29, precision = 6)
    private Timestamp created;

    @Basic
    @Column(name = "created_by", nullable = true, insertable = true, updatable = true, length = 10, precision = 0)
    private Integer createdBy;

    public Integer getServiceAction() {
        return serviceAction;
    }

    public void setServiceAction(Integer serviceAction) {
        this.serviceAction = serviceAction;
    }

    public BigInteger getServiceAmount() {
        return serviceAmount;
    }

    public void setServiceAmount(BigInteger serviceAmount) {
        this.serviceAmount = serviceAmount;
    }

    public BigInteger getPrice() {
        return price;
    }

    public void setPrice(BigInteger price) {
        this.price = price;
    }

    public String getActionDescription() {
        return actionDescription;
    }

    public void setActionDescription(String actionDescription) {
        this.actionDescription = actionDescription;
    }

    public Timestamp getCreated() {
        return created;
    }

    public void setCreated(Timestamp created) {
        this.created = created;
    }

    public Integer getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(Integer createdBy) {
        this.createdBy = createdBy;
    }

    public ServiceActionStatusType getServiceActionStatusType() {
        return serviceActionStatusType;
    }

    public void setServiceActionStatusType(ServiceActionStatusType serviceActionStatusType) {
        this.serviceActionStatusType = serviceActionStatusType;
    }

    public Set<InvoiceRow> getInvoiceRows() {
        return invoiceRows;
    }

    public void setInvoiceRows(Set<InvoiceRow> invoiceRows) {
        this.invoiceRows = invoiceRows;
    }

    public ServiceType getServiceType() {
        return serviceType;
    }

    public void setServiceType(ServiceType serviceType) {
        this.serviceType = serviceType;
    }

    public ServiceOrder getServiceOrder() {
        return serviceOrder;
    }

    public void setServiceOrder(ServiceOrder serviceOrder) {
        this.serviceOrder = serviceOrder;
    }

    public ServiceDevice getServiceDevice() {
        return serviceDevice;
    }

    public void setServiceDevice(ServiceDevice serviceDevice) {
        this.serviceDevice = serviceDevice;
    }

    @Override
    public String toString() {
        return "ServiceAction{" +
                "serviceAction=" + serviceAction +
                ", serviceActionStatusType=" + serviceActionStatusType +
                ", serviceType=" + serviceType +
                ", serviceOrder=" + serviceOrder +
                ", serviceAmount=" + serviceAmount +
                ", price=" + price +
                ", actionDescription='" + actionDescription + '\'' +
                ", created=" + created +
                ", createdBy=" + createdBy +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ServiceAction that = (ServiceAction) o;

        if (serviceAction != that.serviceAction) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return serviceAction;
    }
}
