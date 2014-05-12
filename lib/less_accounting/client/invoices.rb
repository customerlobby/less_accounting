module LessAccounting
  class Client
    module Invoices
      
      # Get a list of invoices.
      # @endpoint /invoices.xml
      # @method GET
      def invoices(params = {})
        response = get("invoices.xml", params = {})
      end
      
      # Get an individual invoice.
      # @endpoint /invoices/:id.xml
      # @method GET
      def invoice(invoice_id, params = {})
        response = get("invoices/#{invoice_id}.xml", params)
      end
      
      # Create an invoice.
      # @endpoint /invoices.xml
      # @method POST
      def invoice_create(params = {})
        response = post("invoices.xml", params)
      end
      
      # Update an invoice.
      # @endpoint /invoices/:id.xml
      # @method PUT
      def invoice_update(invoice_id, params = {})
        response = post("invoices/#{invoices_id}.xml", params)
      end
      
      # Delete an invoice.
      # @endpoint /invoices/:id.xml
      # @method DELETE
      def invoice_destroy(invoice_id, params = {})
        response = delete("invoices/#{invoice_id}.xml", params)
      end
      
    end
  end
end