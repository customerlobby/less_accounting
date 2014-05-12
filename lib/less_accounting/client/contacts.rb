module LessAccounting
  class Client
    module Contacts

      # Get a list of contacts.
      # @endpoint /contacts.xml
      # @method GET
      def contacts(params = {})
        response = get("contacts.xml", params)
      end
      
      # Get an individual contact.
      # @endpoint /contacts/:id.xml
      # @method GET
      def contact(contact_id, params = {})
        response = get("contacts/#{contact_id}.xml", params)
      end
      
      # Create a contact.
      # @endpoint /contacts.xml
      # @method POST
      def contact_create(params = {})
        response = post("contacts.xml", params)
      end

      # Update a contact.
      # @endpoint /contacts/:id.xml
      # @method PUT
      def contact_update(contact_id, params = {})
        response = post("contacts/#{contact_id}.xml", params)
      end
      
      # Delete a contact.
      # @endpoint /contacts/:id.xml
      # @method DELETE
      def contact_destroy(contact_id, params = {})
        response = delete("contacts/#{contact_id}.xml", params)
      end

    end
  end
end