package com.ttu.roman.controller;

import com.ttu.roman.dao.invoice.InvoiceDAO;
import com.ttu.roman.dao.invoice.InvoiceStatusTypeDAO;
import com.ttu.roman.dao.service.ServiceOrderDAO;
import com.ttu.roman.form.invoice.UpdateInvoiceForm;
import com.ttu.roman.model.invoice.Invoice;
import com.ttu.roman.service.invoice.InvoiceService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/invoice")
public class InvoiceController {

    @Autowired
    private ServiceOrderDAO serviceOrderDAO;

    @Autowired
    private InvoiceStatusTypeDAO invoiceStatusTypeDAO;

    @Autowired
    private InvoiceDAO invoiceDAO;

    @Autowired
    private InvoiceService invoiceService;

    Logger LOG = Logger.getLogger(InvoiceController.class);


    @RequestMapping("/update")
    public String add(Model model, @RequestParam(required = true) Integer serviceOrderId) {
        Invoice invoice = serviceOrderDAO.find(serviceOrderId).getInvoice();

        UpdateInvoiceForm updateInvoiceForm = new UpdateInvoiceForm();
        updateInvoiceForm.setInvoice(invoice);

        model.addAttribute("invoice", invoice);
        model.addAttribute("updateInvoiceForm", updateInvoiceForm);
        model.addAttribute("invoiceStatusTypes", invoiceStatusTypeDAO.findAll());
        return "invoice/update";
    }

    @RequestMapping("/doInvoice")
    public String doInvoice(Model model, @RequestParam(required = true) Integer serviceOrderId) {
        try {
            if (serviceOrderDAO.find(serviceOrderId).getInvoice() == null){
                invoiceService.createInvoice(serviceOrderDAO.find(serviceOrderId));
            }
            return "redirect:/invoice/update?serviceOrderId=" + serviceOrderId;
        } catch (Exception e) {
            e.printStackTrace();
            return  "redirect:/service-order/listAll";
        }

    }


    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String addPost(Model model, UpdateInvoiceForm updateInvoiceForm) {
        Invoice invoiceFromForm = updateInvoiceForm.getInvoice();

        Invoice originalInvoice = invoiceDAO.find(invoiceFromForm.getInvoice());
        originalInvoice.setDescription(invoiceFromForm.getDescription());
        originalInvoice.setReferenceNumber(invoiceFromForm.getReferenceNumber());
        originalInvoice.setReceiverAccounts(invoiceFromForm.getReceiverAccounts());
        originalInvoice.setReceiverName(invoiceFromForm.getReceiverName());
        originalInvoice.setInvoiceStatusType(invoiceStatusTypeDAO.find(updateInvoiceForm.getInvoiceStatusType()));


        invoiceDAO.update(originalInvoice);
        return "redirect:/invoice/update?serviceOrderId="+originalInvoice.getServiceOrder().getServiceOrder();
    }

}
