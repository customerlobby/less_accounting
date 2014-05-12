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
      def create_contact(params = {})
        response = post("contacts.xml", params)
      end

      # Update a contact.
      # @endpoint /contacts/:id.xml
      # @method PUT
      def update_contact(contact_id, params = {})
        prefixed_params = Hash.new
        params.each do |key,value|
          prefixed_params["contact[#{key}]"] = value  
        end        
        response = put("contacts/#{contact_id}.xml", prefixed_params)
      end
      
      # Delete a contact.
      # @endpoint /contacts/:id.xml
      # @method DELETE
      def destroy_contact(contact_id, params = {})
        response = delete("contacts/#{contact_id}.xml", params)
      end

    end
  end
end