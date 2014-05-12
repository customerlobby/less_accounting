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
  #     response = @client.contact_create(params)
  #     response.should_not be_nil
  #     response.contact.id.should == 1
  #   end
  # end
  # 
  # describe ':contact_update' do
  #   it 'should update a contact' do
  #     stub_post(path(1)).with(body: params, headers: set_headers).to_return(body: response_contact_xml, status: 200)
  #     response = @client.contact_update(1, params)
  #     response.should_not be_nil
  #     response.contact.id.should == 1
  #   end
  # end

  describe ':contact_destroy' do
    it 'should remove a single contact' do
      stub_delete(path(1), 'secret-key').with(headers: set_headers).to_return(body: response_contact_xml, status: 200)
      response = @client.contact_destroy(1)
      response.should_not be_nil
      response.contact.id.should == 1
    end
  end

  def path(id = nil)
    if id
      "contacts/#{id}.xml"
    else
      "contacts.xml"
    end
  end

  def params
    {
      'first_name'     => 'New',
      'last_name'      => 'User',
      'active'         => true,
      'email'          => 'new.user@testing.com',
      'note'           => 'This user was created for testing.',
      'phone_number_1' => '987-0798-6578'
    }
  end

  def response_contacts_xml
    <<-done
    <?xml version="1.0" encoding="UTF-8"?>
    <contacts type="array">
      <contact>
        <active type="boolean">true</active>
        <address nil="true"/>
        <basecamp-id type="integer" nil="true"/>
        <company-name nil="true"/>
        <created-at type="datetime">2008-05-15T14:00:01Z</created-at>
        <first-name>First</first-name>
        <google-id nil="true"/>
        <highrise-id type="integer" nil="true"/>
        <id type="integer">85</id>
        <is-contractor type="boolean" nil="true"/>
        <is-employee type="boolean">true</is-employee>
        <last-name>a</last-name>
        <name>a, First</name>
        <note nil="true"/>
        <updated-at type="datetime">2008-05-15T14:00:01Z</updated-at>
        <email></email>
        <phone-number-1 nil="true"/>
        <phone-number-2 nil="true"/>
      </contact>
      <contact>
        <active type="boolean">true</active>
        <address nil="true"/>
        <basecamp-id type="integer" nil="true"/>
        <company-name nil="true"/>
        <created-at type="datetime">2008-05-15T14:00:01Z</created-at>
        <first-name>First</first-name>
        <google-id nil="true"/>
        <highrise-id type="integer" nil="true"/>
        <id type="integer">85</id>
        <is-contractor type="boolean" nil="true"/>
        <is-employee type="boolean">true</is-employee>
        <last-name>a</last-name>
        <name>a, First</name>
        <note nil="true"/>
        <updated-at type="datetime">2008-05-15T14:00:01Z</updated-at>
        <email></email>
        <phone-number-1 nil="true"/>
        <phone-number-2 nil="true"/>
      </contact>
    </contacts>
    done
  end
  
  def response_contact_xml
    <<-done
    <?xml version="1.0" encoding="UTF-8"?>
    <contact>
      <active type="boolean">true</active>
      <address nil="true"/>
      <basecamp-id type="integer" nil="true"/>
      <company-name>company name</company-name>
      <created-at type="datetime">2008-05-15T14:00:01Z</created-at>
      <first-name>first</first-name>
      <google-id nil="true"/>
      <highrise-id type="integer" nil="true"/>
      <id type="integer">1</id>
      <is-contractor type="boolean">false</is-contractor>
      <is-employee type="boolean">false</is-employee>
      <last-name>contact</last-name>
      <name>contact, first</name>
      <note nil="true"/>
      <updated-at type="datetime">2008-05-15T14:00:01Z</updated-at>
      <email>sjdf@lsdjf.com</email>
      <phone-number-1>555-555-1212</phone-number-1>
      <phone-number-2 nil="true"/>
    </contact>
    done
  end

end