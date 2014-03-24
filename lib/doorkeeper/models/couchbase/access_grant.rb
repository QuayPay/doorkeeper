module Doorkeeper
  class AccessGrant < ::Couchbase::Model
    design_document :dk_ag

    attribute :resource_owner_id, :application_id, :token, :expires_in, :redirect_uri, :revoked_at

  	def self.authenticate(token)
      by_token({:key => token})
    end
  end
end