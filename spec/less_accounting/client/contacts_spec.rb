require 'spec_helper'

describe LessAccounting::Client::Contacts do
  
  before do
    @client = LessAccounting.client({username: 'tester', password: 'testing', domain: 'testdomain', api_key: 'secret-key'})
  end

  describe ':contacts' do
    it 'should retrieve a list of contacts' do
      stub_get(path, 'secret-key').with(headers: set_headers).to_return(body: response_contacts_xml, status: 200)
      response = @client.contacts
      response.should_not be_nil
      response.contacts.size.should == 2
    end
  end

  describe ':contact' do
    it 'should retrieve a single contact' do
      stub_get(path(1), 'secret-key').with(headers: set_headers).to_return(body: response_contact_xml, status: 200)
      response = @client.contact(1)
      response.should_not be_nil
      response.contact.id.should == 1
    end
  end

  # describe ':contact_create' do
  #   it 'should create a new contact' do
  #     stub_post(path).with(body: params, headers: set_headers).to_return(body: response_contact_xml, status: 200)
  #     response = @client.create_contact(params)
  #     response.should_not be_nil
  #     response.contact.id.should == 1
  #   end
  # end
  # 
  # describe ':contact_update' do
  #   it 'should update a contact' do
  #     stub_put(path(1)).with(body: params, headers: set_headers).to_return(body: response_contact_xml, status: 200)
  #     response = @client.update_contact(1, params)
  #     response.should_not be_nil
  #     response.contact.id.should == 1
  #   end
  # end

  describe ':contact_destroy' do
    it 'should remove a single contact' do
      stub_delete(path(1), 'secret-key').with(headers: set_headers).to_return(body: response_contact_xml, status: 200)
      response = @client.destroy_contact(1)
      response.should_not be_nil
      response.contact.id.should == 1
    end
  end

  def path(id = nil)
    if id
      "contacts/#{id}.json"
    else
      "contacts.json"
    end
  end

  def params
    {
      'contact[first_name]'     => 'New',
      'contact[last_name]'      => 'User',
      'contact[active]'         => true,
      'contact[email]'          => 'new.user@testing.com',
      'contact[note]'           => 'This user was created for testing.',
      'contact[phone_number_1]' => '987-0798-6578'
    }
  end

  def response_contacts_xml
    <<-done
    {"contacts": [
      {
        "active":true,
        "address":null,
        "basecamp_id":null,
        "company_name":"company name",
        "created_at":"2008-05-15T14:00:01Z",
        "first_name":"first",
        "google_id":null,
        "highrise_id":null,
        "id":1,
        "is_contractor":false,
        "is_employee":false,
        "last_name":"contact",
        "name":"contact, first",
        "note":null,
        "updated_at":"2008-05-15T14:00:01Z",
        "email":"sjdf@lsdjf.com",
        "phone_number_1":"555-555-1212",
        "phone_number_2":null
      },
      {
        "active":true,
        "address":null,
        "basecamp_id":null,
        "company_name":"company name",
        "created_at":"2008-05-15T14:00:01Z",
        "first_name":"first",
        "google_id":null,
        "highrise_id":null,
        "id":1,
        "is_contractor":false,
        "is_employee":false,
        "last_name":"contact",
        "name":"contact, first",
        "note":null,
        "updated_at":"2008-05-15T14:00:01Z",
        "email":"sjdf@lsdjf.com",
        "phone_number_1":"555-555-1212",
        "phone_number_2":null
      }
    ]}
    done
  end
  
  def response_contact_xml
    <<-done
    {"contact":
      {
        "active":true,
        "address":null,
        "basecamp_id":null,
        "company_name":"company name",
        "created_at":"2008-05-15T14:00:01Z",
        "first_name":"first",
        "google_id":null,
        "highrise_id":null,
        "id":1,
        "is_contractor":false,
        "is_employee":false,
        "last_name":"contact",
        "name":"contact, first",
        "note":null,
        "updated_at":"2008-05-15T14:00:01Z",
        "email":"sjdf@lsdjf.com",
        "phone_number_1":"555-555-1212",
        "phone_number_2":null
      }
    }
    done
  end

end