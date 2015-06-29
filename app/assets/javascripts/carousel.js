#carousel-example-generic.carousel.slide{"data-ride" => "carousel"}
  // Indicators
  %ol.carousel-indicators
    %li.active{"data-slide-to" => "0", "data-target" => "#carousel-example-generic"}
    %li{"data-slide-to" => "1", "data-target" => "#carousel-example-generic"}
    %li{"data-slide-to" => "2", "data-target" => "#carousel-example-generic"}
  // Wrapper for slides
  .carousel-inner{:role => "listbox"}
    .item.active
      %img{:alt => "...", :src => "..."}/
      .carousel-caption
        //...
    .item
      %img{:alt => "...", :src => "..."}/
      .carousel-caption
        //...
    //...
  // Controls
  %a.left.carousel-control{"data-slide" => "prev", :href => "#carousel-example-generic", :role => "button"}
    %span.glyphicon.glyphicon-chevron-left{"aria-hidden" => "true"}
    %span.sr-only Previous
  %a.right.carousel-control{"data-slide" => "next", :href => "#carousel-example-generic", :role => "button"}
    %span.glyphicon.glyphicon-chevron-right{"aria-hidden" => "true"}
    %span.sr-only Next
