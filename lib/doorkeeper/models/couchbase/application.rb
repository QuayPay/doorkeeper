module Doorkeeper
  class Application < ::Couchbase::Model
    design_document :dk_app

    attribute   :name, :secret, :redirect_uri
    attribute :created_at, :default => lambda { Time.now.to_i }
    alias_attribute :uid, :id

    before_create :generate_uid, :generate_secret
    view :by_uid_and_secret, :show_all, :by_user_id

    def self.authorized_for(resource_owner)
      AccessToken.where_owner_id(resource_owner.id)
    end

    def self.authenticate(uid, secret)
      by_uid_and_secret({:key => [uid, secret]})
    end

    def self.by_uid(uid)
      find_by_id(uid)
    end

    def self.by_user(id)
      by_user_id({:key => [id], :stale => false})
    end
    
    def self.all
      show_all({:key => nil, :include_docs => true, :stale => false})
    end

    private

    def generate_uid
      self.id = UniqueToken.generate
    end

    def generate_secret
      self.secret = UniqueToken.generate
    end
  end
end
