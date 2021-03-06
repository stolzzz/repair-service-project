package com.ttu.roman.dao.invoice;

import com.ttu.roman.dao.DAOTest;
import com.ttu.roman.model.invoice.Invoice;
import com.ttu.roman.model.service.ServiceOrder;
import org.junit.Test;

import static org.junit.Assert.*;

public class InvoiceDAOTest extends DAOTest{

    @Test
    public void testRetrieve() throws Exception {
        Invoice invoice = invoiceDAO.findAll().get(0);
        assertTrue(invoice instanceof Invoice);
        assertNotNull(invoice.getInvoiceStatusType());
        assertNotNull(invoice.getServiceOrder());
    }

    @Test
    public void testFindByServiceOrderId() throws Exception {
        Invoice invoice = invoiceDAO.findByServiceOrderId(1);
        assertNotNull(invoice);
    }

    @Test
    public void ddsd() throws Exception {
        Invoice invoice = invoiceDAO.find(1);
        assertNotNull(invoice.getServiceOrder());
    }
}