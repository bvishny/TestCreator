class UtilController < ApplicationController
	def create_parts
	 part = Part.new
	 part.ref = "mc-question"
	 part.type2 = 4
	 part.text = "Which of the following is the correct answer?"
	 part.points = 1.0
	 part.c1 = "Choice A"
	 part.c2 = "Choice B"
	 part.c3 = "Choice C"
	 part.c4 = "Choice D"
	 part.c5 = "Choice E"
	 part.answer = "A"
	 part.save!
	 
	 part = Part.new
	 part.ref = "header"
	 part.type2 = 1
	 part.text = "This is a header. Click to edit."
	 part.save!
	
	 part = Part.new
	 part.ref = "exact-answer"
	 part.type2 = 5
	 part.text = "What is the answer to this question?"
	 part.points = 1.0
	 part.c1 = "Insert units here (e.g m, cm2, kg)"
	 part.answer = "answer"
	 part.save!
	 
	 part = Part.new
	 part.ref = "text-section"
	 part.type2 = 2
	 part.text = "This is a text section. Click to edit."
	 part.save!
	
	 part = Part.new
	 part.ref = "diagram"
	 part.type2 = 3
	 part.url = "/images/diagram.gif"
	 part.save!
	render :text => "Base library initialized."
	end
end

