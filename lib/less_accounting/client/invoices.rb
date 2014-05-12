module LessAccounting
  class Client
    module Invoices
      
      # Get a list of invoices.
      # @endpoint /invoices.json
      # @method GET
      def invoices(params = {})
        response = get("invoices.json", params = {})
      end
      
      # Get an individual invoice.
      # @endpoint /invoices/:id.json
      # @method GET
      def invoice(invoice_id, params = {})
        response = get("invoices/#{invoice_id}.json", params)
      end
      
      # Create an invoice.
      # @endpoint /invoices.json
      # @method POST
      def create_invoice(params = {})
        response = post("invoices.json", create_prefixed_params('invoice', params))
      end
      
      # Update an invoice.
      # @endpoint /invoices/:id.json
      # @method PUT
      def update_invoice(invoice_id, params = {})
        response = put("invoices/#{invoices_id}.json", create_prefixed_params('invoice', params))
      end
      
      # Delete an invoice.
      # @endpoint /invoices/:id.json
      # @method DELETE
      def destroy_invoice(invoice_id, params = {})
        response = delete("invoices/#{invoice_id}.json", params)
      end
      
    end
  end
end