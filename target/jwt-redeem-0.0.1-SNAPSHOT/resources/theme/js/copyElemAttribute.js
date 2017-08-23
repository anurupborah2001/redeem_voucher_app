/**
 *  @author Anurup Borah 
 */
(function ($) {

    // Define the function here
    $.fn.copyAllElementAttributes = function(sourceElement) {

        // 'that' contains a pointer to the destination element
        var that = this;

        // Place holder for all attributes
        var allAttributes = ($(sourceElement) && $(sourceElement).length > 0) ?
            $(sourceElement).prop("attributes") : null;

        // Iterate through attributes and add    
        if (allAttributes && $(that) && $(that).length == 1) {
            $.each(allAttributes, function() {
                // Ensure that class names are not copied but rather added
                if (this.name == "class") {
                    $(that).addClass(this.value);
                } else {
                    that.attr(this.name, this.value);
                }

            });
        }

        return that;
    }; 

})(jQuery);