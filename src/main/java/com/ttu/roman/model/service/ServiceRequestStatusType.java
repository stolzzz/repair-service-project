package com.ttu.roman.model.service;

import javax.persistence.*;

/**
 * Created by Roman on 1.06.14.
 */
@Entity
@Table(name = "service_request_status_type", schema = "public", catalog = "ri")
public class ServiceRequestStatusType {
    private int serviceRequestStatusType;
    private String typeName;

    @Id
    @Column(name = "service_request_status_type", nullable = false, insertable = true, updatable = true, length = 10, precision = 0)
    public int getServiceRequestStatusType() {
        return serviceRequestStatusType;
    }

    public void setServiceRequestStatusType(int serviceRequestStatusType) {
        this.serviceRequestStatusType = serviceRequestStatusType;
    }

    @Basic
    @Column(name = "type_name", nullable = true, insertable = true, updatable = true, length = 200, precision = 0)
    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ServiceRequestStatusType that = (ServiceRequestStatusType) o;

        if (serviceRequestStatusType != that.serviceRequestStatusType) return false;
        if (typeName != null ? !typeName.equals(that.typeName) : that.typeName != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = serviceRequestStatusType;
        result = 31 * result + (typeName != null ? typeName.hashCode() : 0);
        return result;
    }
}