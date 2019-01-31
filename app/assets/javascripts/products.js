<script type="text/javascript">
window.onload = function () {
    autoScroll();
}
var $scrollX = 0;
function autoScroll() {
    var $sampleBox = document.getElementById( "sampleBox" );
    $sampleBox.scrollLeft = ++$scrollX;
    if( $scrollX < $sampleBox.scrollWidth - $sampleBox.clientWidth ){
        setTimeout( "autoScroll()", 20 );
    }else{
        $scrollX = 0;
        $sampleBox.scrollLeft = 0;
        setTimeout( "autoScroll()", 20 );
    }
}
</script>