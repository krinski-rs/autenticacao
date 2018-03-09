$( document ).ready(function() {
	var target = document.querySelector( '#icon_dock_pessoa' );
	var previousValue = target.style.display;

	var observer = new MutationObserver(
        function(mutations) {
        	mutations.forEach(
        		function( mutation ){
        	        if (mutation.attributeName !== 'style') return;
        	        var currentValue = mutation.target.style.display;
        	        if (currentValue !== previousValue) {
        	        	if (previousValue === "none" && currentValue !== "none") {
        	              console.log("display none has just been removed!");
        	            }
        	        	previousValue = mutation.target.style.display;
        	        }
        		}
        	);
        }
    );
	observer.observe( target, { attributes: true } );
});
