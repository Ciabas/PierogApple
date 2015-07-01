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
