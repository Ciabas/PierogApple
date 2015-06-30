// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sass
//= require_tree .

//Morris charts snippet - js

$.getScript('http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js',function(){
$.getScript('http://cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.0/morris.min.js',function(){
  
  Morris.Line({
        element: 'line-example',
        data: [
          {year: '2010', value: 20, value2: 15},
          {year: '2011', value: 10, value2: 12},
          {year: '2012', value: 5, value2: 4},
          {year: '2013', value: 2, value2: 5},
          {year: '2014', value: 20, value2: 26}
        ],
        xkey: 'year',
        ykeys: ['value','value2'],
        labels: ['Value','value2']
      });
      
  
});
});
