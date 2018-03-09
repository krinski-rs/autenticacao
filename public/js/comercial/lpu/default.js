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
    	            	    console.log( previousValue );
        	              $.ajax({
        	            	  url: "/comercial/lpu",
        	            	  dataType: "html",
        	            	  method: "GET"
        	              }).done(function( html ) {
//        	            	    console.log( html );
        	            	  $($( '#' + mutation.target.id + ' :first-child').attr('href')).empty().append(html);
        	            	    console.log( $( '#' + mutation.target.id + ' :first-child').attr('href') );
        	              });
        	            }
        	        	previousValue = mutation.target.style.display;
        	        }
        		}
        	);
        }
    );
	observer.observe( target, { attributes: true } );
});
