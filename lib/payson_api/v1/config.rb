# frozen_string_literal: true

module PaysonAPI
  module V1
    extend self

    PAYSON_WWW_HOST = "https://%s.payson.se"
    PAYSON_WWW_PAY_FORWARD_URL = "/paysecure/?token=%s"

    PAYSON_API_ENDPOINT = "https://api.payson.se"
    PAYSON_API_VERSION = "1.0"
    PAYSON_API_PAY_ACTION = "Pay"
    PAYSON_API_PAYMENT_DETAILS_ACTION = "PaymentDetails"
    PAYSON_API_PAYMENT_UPDATE_ACTION = "PaymentUpdate"
    PAYSON_API_PAYMENT_VALIDATE_ACTION = "Validate"

    PAYSON_API_TEST_ENDPOINT = "https://test-api.payson.se"

    LOCALES = %w[SV EN FI]
    CURRENCIES = %w[SEK EUR]
    FEES_PAYERS = %w[EACHRECEIVER SENDER PRIMARYRECEIVER SECONDARYONLY]
    FUNDING_CONSTRAINTS = %w[CREDITCARD BANK INVOICE SMS]
    GUARANTEE_OFFERINGS = %w[OPTIONAL REQUIRED NO]
    PAYMENT_STATUSES = %w[CREATED PENDING PROCESSING COMPLETED CREDITED
      INCOMPLETE ERROR EXPIRED REVERSALERROR ABORTED]
    PAYMENT_TYPES = %w[TRANSFER GUARANTEE INVOICE]
    GUARANTEE_STATUSES = %w[WAITINGFORSEND WAITINGFORACCEPTANCE WAITINGFORRETURN
      WAITINGFORRETURNACCEPTANCE RETURNNOTACCEPTED NOTRECEIVED RETURNNOTRECEIVED
      MONEYRETURNEDTOSENDER RETURNACCEPTED
    ]
    INVOICE_STATUSES = %w[PENDING ORDERCREATED CANCELED SHIPPED DONE CREDITED]
    PAYMENT_ACTIONS = %w[CANCELORDER SHIPORDER CREDITORDER REFUND]

    def configure(&block)
      yield @config ||= Configuration.new
    end

    def config
      @config
    end

    class Configuration
      attr_accessor :api_user_id, :api_password, :test_mode
    end

    configure do |config|
      config.api_user_id = 'XXXX'
      config.api_password = 'XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX'
    end

    def test?
      @config.test_mode || @config.api_user_id == '4'
    end

    def api_base_url
      test? ? PAYSON_API_TEST_ENDPOINT : PAYSON_API_ENDPOINT
    end

  end
end
