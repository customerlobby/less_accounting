module LessAccounting
  class Client
    module Contacts

      # Get a list of contacts.
      # @endpoint /contacts.json
      # @method GET
      def contacts(params = {})
        response = get("contacts.json", params)
      end
      
      # Get an individual contact.
      # @endpoint /contacts/:id.json
      # @method GET
      def contact(contact_id, params = {})
        response = get("contacts/#{contact_id}.json", params)
      end
      
      # Create a contact.
      # @endpoint /contacts.json
      # @method POST
      def create_contact(params = {})
        response = post("contacts.json", create_prefixed_params('contact', params))
      end

      # Update a contact.
      # @endpoint /contacts/:id.json
      # @method PUT
      def update_contact(contact_id, params = {})
        response = put("contacts/#{contact_id}.json", create_prefixed_params('contact', params))
      end
      
      # Delete a contact.
      # @endpoint /contacts/:id.json
      # @method DELETE
      def destroy_contact(contact_id, params = {})
        response = delete("contacts/#{contact_id}.json", params)
      end

    end
  end
end