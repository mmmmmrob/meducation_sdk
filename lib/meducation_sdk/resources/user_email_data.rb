module MeducationSDK
  class UserEmailData < Loquor::Resource
    self.path = "/user_email_data"
  end


  class UserEmailDataMock < UserEmailData
    extend Loquor::ResourceMock

    self.attributes = {
    	
    }
  end

end
