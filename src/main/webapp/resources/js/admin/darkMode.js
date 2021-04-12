	
	/* 다크모드 스위치 위 텍스트 토글*/
	$(".toggle").click(function (e) {
	    $(this).toggleClass("toggle-on");
	});

	/* 다크모드 토글 */
	function toggleDarkMode() {
	    var dataTheme = $('body').attr('data-theme');

	    if(dataTheme === 'dark') {
	        $('body').attr('data-theme', 'light');
	    } else {
	        $('body').attr('data-theme', 'dark');
	    }
	};	
	