$(document).ready(function() {
	$(".add_new_image").click(function(){
		add_program_image();
		return false;
	});
});
function add_program_image(){
  var newId = $(".program_image").length - 1;
	cloned_id = newId;
	newId += 1;
	$('.program_image:last')
		.after($(".program_image:last")
		.clone()
		.attr("class", "program_image"));
	$('.program_image:last a').remove();

	$(".program_image:last p input")
		.attr("id", "program_program_images_attributes_" + newId + "_attachment")
		.attr("name", "program[program_images_attributes][" + newId + "][attachment]")
		
//	cloned_id = newId;
//	newId += 1;
//	$('.program_image:last')
//		.after($(".program_image:last")
//		.clone()
//		.attr("id", "program_image_" + newId)
//		.attr("class", "clonedInput"));
//	$('#program_image_' + cloned_id + " a").remove();
//
//	$("#program_image_" + newId + " p input")
//		.attr("id", "program_program_images_attributes_" + newId + "_attachment")
//		.attr("name", "program[program_images_attributes][" + newId + "][attachment]")
//		$(".add_new_image").click(function(){
//			add_program_image();
//			return false;
//		});
}