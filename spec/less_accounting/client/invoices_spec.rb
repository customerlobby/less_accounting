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
  #     response = @client.create_invoice(params)
  #     response.should_not be_nil
  #     response.invoice.id.should == 1
  #   end
  # end
  # 
  # describe ':invoice_update' do
  #   it 'should update a invoice' do
  #     stub_put(path(1)).with(body: params, headers: set_headers).to_return(body: response_invoice_xml, status: 200)
  #     response = @client.update_invoice(1, params)
  #     response.should_not be_nil
  #     response.invoice.id.should == 1
  #   end
  # end

  describe ':invoice_destroy' do
    it 'should remove a single invoice' do
      stub_delete(path(1), 'secret-key').with(headers: set_headers).to_return(body: response_invoice_xml, status: 200)
      response = @client.destroy_invoice(1)
      response.should_not be_nil
      response.invoice.id.should == 1
    end
  end

  def path(id = nil)
    if id
      "invoices/#{id}.json"
    else
      "invoices.json"
    end
  end

  def params
    'invoice[contact_id]=5&invoice[due_on]=2008-05-15&invoice[payment_total]=125.00&invoice[total]=526.00&invoice[email_subject]=Invoice for business one'
  end

  def response_invoices_xml
    <<-done
    {"invoices": [
      { "amount_due":0.0,
        "bank_account_id":null,
        "business_id":1,
        "contact_id":null,
        "created_at":"2008-05-15T14:00:21Z",
        "currency_id":1,
        "due_on":"2008-05-15",
        "email_heading":"Please see the attached invoice.",
        "email_subject":"Invoice from bus1 - 1",
        "first_sent":null,
        "header":"",
        "id":1,
        "payment_total":0.0,
        "proposal_id":null,
        "proposal_template_id":null,
        "reference_name_number":"1",
        "sales_tax_amount":0.0,
        "sent_at":null,
        "sent_to":null, 
        "show_paypal":true,
        "total":0.0,
        "updated_at":"2008-05-15T14:00:21Z"
      },
      { "amount_due":0.0,
        "bank_account_id":null,
        "business_id":1,
        "contact_id":null,
        "created_at":"2008-05-15T14:00:21Z",
        "currency_id":1,
        "due_on":"2008-05-15",
        "email_heading":"Please see the attached invoice.",
        "email_subject":"Invoice from bus1 - 1",
        "first_sent":null,
        "header":"",
        "id":2,
        "payment_total":0.0,
        "proposal_id":null,
        "proposal_template_id":null,
        "reference_name_number":"1",
        "sales_tax_amount":0.0,
        "sent_at":null,
        "sent_to":null, 
        "show_paypal":true,
        "total":0.0,
        "updated_at":"2008-05-15T14:00:21Z"
      }
    ]}
    done
  end

  def response_invoice_xml
    <<-done
    { "invoice":
      { "amount_due":0.0,
        "bank_account_id":null,
        "business_id":1,
        "contact_id":null,
        "created_at":"2008-05-15T14:00:21Z",
        "currency_id":1,
        "due_on":"2008-05-15",
        "email_heading":"Please see the attached invoice.",
        "email_subject":"Invoice from bus1 - 1",
        "first_sent":null,
        "header":"",
        "id":1,
        "payment_total":0.0,
        "proposal_id":null,
        "proposal_template_id":null,
        "reference_name_number":"1",
        "sales_tax_amount":0.0,
        "sent_at":null,
        "sent_to":null, 
        "show_paypal":true,
        "total":0.0,
        "updated_at":"2008-05-15T14:00:21Z"
      }
    }
    done
  end
end
