
	

	function toggleDarkMode()
	{
		var dataTheme = $('body').attr('data-theme');
		
		if(dataTheme === 'dark') {	
			sessionStorage.setItem("theme", "light");
		    sessionStorage.setItem("button","off");
		    $('body').attr('data-theme', 'light');
		    $(".toggle").removeClass("toggle-on");
		} else {
		    sessionStorage.setItem("theme", "dark");
		    sessionStorage.setItem("button","on");
		    $('body').attr('data-theme', 'dark');
		    $(".toggle").addClass("toggle-on");
		}
	};
	

	function verifyDarkMode() {

		if(sessionStorage.getItem('theme') == '' && sessionStorage.getItem('button') == '' || sessionStorage.getItem('button') == 'off')
		{
		    $('body').attr('data-theme', 'light');
		    $(".toggle").removeClass("toggle-on");
		}
		else
		{
		    theme = sessionStorage.getItem('theme');
		    button = sessionStorage.getItem('button');
		    console.log(theme);
		    console.log(button);
		    $('body').attr('data-theme',theme);
		    $('.toggle').addClass('toggle-' + button);
		}
	};
