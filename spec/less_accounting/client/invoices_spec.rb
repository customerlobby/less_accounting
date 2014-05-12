require 'spec_helper'

describe LessAccounting::Client::Invoices do
  
  before do
    @client = LessAccounting.client({username: 'tester', password: 'testing', domain: 'testdomain', api_key: 'secret-key'})
  end
  
  describe ':invoices' do
    it 'should retrieve a list of invoices' do
      stub_get(path, 'secret-key').with(headers: set_headers).to_return(body: response_invoices_xml, status: 200)
      response = @client.invoices
      response.should_not be_nil
      response.invoices.size.should == 2
    end
  end
  
  describe ':invoice' do
    it 'should retrieve a single invoice' do
      stub_get(path(1), 'secret-key').with(headers: set_headers).to_return(body: response_invoice_xml, status: 200)
      response = @client.invoice(1)
      response.should_not be_nil
      response.invoice.id.should == 1
    end
  end

  # describe ':invoice_create' do
  #   it 'should create a new invoice' do
  #     stub_post(path).with(body: params, headers: set_headers).to_return(body: response_invoice_xml, status: 200)
  #     response = @client.invoice_create(params)
  #     response.should_not be_nil
  #     response.invoice.id.should == 1
  #   end
  # end
  # 
  # describe ':invoice_update' do
  #   it 'should update a invoice' do
  #     stub_post(path(1)).with(body: params, headers: set_headers).to_return(body: response_invoice_xml, status: 200)
  #     response = @client.invoice_update(1, params)
  #     response.should_not be_nil
  #     response.invoice.id.should == 1
  #   end
  # end

  describe ':invoice_destroy' do
    it 'should remove a single invoice' do
      stub_delete(path(1), 'secret-key').with(headers: set_headers).to_return(body: response_invoice_xml, status: 200)
      response = @client.invoice_destroy(1)
      response.should_not be_nil
      response.invoice.id.should == 1
    end
  end

  def path(id = nil)
    if id
      "invoices/#{id}.xml"
    else
      "invoices.xml"
    end
  end

  def response_invoices_xml
    <<-done
    <?xml version="1.0" encoding="UTF-8"?>
    <invoices type="array">
      <invoice>
        <amount-due type="decimal">85.2</amount-due>
        <bank-account-id type="integer">1</bank-account-id>
        <business-id type="integer">1</business-id>
        <contact-id type="integer">1</contact-id>
        <created-at type="datetime">2007-01-01T00:00:00Z</created-at>
        <currency-id type="integer">1</currency-id>
        <due-on type="date">2007-01-01</due-on>
        <email-heading>Please see the attached invoice.</email-heading>
        <email-subject>Invoice from bus1 - invoice 1</email-subject>
        <first-sent type="datetime">2007-01-01T00:00:00Z</first-sent>
        <header nil="true"/>
        <id type="integer">11</id>
        <payment-total type="decimal">0.0</payment-total>
        <proposal-id type="integer" nil="true"/>
        <proposal-template-id type="integer">1</proposal-template-id>
        <reference-name-number>invoice 1</reference-name-number>
        <sales-tax-amount type="decimal">0.0</sales-tax-amount>
        <sent-at type="datetime">2007-01-01T00:00:00Z</sent-at>
        <sent-to nil="true"/>
        <show-paypal type="boolean">true</show-paypal>
        <total type="decimal">85.2</total>
        <updated-at type="datetime">2007-01-01T00:00:00Z</updated-at>
      </invoice>
      <invoice>
        <amount-due type="decimal">85.2</amount-due>
        <bank-account-id type="integer">1</bank-account-id>
        <business-id type="integer">1</business-id>
        <contact-id type="integer">1</contact-id>
        <created-at type="datetime">2007-01-01T00:00:00Z</created-at>
        <currency-id type="integer">1</currency-id>
        <due-on type="date">2007-01-01</due-on>
        <email-heading>Please see the attached invoice.</email-heading>
        <email-subject>Invoice from bus1 - invoice 1</email-subject>
        <first-sent type="datetime">2007-01-01T00:00:00Z</first-sent>
        <header nil="true"/>
        <id type="integer">11</id>
        <payment-total type="decimal">0.0</payment-total>
        <proposal-id type="integer" nil="true"/>
        <proposal-template-id type="integer">1</proposal-template-id>
        <reference-name-number>invoice 1</reference-name-number>
        <sales-tax-amount type="decimal">0.0</sales-tax-amount>
        <sent-at type="datetime">2007-01-01T00:00:00Z</sent-at>
        <sent-to nil="true"/>
        <show-paypal type="boolean">true</show-paypal>
        <total type="decimal">85.2</total>
        <updated-at type="datetime">2007-01-01T00:00:00Z</updated-at>
      </invoice>
    </invoices>
    done
  end

  def response_invoice_xml
    <<-done
    <?xml version="1.0" encoding="UTF-8"?>
    <invoice>
      <amount-due type="decimal">85.2</amount-due>
      <bank-account-id type="integer">1</bank-account-id>
      <business-id type="integer">1</business-id>
      <contact-id type="integer">1</contact-id>
      <created-at type="datetime">2007-01-01T00:00:00Z</created-at>
      <currency-id type="integer">1</currency-id>
      <due-on type="date">2007-01-01</due-on>
      <email-heading>Please see the attached invoice.</email-heading>
      <email-subject>Invoice from bus1 - invoice 1</email-subject>
      <first-sent type="datetime">2007-01-01T00:00:00Z</first-sent>
      <header nil="true"/>
      <id type="integer">1</id>
      <payment-total type="decimal">0.0</payment-total>
      <proposal-id type="integer" nil="true"/>
      <proposal-template-id type="integer">1</proposal-template-id>
      <reference-name-number>invoice 1</reference-name-number>
      <sales-tax-amount type="decimal">0.0</sales-tax-amount>
      <sent-at type="datetime">2007-01-01T00:00:00Z</sent-at>
      <sent-to nil="true"/>
      <show-paypal type="boolean">true</show-paypal>
      <total type="decimal">85.2</total>
      <updated-at type="datetime">2007-01-01T00:00:00Z</updated-at>
    </invoice>
    done
  end
end
