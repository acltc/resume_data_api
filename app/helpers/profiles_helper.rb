module ProfilesHelper

  def users_name(name)
    
    @students.each do |full_name|
      user_name = full_name.first_name.downcase + full_name.last_name.downcase
      if user_name == name
        return full_name.first_name
      else
                
      end
    end

  end

end
