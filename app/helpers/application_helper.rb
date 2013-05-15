module ApplicationHelper
  def are_you_here?(control,act=nil)
		control = control.downcase
		if act.nil?
			return control == controller.controller_name.downcase
		else
			act = act.downcase
			return (controller.controller_name.downcase == control and controller.action_name.downcase == act)
		end
	end
	
	def options_for_interests
	  programs = Program.all
    interests = Hash.new
    programs.each do |program| 
      interests[program.id] = program.name
    end
    interests[100] = "Otro"
    return interests.sort_by {|id, name| id}
  end
	
end
