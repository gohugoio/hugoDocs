var i;
//window.addEventListener("load", function() {

	// store tabs variable
	var allTabs = document.querySelectorAll("[data-toggle-tab]");
	var allPanes = document.querySelectorAll("[data-panel]");

	function toggleTabs(event) {

		if(event.target){
			event.preventDefault();
			var clickedTab = event.currentTarget;
			var targetKey = clickedTab.getAttribute("data-toggle-tab")
		}else {
			var targetKey = event
		}
		if(window.localStorage){
			window.localStorage.setItem("configLangPref", targetKey)
		}
		var selectedTabs = document.querySelectorAll("[data-toggle-tab='" + targetKey + "']");
		var selectedPanes = document.querySelectorAll("[data-panel='" + targetKey + "']");

		for (var i = 0; i < allTabs.length; i++) {
			allTabs[i].classList.remove("active", "bg-near-white");
			allPanes[i].classList.remove("active");
		}

		for (var i = 0; i < selectedTabs.length; i++) {
			selectedTabs[i].classList.add("active", "bg-near-white");
			selectedPanes[i].classList.add("active");
		}

	}

	for (i = 0; i < allTabs.length; i++) {
		allTabs[i].addEventListener("click", toggleTabs)
	}

	if(window.localStorage.getItem('configLangPref')) {
		toggleTabs(window.localStorage.getItem('configLangPref'))
	}
//});
