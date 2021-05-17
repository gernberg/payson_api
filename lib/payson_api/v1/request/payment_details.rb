module PaysonAPI
  module V1
    module Request
      class PaymentDetails
        attr_accessor :token

        def initialize(token)
          @token = token
        end

        def to_hash
          { 'token' => @token }
        end
      end
    end
  end
end
