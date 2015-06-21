module ProfilesHelper

  def users_name(name)
    
    @students.each do |full_name|
      if name == full_name.first_name.downcase + full_name.last_name.downcase
        return full_name.first_name
      end
    end

  end

end
