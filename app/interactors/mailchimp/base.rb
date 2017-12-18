module Mailchimp
  module Base
    def gibbon
      @gibbon ||= Gibbon::Request.new
    end

    def list_by_name(list_name)
      gibbon.lists.retrieve.body['lists'].find { |list| list['name'] == list_name }
    end

    def hashed_email(email)
      Digest::MD5.new.hexdigest(email)
    end
  end
end
