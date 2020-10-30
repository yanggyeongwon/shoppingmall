
$(()=>{

	    mainpage_effect();
		$('.noshow').on('click',function(){
			alert("준비중 입니다.")
		})
		
	    $(document).ready(function(){
	        $(window).scroll(function(){
	          if($(this).scrollTop() > 200 ){
	            $(".totop_arrow1").fadeIn();
	          }else{
	            $(".totop_arrow1").fadeOut();
	          }
	        });
	        $(".totop_arrow1").click(function(){
	          $("html, body").animate({
	              scrollTop : 0
	          },400);
	          return false;
	        });
	
	 		let fileTarget = $('#input_img_btn .upload-hidden');
			
			    fileTarget.on('change', function(){
			        if(window.FileReader){
			            var filename = $(this)[0].files[0].name;
			        } else {
			            var filename = $(this).val().split('/').pop().split('\\').pop();
			        }
			
			        $(this).siblings('.upload-name').val(filename);
			    });
	
			
	     });
		const real_img = $("#image img").attr('src')
		$('.sub_image img').on({
			mouseenter:function(){
				let img_index = $(this).index();
				console.log(img_index)
				let change_img = $('.sub_image img').eq(img_index).attr('src');
				$("#image img").attr('src', change_img);
			},
			mouseleave: function(){
				$("#image img").attr('src', real_img);
				
			}
		})
	    $("#mypage span").hide();
	    $("#mypage").on({
	        mouseenter: function() {
		
	            $("#mypage span").show();
	        },
	        mouseleave: function() {
	            $("#mypage span").hide()
	        }
	    })
	    
	    $("#basket span").hide();
	    $("#basket").on({
	        mouseenter: function() {
	            $("#basket span").show();
	        },
	        mouseleave: function() {
	            $("#basket span").hide()
	        }
	    })
    
	    function mainpage_effect(){
	        $("#images img:gt(0)").hide();
	        setInterval(function() { 
	            $('#images img:first').fadeOut(1000).next().fadeIn(1000).end().appendTo('#images');
	        },3000);
	    }
	   
	
	    $(".menu").hover(function(){
	        console.log("메뉴 오버")
	        $(this).toggleClass("menu_color")
	    })
	
	    $(".images_show").hover(function(){
	        $(this).toggleClass("images_scale")
	    })
	
	    $(".images_show a").hide();
	    $(".images_show").on({
	        mouseenter: function() {
	            const images_index = $(".images_show").index(this);
	            $(".images_show a").eq(images_index).show();
	        },
	        mouseleave: function() {
	            $(".images_show a").hide()
	        }
	    })
	    $("#filter").click(function(){
	        console.log("filter");
	        $(".product_list_btn_hover").toggleClass("active")
	        $("#product_list_btn").slideToggle();
	
	    })


	    //메뉴 스크롤 이벤트
	    let user_scroll;
	    let scroll_top = 0;
	    let start_scroll = 2;
	    const nav_height = $(".menu").outerHeight();
	
	    $(window).scroll(function(e){
	        user_scroll = true;
	    })
	
	    setInterval(function(){
	        if(user_scroll){
	            scrolls();
	            user_scroll = false;
	        }
	    },1000);
	
	    function scrolls(){
	        var st = $(this).scrollTop();
	
	        if(Math.abs(scroll_top - st) <= start_scroll)
	            return;
	        if(st > scroll_top && st > nav_height){
	            $(".menu").stop().animate({top: -100})
	        }else{
	            if(st + $(window).height() < $(document).height()){
	                $(".menu").stop().animate({top: 0})
	            }
	        }
	        scroll_top = st;
	    }
	
	
	

		
		$('#items').change(function(){
				if($('#items').val() == "*"){
					alert("색상을 선택하세요")
				}else{
					 $('#items2').find('option:first').prop('selected', 'selected');
				}
		})
		$('#items2').change(function(){
			if($('#items').val() == "*"){
				alert("색상을 선택하세요")
			}else{
				let i= 1;
				let name = $('.product_pname').text();
				let items_selec1 = $('#items option:selected').val();
				let items_selec2 = $('#items2 option:selected').val();
				let items_price = $('#product_price').text();
				let wrap_len = $('.wrap').length;
				const compare = items_selec1+"/"+items_selec2;
		
				let aa = $('.compare').text() // 블랙/L블루/M
				if($('#items_result_p').text() == ""){
					$('#items_result_p').append("<div class='wrap'><div><div class='place'><span>"+name+" - </span><div class='compare'>"+items_selec1+"/"+items_selec2+"</div></div><div class='wraps'><input type='text' name='stock' value='"+i+"'><a class='up_btn'></a><a class='do_btn'></a></div><div class='price'><p>"+items_price+"<a class='remove_tag'></a></p></div></div></div>")
					$('.items_price').append("\\<p>"+items_price+"</p>")
				}else{
					if(aa.includes(compare)){
						 alert('이미 선택한 상품입니다.')
						 $('#items').find('option:first').prop('selected', 'selected');
					 	 $('#items2').find('option:first').prop('selected', 'selected');
					}else{
						$('#items_result_p').append("<div class='wrap'><div><div class='place'><span>"+name+" - </span><span class='compare'>"+items_selec1+"/"+items_selec2+"</span></div><div class='wraps'><input type='text' name='stock' value='"+i+"'><a class='up_btn'></a><a class='do_btn'></a></div><div class='price'><p>"+items_price+"<a class='remove_tag'></a></p></div></div></div>")
					}
				}
				sumthingjustlikethis()
			}
		})
	
		$(document).on("click", ".remove_tag", function(){
			let remove_tag = $('.remove_tag').index(this);
			console.log('wrap: '+remove_tag)
			$('.wrap').eq(remove_tag).remove();
		})
		

		$(document).on("click", ".up_btn", function(){
			let wraps = $('.up_btn').index(this);
			let stock_value = $('input[name="stock"]').eq(wraps).val()
			$('input[name="stock"]').eq(wraps).val(stock_value*1+1);
			
			let input_val = $('input[name="stock"]').eq(wraps).val();
			let items_price = $('#product_price').text();
			let plus_items = input_val*items_price;
			$('.price p').eq(wraps).html(plus_items +"<a class='remove_tag'></a>");

			sumthingjustlikethis()
		})
	
		$(document).on("click", ".do_btn", function(){
			let wraps = $('.do_btn').index(this);
			let stock_value = $('input[name="stock"]').eq(wraps).val()
			if($('input[name="stock"]').eq(wraps).val() <= 1){

				alert('최소갯수는 1개 입니다.')
				$('input[name="stock"]').eq(wraps).val("1");
			}else{
				$('input[name="stock"]').eq(wraps).val(stock_value*1-1);
				let input_val = $('input[name="stock"]').eq(wraps).val();
				let items_price = $('#product_price').text();
				let miu_items = input_val * items_price;
				$('.price p').eq(wraps).html(miu_items +"<a class='remove_tag'></a>");

				sumthingjustlikethis()
			}
		})
		
		function sumthingjustlikethis(){
			console.log("들어왔다")
			let sumthing = 0 ;
			let items_price = $('#product_price').text();
			for(let i=0; i<$('.wrap').length;i++){
				sumthing += parseInt($('input[name="stock"]').eq(i).val());
			}
			let sum = sumthing * items_price
			$('.items_price p').html(sum+"<span>("+sumthing+"개)</span>")
		
		}
	 	
		
		
		
		
		
});
